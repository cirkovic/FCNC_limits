N=${1}
CASE=${2}
OUTPUT=~/www/01-03-2017/TrainingsWithTightEID_NEW_BLIND_${CASE}/${N}
OUTPUT=~/www/01-03-2017_1/TrainingsWithTightEID_NEW_BLIND_${CASE}/${N}
OUTPUT=~/www/01-03-2017_3/TrainingsWithTightEID_NEW_BLIND_${CASE}/${N}
OUTPUT=~/www/02-03-2017_1/TrainingsWithTightEID_NEW_BLIND_${CASE}/${N}
OUTPUT=~/www/05-03-2017_STTT/TrainingsWithTightEID_NEW_BLIND_${CASE}/${N}


unlink input
ln -s input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N} input

rm -rf ${OUTPUT}
mkdir -p ${OUTPUT}

S=0
S=1

if [[ "${N}" == "maxSTandTT" ]]; then
    LABEL=MAX
elif [[ "${N}" == "ST" ]]; then
    LABEL=ST
elif [[ "${N}" == "TT" ]]; then
    LABEL=TT
elif [[ "${N}" == "combSTandTT" ]]; then
    LABEL=Comb
fi

rm -rf cards
mkdir cards
cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}/produceCards_${N}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos_${N}.sh
cd ..

#./COMBINE_NEW_BLIND_${N}.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_1.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_3.sh ${N} ${S} ${CASE}
./COMBINE_NEW_BLIND_4.sh ${N} ${S} ${CASE}
python parse_combine_output_${N}.py COMBINE_OUTPUT_${N}.txt
cd limits
if   [ "${N}" == "ST" ]; then
    ./runShowST.sh $OUTPUT 25 25
elif [ "${N}" == "TT" ]; then
    ./runShowTT.sh $OUTPUT 40 20
fi
cd plot
if   [ "${N}" == "ST" ]; then
    ./runShowST.sh $OUTPUT 5e-3 1e3
elif [ "${N}" == "TT" ]; then
    ./runShowTT.sh $OUTPUT 5e-3 1e3
fi
cd ../..

DATE=`date +%d%m%y_%H%M%S`
rm -rf backup_limits_blind_${CASE}_${DATE}
mkdir backup_limits_blind_${CASE}_${DATE}
cp limits/limits.h limits/plot/limitsHut.h limits/plot/limitsHct.h backup_limits_blind_${CASE}_${DATE}
cp -r produceCards.C cards INPUT_MVAH*t${LABEL}_*_h*t COMBINE_OUTPUT_${N}.txt backup_limits_blind_${CASE}_${DATE}
