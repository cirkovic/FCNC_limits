N=${1}
S=${2}
#N1=$(( N + 1 ))

#echo "RM: ${RM}" >> COMBINE_OUTPUT_${N1}.txt

PS=""

for j in `ls cards`; do
    i=$j
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}

    rm -rf ${FOLDER}
    mkdir ${FOLDER}
    cd ${FOLDER}

    COMMAND="combine -S ${S} -M MaxLikelihoodFit -t -1 --expectSignal 0 ../cards/${i} -n _0 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_0.root -g plots_0.root"
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_0.txt
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_0.txt &
    PS="$PS $!"

    COMMAND="combine -S ${S} -M MaxLikelihoodFit -t -1 --expectSignal 1 ../cards/${i} -n _1 --minos=all && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit_1.root -g plots_1.root"
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_1.txt
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_1.txt &
    PS="$PS $!"

    cd ..
done

wait $PS

