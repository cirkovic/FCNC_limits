N=${1}
S=${2}
#N1=$(( N + 1 ))

#echo "RM: ${RM}" >> COMBINE_OUTPUT_${N1}.txt

OPTIONS=""
#OPTIONS="$OPTIONS -t -1"
OPTIONS="$OPTIONS --rMin=-0.1 --rMax=0.1"
#OPTIONS="$OPTIONS --rMin=-5.0 --rMax=5.0"

PS=""

for j in `ls cards`; do
    i=$j
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}

    rm -rf ${FOLDER}
    mkdir ${FOLDER}
    cd ${FOLDER}

#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 10.0 ../cards/${i} -n _10 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_10.root -g plots_10.root"
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_10.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_10.txt &
#    PS="$PS $!"

    #COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 1.0 ../cards/${i} -n _1 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_1.root -g plots_1.root"
    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.0225 ../cards/${i} -n _1 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_1.root -g plots_1.root"
    if [[ "$i" == *"b3j4_hut"* ]]; then
        COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.04 ../cards/${i} -n _1 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_1.root -g plots_1.root"
    fi
    if [[ "$i" == *"b3j4_hct"* ]]; then
        COMMAND="combine -S ${S} -M MaxLikelihoodFit --rMin=-2.0 --rMax=2.0 --expectSignal 0.023 ../cards/${i} -n _1 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_1.root -g plots_1.root"
    fi
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_1.txt
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_1.txt &
    PS="$PS $!"

#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.5 ../cards/${i} -n _05 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_05.root -g plots_05.root"
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_05.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_05.txt &
#    PS="$PS $!"

#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.1 ../cards/${i} -n _01 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_01.root -g plots_01.root"
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_01.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_01.txt &
#    PS="$PS $!"

#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.05 ../cards/${i} -n _005 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_005.root -g plots_005.root"
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_005.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_005.txt &
#    PS="$PS $!"

#    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.01 ../cards/${i} -n _001 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_001.root -g plots_001.root"
#    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_001.txt
#    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_001.txt &
#    PS="$PS $!"

    COMMAND="combine -S ${S} -M MaxLikelihoodFit ${OPTIONS} --expectSignal 0.0 ../cards/${i} -n _0 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_0.root -g plots_0.root"
    if [[ "$i" == *"b3j4_hut"* ]]; then
        COMMAND="combine -S ${S} -M MaxLikelihoodFit --rMin=-1.0 --rMax=1.0 --expectSignal 0.0 ../cards/${i} -n _0 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_0.root -g plots_0.root"
    fi
    if [[ "$i" == *"b3j4_hct"* ]]; then
        COMMAND="combine -S ${S} -M MaxLikelihoodFit --rMin=-2.0 --rMax=2.0 --expectSignal 0.023 ../cards/${i} -n _0 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_0.root -g plots_0.root"
    fi
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_0.txt
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_0.txt &
    PS="$PS $!"

    cd ..
done

wait $PS

