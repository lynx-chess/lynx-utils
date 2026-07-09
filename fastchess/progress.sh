./fastchess-linux-x86-64/fastchess \
    -engine dir="engines/Lynx-oom-bugfix" name="dev" \
    -engine dir="engines/Lynx-oom-bugfix" name="main" \
    -each \
        tc=6+0.06 \
        option.Hash=31 \
        option.Threads=1 \
        proto=uci \
        cmd="Lynx.Cli" \
    -concurrency 1 \
    -resign movecount=3 score=500 twosided=true \
    -draw movenumber=40 movecount=8 score=10 \
    -rounds 1000 -repeat \
    -openings file="../cutechess/books/UHO_Lichess_4852_v1.epd" format=epd order=random \
    -maxmoves 400 -srand 1692649580 -ratinginterval 10 \
    -pgnout file="matches/progress-oom-bugfix.pgn" \
    -recover \
    -log file=fastchess-logs.log level=info engine=true \
2>&1 | tee last-gauntlet.txt
