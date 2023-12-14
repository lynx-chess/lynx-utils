&"cutechess-1.3.1-win64\cutechess-cli.exe" `
	-engine conf="Lynx 2099 - main" `
	-engine conf="Lynx 2099 - main" `
	-each `
		tc=inf/8+0.08 `
		ponder `
		option.Hash=64 `
		option.Ponder=true `
	-games 2 -rounds 50000 -repeat 1 -maxmoves 400 -srand 1692649580 `
	-openings file="books\UHO_XXL_+0.90_+1.19.epd" format=epd order=random `
	-sprt elo0=0 elo1=5 alpha=0.05 beta=0.1 `
	-concurrency 8 `
	-recover `
	-ratinginterval 10 `
	-resultformat wide2 `
	-pgnout "matches\sprt-2099.pgn" `
	-resign movecount=3 score=500 twosided=true `
	-draw movenumber=40 movecount=8 score=10
| tee last-sprt.txt