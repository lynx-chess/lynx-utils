&"cutechess-1.3.1-win64/cutechess-cli.exe" `
    -engine conf="Lynx 1.10.0" `
    -engine conf="Weiss 2.0" `
    -engine conf="Pedantic 2.0.0" `
    -engine conf="Wasp 5.00" `
    -engine conf="Zahak 9.0" `
    -engine conf="DanaSah 9.1" `
    -engine conf="Black Marlin 5.0" `
    -engine conf="Clover 2.4" `
    -engine conf="Stash 33.0" `
    -engine conf="Arcanum 2.5" `
    -engine conf="StockNemo 5.7.0.0" `
    -engine conf="Leorik 3.0.1" `
    -engine conf="Seer 2.1.0" `
    -each `
        tc=inf/40+0.4 `
        option.Hash=256 `
    -games 2 -rounds 500 -repeat -maxmoves 400 -srand 1692649580 `
    -openings file="books\8moves_v3.epd" format=epd order=random `
    -tournament "gauntlet" -seeds 1 `
    -concurrency 8 `
    -outcomeinterval 10 -ratinginterval 10 -resultformat wide2 `
    -recover `
    -pgnout "matches\gauntlet-1.11.0-ltc.pgn" `
| tee last-gauntlet.txt
    # -draw movenumber=30 movecount=12 score=15 `
    # -resign movecount=12 score=600 twosided=true `


    # " -event "Gauntlet $((Get-Date).ToString('yyyy-MM-dd_HH-mm'))" `
    # -engine conf="Weiss 1.4" `


