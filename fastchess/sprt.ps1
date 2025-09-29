&"fastchess-2a80921\fastchess-windows-latest.exe" `
    -engine dir="engines/Lynx-search-history-pruning-newformula-and-noisy-6598-win-x64" name="dev" `
    -engine dir="engines/Lynx-main-6592-win-x64" name="main" `
    -each `
        tc=8+0.08 `
        option.Hash=32 `
        option.Threads=1 `
        proto=uci `
        cmd="Lynx.Cli.exe" `
    -concurrency 8 `
    -resign movecount=3 score=500 twosided=true `
    -draw movenumber=40 movecount=8 score=10 `
    -rounds 200000 -repeat `
    -sprt elo0=0 elo1=3 alpha=0.05 beta=0.1 `
    -openings file="../cutechess/books/UHO_XXL_+0.90_+1.19.epd" format=epd order=random `
    -maxmoves 400 -srand 1692649580 -ratinginterval 10 `
    -pgnout "matches\sprt-6596.pgn" `
    -recover `
    -log file=fastchess-logs.log level=warn `
# | tee last-sprt.txt


        # ponder `
		# ponder `
	# -debug `
		# ponder `

        # option.Hash=32 `
		# option.Threads=2 `
