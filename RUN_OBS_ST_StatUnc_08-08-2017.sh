#N=${1}
#N=combSTandTT
N=ST
#CASE=${2}
CASE=split
OUTPUT=~/www/25-03-2017_STTT/TrainingsWithTightEID_NEW_OBS_${CASE}/${N}
#OUTPUT=${1}/TrainingsWithTightEID_NEW_OBS_${CASE}/${N}
#OUTPUTfalse=${1}/TrainingsWithTightEID_NEW_OBS_${CASE}_false/${N}
OUTPUT=${1}/TrainingsWithTightEID_NEW_OBS_${CASE}/${N}
OUTPUTBR=${1}/TrainingsWithTightEID_NEW_OBS_${CASE}_BR/${N}
OUTPUTcoup=${1}/TrainingsWithTightEID_NEW_OBS_${CASE}_coup/${N}


#unlink input
#ln -s input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N} input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_22 input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_31_hdampUncAdded input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_31_scaleEnvelopeNorm input
#ln -s INPUT input

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
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}/produceCards_ST.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1/produceCards_ST.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd/produceCards_ST.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc/produceCards_ST.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc_1/produceCards_ST.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc_2/produceCards_ST.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_combSTandTT_1_ttAdd_statBinUnc_corrected_StatUnc_2_14-06-2017/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_combSTandTT_1_ttAdd_statBinUnc_corrected_StatUnc_2_01-07-2017/produceCards_${N}.C produceCards.C
cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_combSTandTT_1_ttAdd_statBinUnc_corrected_StatUnc_2_08-08-2017/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc_3/produceCards_ST.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected/produceCards_ST.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos_${N}.sh
cd ..

#cp -r input_cards_ST cards
#cd cards
## ....
#cd ..

#exit

#rm -rf cards
#cp -r CARDS_StatUnc cards

#./COMBINE_NEW_OBS_${N}.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_OBS.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_OBS_1.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_OBS_3.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_OBS_4_small.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_OBS_5_small_ST.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_OBS_5_small_ST_1.sh ${N} ${S} ${CASE}
./COMBINE_OBS_ST.sh ${N} ${S} ${CASE}
#./COMBINE_OBS_ST_ML.sh ${N} ${S} ${CASE}

#if [[ "0" == "1" ]]; then

python parse_combine_output_${N}_wohutb4j4_obs.py COMBINE_OUTPUT_${N}.txt

cd limits
#if [[ "${N}" == "combSTandTT" ]]; then
#./runShowWob4j4_small.sh $OUTPUT 1.0 1.0
#./runShow_small_new.sh $OUTPUT 5.0 5.0
#./runShow_wohutb4j4.sh $OUTPUT 5.0 5.0
#/runShow_wohutb4j4_obs.sh $OUTPUT 25.0 25.0 true
#./runShow_wohutb4j4_obs.sh $OUTPUT 30.0 600.0 true
#./runShow_wohutb4j4_obs.sh $OUTPUT 10.0 160.0 false
#./runShow_wohutb4j4_obs.sh $OUTPUT 40.0 600.0 true
#./runShow_wohutb4j4_obs_STTT.sh $OUTPUT 40.0 600.0 true ST
#./runShow_wohutb4j4_obs_STTT.sh $OUTPUT 30.0 30.0 true ST
#./runShow_wohutb4j4_obs_STTT.sh $OUTPUT 15.0 15.0 true ST
#./runShow_wohutb4j4_obs_STTT.sh $OUTPUTfalse 15.0 15.0 false ST
#./runShow_wohutb4j4_obs_STTT.sh $OUTPUT 10.0 32.0 true ${N}
#./runShow_wohutb4j4_obs_STTT.sh $OUTPUTfalse 10.0 32.0 false ${N}
./runShow_wohutb4j4_obs_STTT_08-08-2017.sh $OUTPUT 10.0 32.0 0 ${N}
./runShow_wohutb4j4_obs_STTT_08-08-2017.sh $OUTPUTBR 10.0 32.0 1 ${N}
./runShow_wohutb4j4_obs_STTT_08-08-2017.sh $OUTPUTcoup 10.0 32.0 2 ${N}
#fi
cd plot
#./runShow_small_1.sh $OUTPUT 100.0 0.01 100.0 0.01
#./runShow_small_2_obs.sh $OUTPUT 100.0 0.01 100.0 0.01 1
#./runShow_small_2_obs.sh $OUTPUT 1000.0 0.1 1000.0 0.1 1
#./runShow_small_2_obs.sh $OUTPUT 100.0 0.01 100.0 0.01 0
#./runShow_small_2_obs.sh $OUTPUT 1000.0 0.1 1000.0 0.1 1
#./runShow_small_2_obs_STTT.sh $OUTPUT 1000.0 0.1 1000.0 0.1 1 ST
#./runShow_small_2_obs_STTT.sh $OUTPUT 100.0 0.01 100.0 0.01 1 ${N}
#./runShow_small_2_obs_STTT.sh $OUTPUTfalse 100.0 0.01 100.0 0.01 0 ${N}
#./runShow_small_2_obs_STTT_08-08-2017.sh $OUTPUT 100.0 0.01 100.0 0.01 0 ${N}
#./runShow_small_2_obs_STTT_08-08-2017.sh $OUTPUTBR 100.0 0.01 100.0 0.01 1 ${N}
#./runShow_small_2_obs_STTT_08-08-2017.sh $OUTPUTcoup 100.0 0.01 100.0 0.01 2 ${N}
./runShow_small_2_obs_STTT_08-08-2017.sh $OUTPUT 2000.0 0.2 2000.0 0.2 0 ${N}
./runShow_small_2_obs_STTT_08-08-2017.sh $OUTPUTBR 2000.0 0.2 2000.0 0.2 1 ${N}
./runShow_small_2_obs_STTT_08-08-2017.sh $OUTPUTcoup 2000.0 0.2 2000.0 0.2 2 ${N}
cd ../..

#fi

DATE=`date +%d%m%y_%H%M%S`
rm -rf backup_limits_blind_${CASE}_${DATE}
mkdir backup_limits_blind_${CASE}_${DATE}
cp limits/limits.h limits/plot/limitsHut.h limits/plot/limitsHct.h limits/limitNums_Hut.txt limits/limitNums_Hct.txt backup_limits_blind_${CASE}_${DATE}
cp -r produceCards.C cards INPUT_MVAH*t${LABEL}_*_h*t COMBINE_OUTPUT_${N}.txt backup_limits_blind_${CASE}_${DATE}

