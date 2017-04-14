N=${1}
S=${2}
M=125
#N1=$(( N + 1 ))

#echo "RM: ${RM}" >> COMBINE_OUTPUT_${N1}.txt


PS=""

for j in `ls cards/*2D*.txt`; do
    i=`basename $j`
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}
    rm -rf ${FOLDER}
    mkdir ${FOLDER}
    cd ${FOLDER}
    OPTIONS=""
    OPTIONS="$OPTIONS --saveFitResult"
    OPTIONS="$OPTIONS --startFromPreFit 1"
    OPTIONS="$OPTIONS --saveInactivePOI 1"
    OPTIONS="$OPTIONS --autoMaxPOIs *"
    OPTIONS="$OPTIONS --saveNLL"
    OPTIONS="$OPTIONS --profilingMode all"
    OPTIONS="$OPTIONS --do95 1"
    #COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m ${M} && combine -S ${S} -d ./${i/.txt/.root} -M MultiDimFit -m ${M} --snapshotName MultiDimFit --algo grid --setPhysicsModelParameterRanges r=0.00001,0.5 --points 50 --minimizerStrategy 0"
    COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m ${M} && combine -S ${S} -d ./${i/.txt/.root} -M MultiDimFit -m ${M} --algo singles --setPhysicsModelParameterRanges r=-5,5 --minimizerAlgoForMinos Minuit2,Migrad --robustFit 1 --minimizerStrategy 0 --points 10 $OPTIONS"
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT.txt
    #eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT.txt
    exit
    #eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT.txt &
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
    cat ${FOLDER}/COMBINE_OUTPUT.txt >> COMBINE_OUTPUT_maxSTandTT.txt
    echo >> COMBINE_OUTPUT_maxSTandTT.txt;
    echo >> COMBINE_OUTPUT_maxSTandTT.txt;
    echo >> COMBINE_OUTPUT_maxSTandTT.txt;
done

grep "input_\|Expected \|Observed \|combine " COMBINE_OUTPUT_maxSTandTT.txt > COMBINE_OUTPUT_maxSTandTT_1.txt
mv COMBINE_OUTPUT_maxSTandTT_1.txt COMBINE_OUTPUT_maxSTandTT.txt

