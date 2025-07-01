./cutechess-cli-1.3.1-linux64/cutechess-ob \
    -engine dir=engines/dev cmd=./Lynx.Cli name=Lynx-dev option.Hash=4096 option.Threads=34  \
    -engine dir=engines/base cmd=./Lynx.Cli name=Lynx-base option.Hash=4096 option.Threads=34 \
    -each \
        tc=inf/40+0.4 \
        proto=uci \
    -games 2 -rounds 100000 -repeat 1 -maxmoves 400 -srand 1692649580 \
    -openings file="books/UHO_XXL_+0.90_+1.19.epd" format=epd order=random \
    -sprt elo0=0 elo1=3 alpha=0.05 beta=0.1 \
    -concurrency 1 \
    -outcomeinterval 10 \
    -ratinginterval 10 \
    -recover \
    -pgnout "matches/lynx-dev.pgn" \
    # -draw movenumber=30 movecount=12 score=15 `
    # -resign movecount=12 score=600 twosided=true

    # " -event "Gauntlet $((Get-Date).ToString('yyyy-MM-dd_HH-mm'))" `
    # -recover -srand 6730291 `
    #   ponder `
