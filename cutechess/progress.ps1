&"cutechess-1.3.1-win64/cutechess-cli.exe" `
    -engine conf="Lynx 2099 - main" `
    -engine conf="Cosette 5.1" `
    -each `
        tc=inf/40+0.4 `
        option.Hash=256 `
    -games 2 -rounds 5000 -repeat 1 -maxmoves 400 -srand 1692649580 `
    -openings file="books\8moves_v3.epd" format=epd order=random `
    -tournament "gauntlet" -seeds 1 `
    -concurrency 8 `
    -outcomeinterval 10 `
    -ratinginterval 10 `
    -recover `
    -pgnout "matches\progress-x.y.z.pgn"
| tee last-progress.txt

    # " -event "Gauntlet $((Get-Date).ToString('yyyy-MM-dd_HH-mm'))" `
    # -recover -srand 6730291 `
    # -draw movenumber=30 movecount=12 score=15 `
    # -resign movecount=12 score=600 twosided=true