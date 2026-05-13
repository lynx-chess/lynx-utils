./cutechess-cli-1.3.1-linux64/cutechess-ob \
    -engine conf="Lynx-d220df4e" \
    -engine conf="Perseus-2d07444" \
    -engine conf="Potential-127e8ba9" \
    -engine conf="sirius-3bedea6" \
    -engine conf="stash-153b1e4" \
    -engine conf="weiss-95b0951" \
    -engine conf="stockfish-classical" \
    -each \
        tc=inf/40+0.4 \
        option.Hash=1024 \
        option.Threads=16 \
    -games 2 -rounds 1000 -repeat 1 -maxmoves 400 -srand 1692649580 \
    -openings file="books/UHO_Lichess_4852_v1.epd" format=epd order=random \
        -tournament "round-robin" \
    -concurrency 1 \
    -outcomeinterval 10 \
    -ratinginterval 10 \
    -resultformat wide2 \
    -recover \
    -pgnout "matches/round-robin-HCE-STC.pgn" \
    -event "Round-robin" \
2>&1 | tee last-round-robin.txt