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
OUTPUT=~/www/13-06-2017/WithStatUnc_mscan
OUTPUT=~/www/14-06-2017/WithStatUnc_mscan
OUTPUT=~/www/15-06-2017/WithStatUnc_mscan
OUTPUT=~/www/21-06-2017/WithStatUnc_mscan
OUTPUT=~/www/25-06-2017/WithStatUnc_mscan
OUTPUT=~/www/26-06-2017/WithStatUnc_mscan
OUTPUT=~/www/28-06-2017/WithStatUnc_mscan
OUTPUT=~/www/29-06-2017_mod/WithStatUnc_mscan
OUTPUT=~/www/01-07-2017/WithStatUnc_mscan
OUTPUT=~/www/02-07-2017/WithStatUnc_mscan
#OUTPUT=~/www/14-06-2017/WithStatUnc_mscan_ST
#OUTPUT=~/www/14-06-2017/WithStatUnc_mscan_TT

#find ${OUTPUT}/pulls_blind -name "*.png" | xargs rm
#find ${OUTPUT}/pulls_blind -name "*.pdf" | xargs rm

#./RUN_pulls_blind_WithStatUnc.sh ${OUTPUT}


#find ${OUTPUT}/pulls_unblinded -name "*.png" | xargs rm
#find ${OUTPUT}/pulls_unblinded -name "*.pdf" | xargs rm

#./RUN_pulls_unblinded_WithStatUnc_mscan.sh ${OUTPUT}
#./RUN_pulls_unblinded_WithStatUnc_mscan_check.sh ${OUTPUT}

for i in combSTandTT ST TT; do
#for i in ST TT; do
#for i in combSTandTT; do
    #for j in hdamp_UE; do
    #for j in hdamp_UE_SfIterativeFit; do
#    for j in hdamp_UE_Jes; do
#    for j in hdamp_UE_Jes_SfIterativeFit; do
    #for i in ST TT; do
    #./RUN_pulls_unblinded_WithStatUnc_mscan_14-06-2017.sh ${OUTPUT} ${i}
    #./RUN_pulls_unblinded_WithStatUnc_mscan_21-06-2017.sh ${OUTPUT} ${i}
    #./RUN_pulls_unblinded_WithStatUnc_mscan_25-06-2017.sh ${OUTPUT} ${i}
    #./RUN_pulls_unblinded_WithStatUnc_mscan_29-06-2017.sh ${OUTPUT} ${i} ${j}
    ./RUN_pulls_unblinded_WithStatUnc_mscan_01-07-2017.sh ${OUTPUT} ${i}
done

