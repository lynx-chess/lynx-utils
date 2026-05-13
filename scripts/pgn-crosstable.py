#!/usr/bin/env python3
"""Generate a markdown crosstable from a PGN file.

The script only parses PGN headers, so it is fast even for large engine match files.
It expects `White`, `Black`, and `Result` tags for each game.
"""

from __future__ import annotations

import argparse
import re
import sys
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

HEADER_RE = re.compile(r'^\[(\w+)\s+"(.*)"\]$')
VALID_RESULTS = {"1-0", "0-1", "1/2-1/2"}


@dataclass
class PlayerStats:
    games: int = 0
    wins: int = 0
    losses: int = 0
    draws: int = 0
    points: float = 0.0

    @property
    def score_pct(self) -> float:
        return 0.0 if self.games == 0 else (self.points / self.games) * 100.0


@dataclass
class HeadToHead:
    games: int = 0
    wins: int = 0
    losses: int = 0
    draws: int = 0
    points: float = 0.0


@dataclass
class Game:
    white: str
    black: str
    result: str


def parse_games(pgn_path: Path) -> list[Game]:
    games: list[Game] = []
    headers: dict[str, str] = {}

    def flush_headers() -> None:
        nonlocal headers
        white = headers.get("White")
        black = headers.get("Black")
        result = headers.get("Result")

        if white and black and result in VALID_RESULTS:
            games.append(Game(white=white, black=black, result=result))

        headers = {}

    with pgn_path.open(encoding="utf-8", errors="replace") as handle:
        for raw_line in handle:
            line = raw_line.rstrip("\n")
            match = HEADER_RE.match(line)
            if match:
                headers[match.group(1)] = match.group(2)
                continue

            if not line.strip() and headers:
                flush_headers()

    if headers:
        flush_headers()

    return games


def build_tables(games: Iterable[Game]) -> tuple[dict[str, PlayerStats], dict[str, dict[str, HeadToHead]]]:
    players: dict[str, PlayerStats] = defaultdict(PlayerStats)
    matrix: dict[str, dict[str, HeadToHead]] = defaultdict(lambda: defaultdict(HeadToHead))

    for game in games:
        white = game.white
        black = game.black
        result = game.result

        players[white].games += 1
        players[black].games += 1
        matrix[white][black].games += 1
        matrix[black][white].games += 1

        if result == "1-0":
            players[white].wins += 1
            players[black].losses += 1
            players[white].points += 1.0

            matrix[white][black].wins += 1
            matrix[white][black].points += 1.0
            matrix[black][white].losses += 1
        elif result == "0-1":
            players[black].wins += 1
            players[white].losses += 1
            players[black].points += 1.0

            matrix[black][white].wins += 1
            matrix[black][white].points += 1.0
            matrix[white][black].losses += 1
        else:
            players[white].draws += 1
            players[black].draws += 1
            players[white].points += 0.5
            players[black].points += 0.5

            matrix[white][black].draws += 1
            matrix[black][white].draws += 1
            matrix[white][black].points += 0.5
            matrix[black][white].points += 0.5

    return dict(players), {player: dict(opponents) for player, opponents in matrix.items()}


def fmt_points(value: float) -> str:
    return f"{value:.1f}"


def format_cell(result: HeadToHead | None, show_records: bool) -> str:
    if result is None or result.games == 0:
        return ""

    base = f"{fmt_points(result.points)}/{result.games}"
    if not show_records:
        return base

    return f"{base} (+{result.wins} ={result.draws} -{result.losses})"


def render_markdown(
    players: dict[str, PlayerStats],
    matrix: dict[str, dict[str, HeadToHead]],
    *,
    show_records: bool,
) -> str:
    ordered_players = sorted(
        players,
        key=lambda name: (-players[name].points, -players[name].wins, name.lower()),
    )
    index_by_player = {name: idx for idx, name in enumerate(ordered_players, start=1)}

    headers = ["#", "Engine", *[str(index_by_player[name]) for name in ordered_players], "Pts", "Score", "W", "L", "D"]
    separator = ["---"] * len(headers)
    lines = [
        "| " + " | ".join(headers) + " |",
        "| " + " | ".join(separator) + " |",
    ]

    for player in ordered_players:
        row = [str(index_by_player[player]), player]
        for opponent in ordered_players:
            if player == opponent:
                row.append("—")
            else:
                row.append(format_cell(matrix.get(player, {}).get(opponent), show_records))

        stats = players[player]
        row.extend(
            [
                fmt_points(stats.points),
                f"{stats.score_pct:.1f}%",
                str(stats.wins),
                str(stats.losses),
                str(stats.draws),
            ]
        )
        lines.append("| " + " | ".join(row) + " |")

    lines.append("")
    lines.append("Legend:")
    lines.append("")
    lines.append("| # | Engine |")
    lines.append("| --- | --- |")
    for player in ordered_players:
        lines.append(f"| {index_by_player[player]} | {player} |")

    lines.append("")
    if show_records:
        lines.append("Cell format: `points/games (+wins =draws -losses)`")
    else:
        lines.append("Cell format: `points/games`")

    return "\n".join(lines)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("pgn", type=Path, help="Path to the PGN file")
    parser.add_argument(
        "-o",
        "--output",
        type=Path,
        help="Write the markdown crosstable to this file instead of stdout",
    )
    parser.add_argument(
        "--show-records",
        action="store_true",
        help="Include W-D-L details in each head-to-head cell",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    games = parse_games(args.pgn)

    if not games:
        print("No finished games with White/Black/Result headers were found.", file=sys.stderr)
        return 1

    players, matrix = build_tables(games)
    markdown = render_markdown(players, matrix, show_records=args.show_records)

    if args.output:
        args.output.write_text(markdown + "\n", encoding="utf-8")
    else:
        print(markdown)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
