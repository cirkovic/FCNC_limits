N=${1}
S=${2}
#N1=$(( N + 1 ))

#echo "RM: ${RM}" >> COMBINE_OUTPUT_${N1}.txt

OPTIONS=""
OPTIONSp=""
#OPTIONS="$OPTIONS -t -1"
#OPTIONS="$OPTIONS --rMin=-0.1 --rMax=0.1"
#OPTIONS="$OPTIONS --minimizerStrategy 0 --minimizerTolerance 0.1"
#OPTIONSp="$OPTIONSp --rMin=-3 --rMax=3 --stepSize=0.05 --minos=all --minimizerAlgo=SeqMinimizer --minimizerAlgoForMinos=SeqMinimizer --minimizerToleranceForMinos 0.001"
#OPTIONSp="$OPTIONSp --robustFit=1 --rMin=-2 --rMax=2 --stepSize=0.05 --minimizerAlgo=SeqMinimizer --minimizerTolerance 0.01"
OPTIONSp="$OPTIONSp --rMin=-3 --rMax=3"
#OPTIONS="$OPTIONS --rMin=-5.0 --rMax=5.0"
#OPTIONS="$OPTIONS --freezeNuisanceGroups *StatBin*"
#OPTIONS="$OPTIONS --freezeNuisances lumi,tt_norm,tt_addbb,tt_addcc,other_norm,SfIteraviveFitLf,SfIteraviveFitHf,SfIteraviveFitLfstats1,SfIteraviveFitLfstats2,SfIteraviveFitHfstats1,SfIteraviveFitHfstats2,SfIteraviveFitCferr1,SfIteraviveFitCferr2,SfPileup,SfLepton,SfTopPt,Jes,Jer,hdamp,scaleEnvelope,UE,PDFEnvelope"
#OPTIONS="$OPTIONS --freezeNuisances b2j3StatBinSig0,b2j3StatBinSig1,b2j3StatBinSig2,b2j3StatBinSig3,b2j3StatBinSig4,b2j3StatBinSig5,b2j3StatBinSig6,b2j3StatBinSig7,b2j3StatBinSig8,b2j3StatBinSig9,b2j3StatBinSig10,b2j3StatBinSig11,b2j3StatBinSig12,b2j3StatBinSig13,b2j3StatBinSig14,b2j3StatBinSig15,b2j3StatBinSig16,b2j3StatBinSig17,b2j3StatBinSig18,b2j3StatBinSig19,b2j3StatBinttbb0,b2j3StatBinttbb1,b2j3StatBinttbb2,b2j3StatBinttbb3,b2j3StatBinttbb4,b2j3StatBinttbb5,b2j3StatBinttbb6,b2j3StatBinttbb7,b2j3StatBinttbb8,b2j3StatBinttbb9,b2j3StatBinttbb10,b2j3StatBinttbb11,b2j3StatBinttbb12,b2j3StatBinttbb13,b2j3StatBinttbb14,b2j3StatBinttbb15,b2j3StatBinttbb16,b2j3StatBinttbb17,b2j3StatBinttbb18,b2j3StatBinttbb19,b2j3StatBinttcc0,b2j3StatBinttcc1,b2j3StatBinttcc2,b2j3StatBinttcc3,b2j3StatBinttcc4,b2j3StatBinttcc5,b2j3StatBinttcc6,b2j3StatBinttcc7,b2j3StatBinttcc8,b2j3StatBinttcc9,b2j3StatBinttcc10,b2j3StatBinttcc11,b2j3StatBinttcc12,b2j3StatBinttcc13,b2j3StatBinttcc14,b2j3StatBinttcc15,b2j3StatBinttcc16,b2j3StatBinttcc17,b2j3StatBinttcc18,b2j3StatBinttcc19,b2j3StatBinttlf0,b2j3StatBinttlf1,b2j3StatBinttlf2,b2j3StatBinttlf3,b2j3StatBinttlf4,b2j3StatBinttlf5,b2j3StatBinttlf6,b2j3StatBinttlf7,b2j3StatBinttlf8,b2j3StatBinttlf9,b2j3StatBinttlf10,b2j3StatBinttlf11,b2j3StatBinttlf12,b2j3StatBinttlf13,b2j3StatBinttlf14,b2j3StatBinttlf15,b2j3StatBinttlf16,b2j3StatBinttlf17,b2j3StatBinttlf18,b2j3StatBinttlf19,b2j3StatBinother0,b2j3StatBinother1,b2j3StatBinother2,b2j3StatBinother3,b2j3StatBinother4,b2j3StatBinother5,b2j3StatBinother6,b2j3StatBinother7,b2j3StatBinother8,b2j3StatBinother9,b2j3StatBinother10,b2j3StatBinother11,b2j3StatBinother12,b2j3StatBinother13,b2j3StatBinother14,b2j3StatBinother15,b2j3StatBinother16,b2j3StatBinother17,b2j3StatBinother18,b2j3StatBinother19,b3j3StatBinSig0,b3j3StatBinSig1,b3j3StatBinSig2,b3j3StatBinSig3,b3j3StatBinSig4,b3j3StatBinSig5,b3j3StatBinSig6,b3j3StatBinSig7,b3j3StatBinSig8,b3j3StatBinSig9,b3j3StatBinSig10,b3j3StatBinSig11,b3j3StatBinSig12,b3j3StatBinSig13,b3j3StatBinSig14,b3j3StatBinSig15,b3j3StatBinSig16,b3j3StatBinSig17,b3j3StatBinSig18,b3j3StatBinSig19,b3j3StatBinttbb0,b3j3StatBinttbb1,b3j3StatBinttbb2,b3j3StatBinttbb3,b3j3StatBinttbb4,b3j3StatBinttbb5,b3j3StatBinttbb6,b3j3StatBinttbb7,b3j3StatBinttbb8,b3j3StatBinttbb9,b3j3StatBinttbb10,b3j3StatBinttbb11,b3j3StatBinttbb12,b3j3StatBinttbb13,b3j3StatBinttbb14,b3j3StatBinttbb15,b3j3StatBinttbb16,b3j3StatBinttbb17,b3j3StatBinttbb18,b3j3StatBinttbb19,b3j3StatBinttcc0,b3j3StatBinttcc1,b3j3StatBinttcc2,b3j3StatBinttcc3,b3j3StatBinttcc4,b3j3StatBinttcc5,b3j3StatBinttcc6,b3j3StatBinttcc7,b3j3StatBinttcc8,b3j3StatBinttcc9,b3j3StatBinttcc10,b3j3StatBinttcc11,b3j3StatBinttcc12,b3j3StatBinttcc13,b3j3StatBinttcc14,b3j3StatBinttcc15,b3j3StatBinttcc16,b3j3StatBinttcc17,b3j3StatBinttcc18,b3j3StatBinttcc19,b3j3StatBinttlf0,b3j3StatBinttlf1,b3j3StatBinttlf2,b3j3StatBinttlf3,b3j3StatBinttlf4,b3j3StatBinttlf5,b3j3StatBinttlf6,b3j3StatBinttlf7,b3j3StatBinttlf8,b3j3StatBinttlf9,b3j3StatBinttlf10,b3j3StatBinttlf11,b3j3StatBinttlf12,b3j3StatBinttlf13,b3j3StatBinttlf14,b3j3StatBinttlf15,b3j3StatBinttlf16,b3j3StatBinttlf17,b3j3StatBinttlf18,b3j3StatBinttlf19,b3j3StatBinother0,b3j3StatBinother1,b3j3StatBinother2,b3j3StatBinother3,b3j3StatBinother4,b3j3StatBinother5,b3j3StatBinother6,b3j3StatBinother7,b3j3StatBinother8,b3j3StatBinother9,b3j3StatBinother10,b3j3StatBinother11,b3j3StatBinother12,b3j3StatBinother13,b3j3StatBinother14,b3j3StatBinother15,b3j3StatBinother16,b3j3StatBinother17,b3j3StatBinother18,b3j3StatBinother19,b2j4StatBinSig0,b2j4StatBinSig1,b2j4StatBinSig2,b2j4StatBinSig3,b2j4StatBinSig4,b2j4StatBinSig5,b2j4StatBinSig6,b2j4StatBinSig7,b2j4StatBinSig8,b2j4StatBinSig9,b2j4StatBinSig10,b2j4StatBinSig11,b2j4StatBinSig12,b2j4StatBinSig13,b2j4StatBinSig14,b2j4StatBinSig15,b2j4StatBinSig16,b2j4StatBinSig17,b2j4StatBinSig18,b2j4StatBinSig19,b2j4StatBinttbb0,b2j4StatBinttbb1,b2j4StatBinttbb2,b2j4StatBinttbb3,b2j4StatBinttbb4,b2j4StatBinttbb5,b2j4StatBinttbb6,b2j4StatBinttbb7,b2j4StatBinttbb8,b2j4StatBinttbb9,b2j4StatBinttbb10,b2j4StatBinttbb11,b2j4StatBinttbb12,b2j4StatBinttbb13,b2j4StatBinttbb14,b2j4StatBinttbb15,b2j4StatBinttbb16,b2j4StatBinttbb17,b2j4StatBinttbb18,b2j4StatBinttbb19,b2j4StatBinttcc0,b2j4StatBinttcc1,b2j4StatBinttcc2,b2j4StatBinttcc3,b2j4StatBinttcc4,b2j4StatBinttcc5,b2j4StatBinttcc6,b2j4StatBinttcc7,b2j4StatBinttcc8,b2j4StatBinttcc9,b2j4StatBinttcc10,b2j4StatBinttcc11,b2j4StatBinttcc12,b2j4StatBinttcc13,b2j4StatBinttcc14,b2j4StatBinttcc15,b2j4StatBinttcc16,b2j4StatBinttcc17,b2j4StatBinttcc18,b2j4StatBinttcc19,b2j4StatBinttlf0,b2j4StatBinttlf1,b2j4StatBinttlf2,b2j4StatBinttlf3,b2j4StatBinttlf4,b2j4StatBinttlf5,b2j4StatBinttlf6,b2j4StatBinttlf7,b2j4StatBinttlf8,b2j4StatBinttlf9,b2j4StatBinttlf10,b2j4StatBinttlf11,b2j4StatBinttlf12,b2j4StatBinttlf13,b2j4StatBinttlf14,b2j4StatBinttlf15,b2j4StatBinttlf16,b2j4StatBinttlf17,b2j4StatBinttlf18,b2j4StatBinttlf19,b2j4StatBinother0,b2j4StatBinother1,b2j4StatBinother2,b2j4StatBinother3,b2j4StatBinother4,b2j4StatBinother5,b2j4StatBinother6,b2j4StatBinother7,b2j4StatBinother8,b2j4StatBinother9,b2j4StatBinother10,b2j4StatBinother11,b2j4StatBinother12,b2j4StatBinother13,b2j4StatBinother14,b2j4StatBinother15,b2j4StatBinother16,b2j4StatBinother17,b2j4StatBinother18,b2j4StatBinother19,b3j4StatBinSig0,b3j4StatBinSig1,b3j4StatBinSig2,b3j4StatBinSig3,b3j4StatBinSig4,b3j4StatBinSig5,b3j4StatBinSig6,b3j4StatBinSig7,b3j4StatBinSig8,b3j4StatBinSig9,b3j4StatBinSig10,b3j4StatBinSig11,b3j4StatBinSig12,b3j4StatBinSig13,b3j4StatBinSig14,b3j4StatBinSig15,b3j4StatBinSig16,b3j4StatBinSig17,b3j4StatBinSig18,b3j4StatBinSig19,b3j4StatBinttbb0,b3j4StatBinttbb1,b3j4StatBinttbb2,b3j4StatBinttbb3,b3j4StatBinttbb4,b3j4StatBinttbb5,b3j4StatBinttbb6,b3j4StatBinttbb7,b3j4StatBinttbb8,b3j4StatBinttbb9,b3j4StatBinttbb10,b3j4StatBinttbb11,b3j4StatBinttbb12,b3j4StatBinttbb13,b3j4StatBinttbb14,b3j4StatBinttbb15,b3j4StatBinttbb16,b3j4StatBinttbb17,b3j4StatBinttbb18,b3j4StatBinttbb19,b3j4StatBinttcc0,b3j4StatBinttcc1,b3j4StatBinttcc2,b3j4StatBinttcc3,b3j4StatBinttcc4,b3j4StatBinttcc5,b3j4StatBinttcc6,b3j4StatBinttcc7,b3j4StatBinttcc8,b3j4StatBinttcc9,b3j4StatBinttcc10,b3j4StatBinttcc11,b3j4StatBinttcc12,b3j4StatBinttcc13,b3j4StatBinttcc14,b3j4StatBinttcc15,b3j4StatBinttcc16,b3j4StatBinttcc17,b3j4StatBinttcc18,b3j4StatBinttcc19,b3j4StatBinttlf0,b3j4StatBinttlf1,b3j4StatBinttlf2,b3j4StatBinttlf3,b3j4StatBinttlf4,b3j4StatBinttlf5,b3j4StatBinttlf6,b3j4StatBinttlf7,b3j4StatBinttlf8,b3j4StatBinttlf9,b3j4StatBinttlf10,b3j4StatBinttlf11,b3j4StatBinttlf12,b3j4StatBinttlf13,b3j4StatBinttlf14,b3j4StatBinttlf15,b3j4StatBinttlf16,b3j4StatBinttlf17,b3j4StatBinttlf18,b3j4StatBinttlf19,b3j4StatBinother0,b3j4StatBinother1,b3j4StatBinother2,b3j4StatBinother3,b3j4StatBinother4,b3j4StatBinother5,b3j4StatBinother6,b3j4StatBinother7,b3j4StatBinother8,b3j4StatBinother9,b3j4StatBinother10,b3j4StatBinother11,b3j4StatBinother12,b3j4StatBinother13,b3j4StatBinother14,b3j4StatBinother15,b3j4StatBinother16,b3j4StatBinother17,b3j4StatBinother18,b3j4StatBinother19,b4j4StatBinSig0,b4j4StatBinSig1,b4j4StatBinSig2,b4j4StatBinSig3,b4j4StatBinSig4,b4j4StatBinSig5,b4j4StatBinSig6,b4j4StatBinSig7,b4j4StatBinSig8,b4j4StatBinSig9,b4j4StatBinSig10,b4j4StatBinSig11,b4j4StatBinSig12,b4j4StatBinSig13,b4j4StatBinSig14,b4j4StatBinSig15,b4j4StatBinSig16,b4j4StatBinSig17,b4j4StatBinSig18,b4j4StatBinSig19,b4j4StatBinttbb0,b4j4StatBinttbb1,b4j4StatBinttbb2,b4j4StatBinttbb3,b4j4StatBinttbb4,b4j4StatBinttbb5,b4j4StatBinttbb6,b4j4StatBinttbb7,b4j4StatBinttbb8,b4j4StatBinttbb9,b4j4StatBinttbb10,b4j4StatBinttbb11,b4j4StatBinttbb12,b4j4StatBinttbb13,b4j4StatBinttbb14,b4j4StatBinttbb15,b4j4StatBinttbb16,b4j4StatBinttbb17,b4j4StatBinttbb18,b4j4StatBinttbb19,b4j4StatBinttcc0,b4j4StatBinttcc1,b4j4StatBinttcc2,b4j4StatBinttcc3,b4j4StatBinttcc4,b4j4StatBinttcc5,b4j4StatBinttcc6,b4j4StatBinttcc7,b4j4StatBinttcc8,b4j4StatBinttcc9,b4j4StatBinttcc10,b4j4StatBinttcc11,b4j4StatBinttcc12,b4j4StatBinttcc13,b4j4StatBinttcc14,b4j4StatBinttcc15,b4j4StatBinttcc16,b4j4StatBinttcc17,b4j4StatBinttcc18,b4j4StatBinttcc19,b4j4StatBinttlf0,b4j4StatBinttlf1,b4j4StatBinttlf2,b4j4StatBinttlf3,b4j4StatBinttlf4,b4j4StatBinttlf5,b4j4StatBinttlf6,b4j4StatBinttlf7,b4j4StatBinttlf8,b4j4StatBinttlf9,b4j4StatBinttlf10,b4j4StatBinttlf11,b4j4StatBinttlf12,b4j4StatBinttlf13,b4j4StatBinttlf14,b4j4StatBinttlf15,b4j4StatBinttlf16,b4j4StatBinttlf17,b4j4StatBinttlf18,b4j4StatBinttlf19,b4j4StatBinother0,b4j4StatBinother1,b4j4StatBinother2,b4j4StatBinother3,b4j4StatBinother4,b4j4StatBinother5,b4j4StatBinother6,b4j4StatBinother7,b4j4StatBinother8,b4j4StatBinother9,b4j4StatBinother10,b4j4StatBinother11,b4j4StatBinother12,b4j4StatBinother13,b4j4StatBinother14,b4j4StatBinother15,b4j4StatBinother16,b4j4StatBinother17,b4j4StatBinother18,b4j4StatBinother19"

