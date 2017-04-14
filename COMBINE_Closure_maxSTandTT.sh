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

    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_0.txt
    COMMAND="combine -S ${S} -M MaxLikelihoodFit -t -1 --expectSignal 0 ../cards/${i} && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit.root -g plots.root"
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_0.txt &
    PS="$PS $!"

    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_1.txt
    COMMAND="combine -S ${S} -M MaxLikelihoodFit -t -1 --expectSignal 1 ../cards/${i} && python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit.root -g plots.root"
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_1.txt &
    PS="$PS $!"

    cd ..
done

wait $PS

exit

rm -f COMBINE_OUTPUT_maxSTandTT.txt

for i in `ls cards`; do
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}
    echo $i >> COMBINE_OUTPUT_maxSTandTT.txt
    cat ${FOLDER}/COMBINE_OUTPUT_0.txt >> COMBINE_OUTPUT_maxSTandTT.txt
    cat ${FOLDER}/COMBINE_OUTPUT_1.txt >> COMBINE_OUTPUT_maxSTandTT.txt
    echo >> _1COMBINE_OUTPUT_maxSTandTT.txt;
    echo >> COMBINE_OUTPUT_maxSTandTT.txt;
    echo >> COMBINE_OUTPUT_maxSTandTT.txt;
done

grep "input_\|Expected \|Observed \|combine " COMBINE_OUTPUT_maxSTandTT.txt > COMBINE_OUTPUT_maxSTandTT_1.txt
mv COMBINE_OUTPUT_maxSTandTT_1.txt COMBINE_OUTPUT_maxSTandTT.txt

