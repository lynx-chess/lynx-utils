./cutechess/cutechess-ob \
    -engine conf="4k.c 0.99" \
    -engine conf="Lynx 0.16.0" \
    -engine conf="Lynx 0.18.0" \
    -each \
        tc=inf/40+0.4 \
        option.Hash=256 \
    -games 2 -rounds 3000 -repeat 1 -maxmoves 400 -srand 1692649580 \
    -openings file="books/8moves_v3.epd" format=epd order=random \
        -tournament "gauntlet" -seeds 1 \
    -concurrency 8 \
    -outcomeinterval 10 \
    -ratinginterval 10 \
    -resultformat wide2 \
    -recover \
    -pgnout "matches/gautlet-4k-0.99-ltc.pgn" \
    -event "Gauntlet" \
2>&1 | tee last-gauntlet.txt