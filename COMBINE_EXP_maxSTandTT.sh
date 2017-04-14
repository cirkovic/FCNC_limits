N=${1}
S=${2}
CASE=${3}
#N1=$(( N + 1 ))

#echo "RM: ${RM}" >> COMBINE_OUTPUT_${N1}.txt

PS=""

for j in `ls cards`; do
    i=$j
    #if [[ "$i" != "input_MVAHctMAX_b4j4_hct.txt" ]]; then continue; fi
    #if [[ "$i" != "input_MVAHutMAX_b4j4_hut.txt" ]]; then continue; fi
#    if [[ "$i" != "input_MVAHctMAX_comb_hct.txt" ]]; then continue; fi
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}
    rm -rf ${FOLDER}
    mkdir ${FOLDER}
    cd ${FOLDER}
    if [[ "$CASE" == "split" ]]; then
        if   [[ "$i" == "input_MVAHutMAX_b2j3_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHutMAX_b3j3_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHutMAX_b2j4_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHutMAX_b4j4_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHutMAX_comb_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHctMAX_b2j3_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHctMAX_b3j3_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHctMAX_b2j4_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHctMAX_b3j4_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-5 --rMax=5"
        elif [[ "$i" == "input_MVAHctMAX_b4j4_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHctMAX_comb_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        fi
    elif [[ "$CASE" == "merged" ]]; then
        if   [[ "$i" == "input_MVAHutMAX_b2j3_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHutMAX_b3j3_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHutMAX_b2j4_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHutMAX_b4j4_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHutMAX_comb_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHctMAX_b2j3_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHctMAX_b3j3_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHctMAX_b2j4_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHctMAX_b3j4_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHctMAX_b4j4_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        elif [[ "$i" == "input_MVAHctMAX_comb_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected"
        fi
    fi
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT.txt
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT.txt &
    PS="$PS $!"
#    else
#        combine -S ${S} ..rds/${i} -M Asymptotic #-S 0
#    fi
#    fi
    #exit
    cd ..
done

wait $PS

rm -f COMBINE_OUTPUT_maxSTandTT.txt

for i in `ls cards`; do
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}
    echo $i >> COMBINE_OUTPUT_maxSTandTT.txt
    cat ${FOLDER}/COMBINE_OUTPUT.txt >> COMBINE_OUTPUT_maxSTandTT.txt
    echo >> COMBINE_OUTPUT_maxSTandTT.txt;
    echo >> COMBINE_OUTPUT_maxSTandTT.txt;
    echo >> COMBINE_OUTPUT_maxSTandTT.txt;
done

grep "input_\|Expected \|Observed \|combine " COMBINE_OUTPUT_maxSTandTT.txt > COMBINE_OUTPUT_maxSTandTT_1.txt
mv COMBINE_OUTPUT_maxSTandTT_1.txt COMBINE_OUTPUT_maxSTandTT.txt

