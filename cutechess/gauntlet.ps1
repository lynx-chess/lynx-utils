&"cutechess-1.3.1-win64/cutechess-cli.exe" `
    -engine conf="Lynx 1.3.0" `
    -engine conf="Mess 0.3.0" `
    -engine conf="Odonata 0.7.0" `
    -engine conf="Zahak 5.0" `
    -engine conf="Akimbo 0.4.0" `
    -engine conf="Stash 21.0" `
    -engine conf="Polaris 1.5.0" `
    -engine conf="Pedantic 0.3.0" `
    -engine conf="MadChess 3.1" `
    -engine conf="Weiss 0.8" `
    -engine conf="Princhess 0.11.0" `
    -engine conf="Luna 2.0.0" `
    -engine conf="Leorik 2.0" `
    -each `
        tc=inf/40+0.4 `
        option.Hash=256 `
    -games 2 -rounds 500 -repeat 1 -maxmoves 400 -srand 1692649580 `
    -openings file="books\8moves_v3.epd" format=epd order=random `
	-tournament "gauntlet" -seeds 1 `
    -concurrency 8 `
    -outcomeinterval 10 `
    -ratinginterval 10 `
	-resultformat wide2 `
    -recover `
    -pgnout "matches\gautnet-x.y.z-ltc.pgn"
| tee last-gauntlet.txt

    # " -event "Gauntlet $((Get-Date).ToString('yyyy-MM-dd_HH-mm'))" `

    # -draw movenumber=30 movecount=12 score=15 `
    # -resign movecount=12 score=600 twosided=true