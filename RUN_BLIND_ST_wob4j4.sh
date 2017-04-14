#N=${1}
N=combSTandTT
#CASE=${2}
CASE=split
OUTPUT=~/www/01-03-2017/TrainingsWithTightEID_NEW_BLIND_${CASE}/${N}
OUTPUT=~/www/01-03-2017_1/TrainingsWithTightEID_NEW_BLIND_${CASE}/${N}
OUTPUT=~/www/01-03-2017_3/TrainingsWithTightEID_NEW_BLIND_${CASE}/${N}
OUTPUT=~/www/02-03-2017_1/TrainingsWithTightEID_NEW_BLIND_${CASE}/${N}
OUTPUT=~/www/05-03-2017_STTT/TrainingsWithTightEID_NEW_BLIND_${CASE}/${N}
OUTPUT=~/www/25-03-2017_STTT/TrainingsWithTightEID_NEW_BLIND_${CASE}_wob4j4/ST
OUTPUT=${1}/TrainingsWithTightEID_NEW_BLIND_${CASE}_wob4j4/ST


unlink input
#ln -s input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N} input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_22 input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_31_hdampUncAdded input
ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_31_scaleEnvelopeNorm input

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
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}/produceCards_ST.C produceCards.C
cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1/produceCards_ST.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos_${N}_wob4j4.sh
cd ..

#./COMBINE_NEW_BLIND_${N}.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_1.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_3.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_4_small.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_5_small_ST.sh ${N} ${S} ${CASE}
./COMBINE_NEW_BLIND_5_small_ST_1.sh ${N} ${S} ${CASE}
python parse_combine_output_${N}_wob4j4.py COMBINE_OUTPUT_${N}.txt
#cd limits
#if   [ "${N}" == "ST" ]; then
#    ./runShowST.sh $OUTPUT 25 25
#elif [ "${N}" == "TT" ]; then
#    ./runShowTT.sh $OUTPUT 40 20
#fi
#cd plot
#if   [ "${N}" == "ST" ]; then
#    ./runShowST.sh $OUTPUT 5e-3 1e3
#elif [ "${N}" == "TT" ]; then
#    ./runShowTT.sh $OUTPUT 5e-3 1e3
#fi
#cd ../..
cd limits
if [[ "${N}" == "combSTandTT" ]]; then
./runShowWob4j4_small.sh $OUTPUT 10.0 35.0
fi
cd plot
./runShow_small_1.sh $OUTPUT 100.0 0.01 100.0 0.01
cd ../..

DATE=`date +%d%m%y_%H%M%S`
rm -rf backup_limits_blind_${CASE}_${DATE}
mkdir backup_limits_blind_${CASE}_${DATE}
cp limits/limits.h limits/plot/limitsHut.h limits/plot/limitsHct.h limits/limitNums_Hut.txt limits/limitNums_Hct.txt backup_limits_blind_${CASE}_${DATE}
cp -r produceCards.C cards INPUT_MVAH*t${LABEL}_*_h*t COMBINE_OUTPUT_${N}.txt backup_limits_blind_${CASE}_${DATE}