PS=""

for j in `ls cards`; do
    i=$j
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}

    rm -rf ${FOLDER}
    mkdir ${FOLDER}
    cd ${FOLDER}

#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 10.0 ../cards/${i} -n _10 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_10.root -g plots_10.root"
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_10.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_10.txt &
#    PS="$PS $!"

#    #COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 1.0 ../cards/${i} -n _1 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_1.root -g plots_1.root"
#    #COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.0225 ../cards/${i} -n _1 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_1.root -g plots_1.root"
#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 1.0 ../cards/${i} -n _1 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_1.root -g plots_1.root"
##    if [[ "$i" == *"b3j4_hut"* ]]; then
##        COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.04 ../cards/${i} -n _1 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_1.root -g plots_1.root"
##    fi
##    if [[ "$i" == *"b3j4_hct"* ]]; then
##        COMMAND="combine -S ${S} -M MaxLikelihoodFit --rMin=-2.0 --rMax=2.0 --expectSignal 0.023 ../cards/${i} -n _1 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_1.root -g plots_1.root"
##    fi
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_1.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_1.txt &
#    PS="$PS $!"

    #COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} ../cards/${i} -n _1 && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_1.root -g plots_1.root"
#    if [[ "$i" == *"b3j4_hut"* ]]; then
#        COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.04 ../cards/${i} -n _1 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_1.root -g plots_1.root"
#    fi
    if [[ "0" == "1" ]]; then
    #if [[ "$i" == *"PROBLEMATIC"* ]]; then
