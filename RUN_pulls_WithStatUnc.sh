OUTPUT=~/www/24-04-2017
OUTPUT=~/www/26-04-2017
OUTPUT=~/www/27-04-2017
OUTPUT=~/www/28-04-2017_WithStatUnc
OUTPUT=~/www/02-05-2017/WithStatUnc

#find ${OUTPUT}/pulls_blind -name "*.png" | xargs rm
#find ${OUTPUT}/pulls_blind -name "*.pdf" | xargs rm

#./RUN_pulls_blind_WithStatUnc.sh ${OUTPUT}


find ${OUTPUT}/pulls_unblinded -name "*.png" | xargs rm
find ${OUTPUT}/pulls_unblinded -name "*.pdf" | xargs rm

./RUN_pulls_unblinded_WithStatUnc.sh ${OUTPUT}

