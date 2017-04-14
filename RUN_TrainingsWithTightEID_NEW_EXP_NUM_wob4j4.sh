N=${1}
CASE=${2}
OUTPUT=~/www/01-03-2017/TrainingsWithTightEID_NEW_EXP_${CASE}/${1}
OUTPUT=~/www/01-03-2017_1/TrainingsWithTightEID_NEW_EXP_${CASE}/${1}
OUTPUT=~/www/01-03-2017_3/TrainingsWithTightEID_NEW_EXP_${CASE}/${1}
OUTPUT=~/www/03-03-2017_2/TrainingsWithTightEID_NEW_EXP_${CASE}/${1}
OUTPUT=~/www/04-03-2017_limits/TrainingsWithTightEID_NEW_EXP_${CASE}/${1}
OUTPUT=~/www/10-03-2017_wob4j4/TrainingsWithTightEID_NEW_EXP_${CASE}/${1}


unlink input
ln -s input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${1} input

rm -rf ${OUTPUT}
mkdir -p ${OUTPUT}

S=0
S=1

if [[ "${1}" == "maxSTandTT" ]]; then
    LABEL=MAX
elif [[ "${1}" == "ST" ]]; then
    LABEL=ST
elif [[ "${1}" == "TT" ]]; then
    LABEL=TT
elif [[ "${1}" == "combSTandTT" ]]; then
    LABEL=Comb
fi

rm -rf cards
mkdir cards
cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}/produceCards_${N}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos_${1}_wob4j4.sh
cd ..

#./COMBINE_NEW_EXP_${N}.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_EXP.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_EXP_3.sh ${N} ${S} ${CASE}
./COMBINE_NEW_EXP_3a.sh ${N} ${S} ${CASE}
python parse_combine_output_${N}_wob4j4.py COMBINE_OUTPUT_${N}.txt
cd limits
if [[ "${N}" == "combSTandTT" ]]; then
./runShowWob4j4.sh $OUTPUT 10 10
fi
cd plot
./runShow.sh $OUTPUT
cd ../..

DATE=`date +%d%m%y_%H%M%S`
rm -rf backup_limits_expected_${CASE}_${DATE}
mkdir backup_limits_expected_${CASE}_${DATE}
cp limits/limits.h limits/plot/limitsHut.h limits/plot/limitsHct.h backup_limits_expected_${CASE}_${DATE}
cp -r produceCards.C cards INPUT_MVAH*t${LABEL}_*_h*t COMBINE_OUTPUT_${N}.txt backup_limits_expected_${CASE}_${DATE}