#    if [[ "$i" == *"b2j3_hut"* ]]; then
    #if [[ "$i" == *"b2j3"* ]] || [[ "$i" == *"b2j4_hct"* ]] || [[ "$i" == *"b4j4_hct"* ]] || [[ "$i" == *"comb"* ]]; then
    #if [[ "$i" == *"b2j3"* ]] || [[ "$i" == *"b2j4_hct"* ]] || [[ "$i" == *"b4j4_hct"* ]]; then
    #if [[ "$i" == *"b2j3"* ]] || [[ "$i" == *"b2j4_hct"* ]] || [[ "$i" == *"comb"* ]]; then
    #if [[ "$i" == *"b2j3"* ]] || [[ "$i" == *"b4j4_hct"* ]] || [[ "$i" == *"comb"* ]]; then
    #if [[ "$i" == *"b2j4_hct"* ]] || [[ "$i" == *"b4j4_hct"* ]] || [[ "$i" == *"comb"* ]]; then
        #COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} ../cards/${i} --rMin=-5.0 --rMax=5.0 -n _1 && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_1.root -g plots_1.root"
        COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONSp} ../cards/${i} -n _1 && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_1.root -g plots_1.root"
        #COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} ../cards/${i} --rMin=-1.0 --rMax=1.0 -n _1 && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_1.root -g plots_1.root"
    else
        COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} ../cards/${i} -n _1 && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_1.root -g plots_1.root"
    fi
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_1.txt
    #eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_1.txt &
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_1.txt
    PS="$PS $!"

