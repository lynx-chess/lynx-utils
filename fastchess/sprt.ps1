&"fastchess-05da0df\fastchess-windows-latest.exe" `
    -engine dir="C:/Users/edcaceres/Downloads/Lynx-1.9.1-win-x64/" name="dev" `
    -engine dir="C:/Users/edcaceres/Downloads/Lynx-1.9.1-win-x64/" name="master" `
    -each `
        tc=4+0.04 `
        option.Hash=32 `
        option.Threads=1 `
        proto=uci `
        cmd="Lynx.Cli.exe" `
    -concurrency 8 `
    -resign movecount=3 score=500 twosided=true `
    -draw movenumber=40 movecount=8 score=10 `
    -rounds 200000 -repeat `
    -sprt elo0=0 elo1=3 alpha=0.05 beta=0.1 model=logistic `
    -openings file="../cutechess/books/UHO_XXL_+0.90_+1.19.epd" format=epd order=random `
    -maxmoves 400 -srand 1692649580 -ratinginterval 10 `
    -pgnout "matches\sprt-2582.pgn" `
    -recover `
    -log file=fastchess-errors.log level=warn `
# | tee last-sprt.txt


        # ponder `
		# ponder `
	# -debug `
		# ponder `

        # option.Hash=32 `
		# option.Threads=2 `