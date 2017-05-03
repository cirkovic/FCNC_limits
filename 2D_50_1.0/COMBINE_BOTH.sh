N=${1}
S=${2}
CASE=${3}
Y=${4}
X=${5}
#N1=$(( N + 1 ))

#if [[ "${1}" == "maxSTandTT" ]]; then
#    LABEL=MAX
#elif [[ "${1}" == "ST" ]]; then
#    LABEL=ST
#elif [[ "${1}" == "TT" ]]; then
#    LABEL=TT
#elif [[ "${1}" == "combSTandTT" ]]; then
#    LABEL=Comb
#fi

#echo "RM: ${RM}" >> COMBINE_OUTPUT_${N1}.txt

PS=""

#for j in `ls cards/input_MVAHuct${LABEL}_comb_huct.txt`; do
for j in `ls cards/input_MVAHuctComb_comb_huct.txt`; do
    i=`basename $j`
    #if [[ "$i" != "input_MVAHct${LABEL}_b4j4_hct.txt" ]]; then continue; fi
    #if [[ "$i" != "input_MVAHuct${LABEL}_b4j4_huct.txt" ]]; then continue; fi
#    if [[ "$i" != "input_MVAHct${LABEL}_comb_hct.txt" ]]; then continue; fi
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}_${N}_${CASE}_${Y}_${X}
    #rm -rf ${FOLDER}
    #mkdir ${FOLDER}
    #cd ${FOLDER}
    #COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --expectSignal 0.01 --rMin=-0.5 --rMax=0.5"
    #COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --expectSignal 0.01 --rMin=-0.1 --rMax=0.1"
    #COMMAND="combine -S ${S} cards/${i} -M Asymptotic --run blind --expectSignal 0.01 --rMin=-0.1 --rMax=0.1 -n ${FOLDER}"
    #COMMAND="combine -S ${S} cards/${i} -M Asymptotic --run blind --expectSignal 0.01 --rMin=-0.5 --rMax=0.5 -n ${FOLDER}"
    #COMMAND="combine -S ${S} cards/${i} -M Asymptotic --run blind --expectSignal 0.1 --rMin=-0.5 --rMax=0.5 -n ${FOLDER}"
    #COMMAND="combine -S ${S} cards/${i} -M Asymptotic --run blind --rMin=-5 --rMax=5 -n ${FOLDER}"
    #COMMAND="combine -S ${S} cards/${i} -M Asymptotic --run both --rMin=-5 --rMax=5 -n ${FOLDER}"
    #COMMAND="combine -S ${S} cards/${i} -M Asymptotic --run both -n ${FOLDER}"
    #COMMAND="combine -S ${S} cards/${i} -M Asymptotic --run both -n ${FOLDER}"
    #COMMAND="combine -S ${S} cards/${i} -M Asymptotic --rMin=-5 --rMax=5 --run both -n ${FOLDER}"
    COMMAND="combine -S ${S} cards/${i} -M Asymptotic -n ${FOLDER}"
    #COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-10 --rMax=10"
#    if [[ "$CASE" == "split" ]]; then
#        if   [[ "$i" == "input_MVAHuct${LABEL}_b2j3_huct.txt" ]]; then
#            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --expectSignal 0.01"
#        elif [[ "$i" == "input_MVAHuct${LABEL}_b3j3_huct.txt" ]]; then
#            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --expectSignal 0.01"
#        elif [[ "$i" == "input_MVAHuct${LABEL}_b2j4_huct.txt" ]]; then
#            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --expectSignal 0.01"
#        elif [[ "$i" == "input_MVAHuct${LABEL}_b3j4_huct.txt" ]]; then
#            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --expectSignal 0.01"# --rMin=-0.5 --rMax=0.5"
#        elif [[ "$i" == "input_MVAHuct${LABEL}_b4j4_huct.txt" ]]; then
#            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --expectSignal 0.01"
#        elif [[ "$i" == "input_MVAHuct${LABEL}_comb_huct.txt" ]]; then
#            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --expectSignal 0.01"
#        fi
#    fi
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT_${FOLDER}.txt
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT_${FOLDER}.txt &
    PS="$PS $!"
#    else
#        combine -S ${S} ..rds/${i} -M Asymptotic #-S 0
#    fi
#    fi
    #exit
    #cd ..
done

wait $PS

#exit

rm -f COMBINE_OUTPUT_${N}_${CASE}_${Y}_${X}.txt

#for i in `ls cards`; do
#for j in `ls cards/input_MVAHuct${LABEL}_comb_huct.txt`; do
for j in `ls cards/input_MVAHuctComb_comb_huct.txt`; do
    j=`basename $i`
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}_${N}_${CASE}_${Y}_${X}
    echo $i >> COMBINE_OUTPUT_${N}_${CASE}_${Y}_${X}.txt
    cat COMBINE_OUTPUT_${FOLDER}.txt >> COMBINE_OUTPUT_${N}_${CASE}_${Y}_${X}.txt
    echo >> COMBINE_OUTPUT_${N}_${CASE}_${Y}_${X}.txt;
    echo >> COMBINE_OUTPUT_${N}_${CASE}_${Y}_${X}.txt;
    echo >> COMBINE_OUTPUT_${N}_${CASE}_${Y}_${X}.txt;
done

grep "input_\|Expected \|Observed \|combine " COMBINE_OUTPUT_${N}_${CASE}_${Y}_${X}.txt > COMBINE_OUTPUT_${N}_x.txt
mv COMBINE_OUTPUT_${N}_x.txt COMBINE_OUTPUT_${N}_${CASE}_${Y}_${X}.txt