#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.5 ../cards/${i} -n _05 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_05.root -g plots_05.root"
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_05.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_05.txt &
#    PS="$PS $!"

#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.1 ../cards/${i} -n _01 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_01.root -g plots_01.root"
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_01.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_01.txt &
#    PS="$PS $!"

#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.05 ../cards/${i} -n _005 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_005.root -g plots_005.root"
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_005.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_005.txt &
#    PS="$PS $!"

#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.01 ../cards/${i} -n _001 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_001.root -g plots_001.root"
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_001.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_001.txt &
#    PS="$PS $!"

#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.0 ../cards/${i} -n _0 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_0.root -g plots_0.root"
##    if [[ "$i" == *"b3j4_hut"* ]]; then
##        COMMAND="combine -S ${S} -M MaxLikelihoodFit --rMin=-1.0 --rMax=1.0 --expectSignal 0.0 ../cards/${i} -n _0 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_0.root -g plots_0.root"
##    fi
##    if [[ "$i" == *"b3j4_hct"* ]]; then
##        COMMAND="combine -S ${S} -M MaxLikelihoodFit --rMin=-2.0 --rMax=2.0 --expectSignal 0.023 ../cards/${i} -n _0 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances_noMCstat.py -a mlfit_0.root -g plots_0.root"
##    fi
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_0.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_0.txt &
#    PS="$PS $!"

    cd ..
done

wait $PS

