N=${1}
S=${2}
CASE=${3}
#N1=$(( N + 1 ))

if [[ "${1}" == "maxSTandTT" ]]; then
    LABEL=MAX
elif [[ "${1}" == "ST" ]]; then
    LABEL=ST
elif [[ "${1}" == "TT" ]]; then
    LABEL=TT
elif [[ "${1}" == "combSTandTT" ]]; then
    LABEL=Comb
fi

#echo "RM: ${RM}" >> COMBINE_OUTPUT_${N1}.txt

OPTIONS=""
OPTIONS1=""
#OPTIONS="$OPTIONS --run both"
#OPTIONS="$OPTIONS --expectSignal 0.0225"
#OPTIONS="$OPTIONS --rMin=-0.1 --rMax=0.1"
OPTIONS=" --minimizerStrategy 0 --minimizerTolerance 0.1"
OPTIONS1=" --robustFit=1 --rMin=-2 --rMax=2 --stepSize=0.05 --minimizerAlgo=SeqMinimizer --minimizerTolerance 0.01"

PS=""

for j in `ls cards`; do
    i=$j
    #if [[ "$i" != "input_MVAHct${LABEL}_b4j4_hct.txt" ]]; then continue; fi
    #if [[ "$i" != "input_MVAHut${LABEL}_b4j4_hut.txt" ]]; then continue; fi
#    if [[ "$i" != "input_MVAHct${LABEL}_comb_hct.txt" ]]; then continue; fi
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}
    rm -rf ${FOLDER}
    mkdir ${FOLDER}
    cd ${FOLDER}
    if [[ "$CASE" == "split" ]]; then
        if   [[ "$i" == "input_MVAHut${LABEL}_b2j3_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS"
        elif [[ "$i" == "input_MVAHut${LABEL}_b3j3_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS"
        elif [[ "$i" == "input_MVAHut${LABEL}_b2j4_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS"
        elif [[ "$i" == "input_MVAHut${LABEL}_b3j4_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS"
        elif [[ "$i" == "input_MVAHut${LABEL}_b4j4_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS"
        elif [[ "$i" == "input_MVAHut${LABEL}_comb_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS"
        elif [[ "$i" == "input_MVAHct${LABEL}_b2j3_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS"
        elif [[ "$i" == "input_MVAHct${LABEL}_b3j3_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS"
        elif [[ "$i" == "input_MVAHct${LABEL}_b2j4_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS"
        elif [[ "$i" == "input_MVAHct${LABEL}_b3j4_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS1"
        elif [[ "$i" == "input_MVAHct${LABEL}_b4j4_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS"
        elif [[ "$i" == "input_MVAHct${LABEL}_comb_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M MaxLikelihoodFit $OPTIONS"
        fi
    fi
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT.txt
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT.txt &
    PS="$PS $!"
#    else
#        combine -S ${S} ..rds/${i} -M MaxLikelihoodFit #-S 0
#    fi
#    fi
    #exit
    cd ..
done

wait $PS

rm -f COMBINE_OUTPUT_${N}.txt

for i in `ls cards`; do
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}
    echo $i >> COMBINE_OUTPUT_${N}.txt
    cat ${FOLDER}/COMBINE_OUTPUT.txt >> COMBINE_OUTPUT_${N}.txt
    echo >> COMBINE_OUTPUT_${N}.txt;
    echo >> COMBINE_OUTPUT_${N}.txt;
    echo >> COMBINE_OUTPUT_${N}.txt;
done

grep "input_\|Expected \|Observed \|combine " COMBINE_OUTPUT_${N}.txt > COMBINE_OUTPUT_${N}_1.txt
mv COMBINE_OUTPUT_${N}_1.txt COMBINE_OUTPUT_${N}.txt

