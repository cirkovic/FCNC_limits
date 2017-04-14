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
    if   [[ "$i" == "input_MVA2DTT_b2j3.txt" ]]; then
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m 125  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M Asymptotic --redefineSignalPOIs r_hut,r_hct"
    elif [[ "$i" == "input_MVA2DTT_b3j3.txt" ]]; then
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m 125  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M Asymptotic --redefineSignalPOIs r_hut,r_hct"
    elif [[ "$i" == "input_MVA2DTT_b2j4.txt" ]]; then
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m 125  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M Asymptotic --redefineSignalPOIs r_hut,r_hct"
    elif [[ "$i" == "input_MVA2DTT_b3j4.txt" ]]; then
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m 125  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M Asymptotic --redefineSignalPOIs r_hut,r_hct"
    elif [[ "$i" == "input_MVA2DTT_b4j4.txt" ]]; then
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m 125  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M Asymptotic --redefineSignalPOIs r_hut,r_hct"
    elif [[ "$i" == "input_MVA2DTT_comb.txt" ]]; then
        COMMAND="text2workspace.py ../cards/${i} -o ./${i/.txt/.root} -m 125  -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO 'map=hut/sig:r_hut[1,0,10]' --PO 'map=hct/sig:r_hct[1,0,10]' && combine -S ${S} -d ./${i/.txt/.root} -M Asymptotic --redefineSignalPOIs r_hut,r_hct"
    fi
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT.txt
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT.txt &
    PS="$PS $!"
    cd ..
done

wait $PS

rm -f COMBINE_OUTPUT_TT.txt

for i in `ls cards`; do
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}
    echo $i >> COMBINE_OUTPUT_TT.txt
    cat ${FOLDER}/COMBINE_OUTPUT.txt >> COMBINE_OUTPUT_TT.txt
    echo >> COMBINE_OUTPUT_TT.txt;
    echo >> COMBINE_OUTPUT_TT.txt;
    echo >> COMBINE_OUTPUT_TT.txt;
done

grep "input_\|Expected \|Observed \|combine " COMBINE_OUTPUT_TT.txt > COMBINE_OUTPUT_TT_1.txt
mv COMBINE_OUTPUT_TT_1.txt COMBINE_OUTPUT_TT.txt

