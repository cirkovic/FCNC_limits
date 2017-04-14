N=${1}
S=${2}
M=${M}
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
    ':
    if   [[ "$i" == "input_MVA2DMAX_b2j3.txt" ]]; then
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m ${M}  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M MultiDimFit --redefineSignalPOIs r_hut,r_hct"
    elif [[ "$i" == "input_MVA2DMAX_b3j3.txt" ]]; then
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m ${M}  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M MultiDimFit --redefineSignalPOIs r_hut,r_hct"
    elif [[ "$i" == "input_MVA2DMAX_b2j4.txt" ]]; then
        #COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m ${M}  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M MultiDimFit --redefineSignalPOIs r_hut,r_hct"
        #COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m ${M}  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M MultiDimFit --redefineSignalPOIs r_hut,r_hct --rMin=0.0 --rMax=0.1"
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m ${M}  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M MultiDimFit --redefineSignalPOIs r_hut,r_hct --rMin=0.0 --rMax=0.1"
    elif [[ "$i" == "input_MVA2DMAX_b3j4.txt" ]]; then
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m ${M}  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M MultiDimFit --redefineSignalPOIs r_hut,r_hct"
    elif [[ "$i" == "input_MVA2DMAX_b4j4.txt" ]]; then
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m ${M}  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M MultiDimFit --redefineSignalPOIs r_hut,r_hct"
    elif [[ "$i" == "input_MVA2DMAX_comb.txt" ]]; then
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m ${M}  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M MultiDimFit --redefineSignalPOIs r_hut,r_hct"
    fi
    '
    COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m ${M} && combine -S ${S} -d ./${i/.txt/.root} -M MultiDimFit -m ${M} --snapshotName MultiDimFit --algo grid --setPhysicsModelParameterRanges r=0.00001,0.5 --points 50 --minimizerStrategy 0"
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT.txt
    #eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT.txt
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT.txt &
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

