N=${1}
CASE=${2}
OUTPUT=~/www/01-03-2017_2/TrainingsWithTightEID_new_exp_min_${CASE}/${1}
OUTPUT=~/www/01-03-2017_4/TrainingsWithTightEID_new_exp_min_${CASE}/${1}
OUTPUT=~/www/02-03-2017_2/TrainingsWithTightEID_new_exp_min_${CASE}/${1}


unlink input
ln -s input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${1} input

rm -rf ${OUTPUT}
mkdir -p ${OUTPUT}

#N=22
#N=23
#N=24
#N=25
S=0
S=1

rm -rf cards
mkdir cards
#cp -f produceCards_medium.C produceCards.C
#cp -f produce_cards/medium/produceCards_${1}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_sig/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_sig_merged/produceCards_${N}.C produceCards.C
cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}/produceCards_${N}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos_${1}.sh
cd ..

#exit

#cp -rf ${1}/* .

#./COMBINE_NEW.sh ${N} ${S}
#./COMBINE_NEW_medium.sh ${N} ${S}
#./COMBINE_NEW_${N}.sh ${N} ${S}
#./COMBINE_NEW_${N}.sh ${N} ${S}
#./COMBINE_Closure_${N}.sh ${N} ${S}
#./COMBINE_Closure.sh ${N} ${S}
./COMBINE_Closure_NEW_minosAll_exp_min.sh ${N} ${S}

if [[ "${1}" == "maxSTandTT" ]]; then
    LABEL=MAX
elif [[ "${1}" == "ST" ]]; then
    LABEL=ST
elif [[ "${1}" == "TT" ]]; then
    LABEL=TT
elif [[ "${1}" == "combSTandTT" ]]; then
    LABEL=Comb
fi

#for i in 0 1; do
#for i in 1 05 01 005; do
for i in 0 1 05 01 005 001; do
    rm -f ${OUTPUT}/Closure_OUTPUT_${i}.txt
    for h in u c; do
        for c in b2j3 b3j3 b2j4 b3j4 b4j4 comb; do
            echo "=====> " INPUT_MVAH${h}t${LABEL}_${c}_h${h}t/*_${i}.txt >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
            grep "=====> \|Best fit r: " INPUT_MVAH${h}t${LABEL}_${c}_h${h}t/*_${i}.txt >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
            #grep "hname" -A 13 INPUT_MVAH${h}t${LABEL}_${c}_h${h}t/*_${i}.txt >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
            #grep "hname" -A 16 INPUT_MVAH${h}t${LABEL}_${c}_h${h}t/*_${i}.txt >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
            #grep "hname" -A 17 INPUT_MVAH${h}t${LABEL}_${c}_h${h}t/*_${i}.txt >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
            grep "hname" -A 19 INPUT_MVAH${h}t${LABEL}_${c}_h${h}t/*_${i}.txt >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
            echo >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
            echo >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
        done
    done
done

DATE=`date +%d%m%y_%H%M%S`
rm -rf backup_$DATE
mkdir backup_$DATE
cp -r produceCards.C cards INPUT_MVAH*t${LABEL}_*_h*t ${OUTPUT}/Closure_OUTPUT_*.txt backup_$DATE

