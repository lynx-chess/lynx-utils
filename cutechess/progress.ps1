&"cutechess-1.3.1-win64/cutechess-cli.exe" `
    -engine conf="Lynx 1.10.0" `
    -engine conf="Lynx 1.9.1" `
    -each `
        tc=inf/40+0.4 `
        option.Hash=256 `
    -games 2 -rounds 5000 -repeat -maxmoves 400 -srand 1692649580 `
    -openings file="books\8moves_v3.epd" format=epd order=random `
    -tournament "gauntlet" -seeds 1 `
    -concurrency 8 `
    -outcomeinterval 10 `
    -ratinginterval 10 `
    -recover `
    -pgnout "matches\progress-1.10.0-ltc.pgn" `
| tee last-progress.txt
    # -draw movenumber=40 movecount=8 score=10 `
    # -resign movecount=3 score=400 twosided=true `

		# option.Threads=8 `
    # -engine conf="Lynx-1thread" option.Threads=1 `

		# option.Threads=1 `
		# ponder `
		# ponder `

    # " -event "Gauntlet $((Get-Date).ToString('yyyy-MM-dd_HH-mm'))" `
    #	ponder `
		# option.Threads=2 `
		# ponder `
