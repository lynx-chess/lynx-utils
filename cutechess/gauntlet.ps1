&"cutechess-1.3.1-win64/cutechess-cli.exe" `
    -engine conf="Lynx 1.7.0" `
    -engine conf="Pedantic 1.0.0" `
    -engine conf="Weiss 1.3" `
    -engine conf="Clarity 3.0.0" `
    -engine conf="Alexandria 2.3" `
    -engine conf="Midnight 7" `
    -engine conf="Stash 28.0" `
    -engine conf="Simbelmyne 1.9.0" `
    -engine conf="Lambergar 0.6.0" `
    -engine conf="Winter 0.8" `
    -engine conf="Altair 4.0.0" `
    -engine conf="Akimbo 0.5.0" `
    -each `
        tc=inf/40+0.4 `
        option.Hash=256 `
    -games 2 -rounds 500 -repeat 1 -maxmoves 400 -srand 1692649580 `
    -openings file="books\8moves_v3.epd" format=epd order=random `
    -tournament "gauntlet" -seeds 1 `
    -concurrency 8 `
    -outcomeinterval 10 -ratinginterval 10 -resultformat wide2 `
    -recover `
    -pgnout "matches\gauntlet-1.7.0-ltc.pgn" `
| tee last-gauntlet.txt

    # -draw movenumber=30 movecount=12 score=15 `
    # -resign movecount=12 score=600 twosided=true `

    # " -event "Gauntlet $((Get-Date).ToString('yyyy-MM-dd_HH-mm'))" `

	
