&"cutechess-1.3.1-win64/cutechess-cli.exe" `
    -engine conf="Lynx 1.5.0" `
    -engine conf="Stash 25.0" `
    -engine conf="Simbelmyne 1.7.0" `
    -engine conf="Weiss 1.0" `
    -engine conf="Pedantic 0.4.1" `
    -engine conf="Polaris 1.6.1" `
    -engine conf="Altair 2.0.0" `
    -engine conf="Princhess 0.13.0" `
    -engine conf="Akimbo 0.4.1" `
    -engine conf="Inanis 1.2.1" `
    -engine conf="Leorik 2.4" `
    -engine conf="Zahak 6.2" `
    -engine conf="Odonata 0.8.0" `
    -each `
        tc=inf/40+0.4 `
        option.Hash=256 `
    -games 2 -rounds 500 -repeat 1 -maxmoves 400 -srand 1692649580 `
    -openings file="books\8moves_v3.epd" format=epd order=random `
    -tournament "gauntlet" -seeds 1 `
    -concurrency 8 `
    -outcomeinterval 10 -ratinginterval 10 -resultformat wide2 `
    -recover `
    -pgnout "matches\gautlet-1.5.0-ltc.pgn"
| tee last-gauntlet.txt

    # " -event "Gauntlet $((Get-Date).ToString('yyyy-MM-dd_HH-mm'))" `

    # -draw movenumber=30 movecount=12 score=15 `
    # -resign movecount=12 score=600 twosided=true