OUTPUT=~/www/24-04-2017
OUTPUT=~/www/26-04-2017
OUTPUT=~/www/27-04-2017
OUTPUT=~/www/28-04-2017_WithStatUnc
OUTPUT=~/www/02-05-2017/WithStatUnc
OUTPUT=~/www/06-05-2017/WithStatUnc
OUTPUT=~/www/15-05-2017/WithStatUnc
OUTPUT=~/www/16-05-2017/WithStatUnc_mscan
OUTPUT=~/www/21-05-2017/WithStatUnc_mscan
OUTPUT=~/www/22-05-2017/WithStatUnc_mscan
OUTPUT=~/www/23-05-2017/WithStatUnc_mscan
OUTPUT=~/www/25-05-2017/WithStatUnc_mscan
OUTPUT=~/www/26-05-2017/WithStatUnc_mscan
OUTPUT=~/www/29-05-2017/WithStatUnc_mscan
OUTPUT=~/www/30-05-2017/WithStatUnc_mscan

#find ${OUTPUT}/pulls_blind -name "*.png" | xargs rm
#find ${OUTPUT}/pulls_blind -name "*.pdf" | xargs rm

#./RUN_pulls_blind_WithStatUnc.sh ${OUTPUT}


find ${OUTPUT}/pulls_unblinded -name "*.png" | xargs rm
find ${OUTPUT}/pulls_unblinded -name "*.pdf" | xargs rm

./RUN_pulls_unblinded_WithStatUnc_mscan.sh ${OUTPUT}

