OUTDIR=~/www/30-03-2017/limits
OUTDIR=~/www/31-03-2017/limits
OUTDIR=~/www/04-04-2017/limits
OUTDIR=~/www/05-04-2017/limits
OUTDIR=~/www/09-04-2017/limits
OUTDIR=~/www/11-04-2017/limits
OUTDIR=~/www/12-04-2017/limits
OUTDIR=~/www/13-04-2017/limits
OUTDIR=~/www/14-04-2017/limits
OUTDIR=~/www/20-04-2017/limits
OUTDIR=~/www/21-04-2017/limits
OUTDIR=${1}/limits
THIS=`pwd`
cd /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src
eval `scramv1 runtime -sh`
cd $THIS
N=combSTandTT
CASE=split
OUTPUT=${OUTDIR}/TrainingsWithTightEID_NEW_OBS_${CASE}/${N}
OUTPUTfalse=${OUTDIR}/TrainingsWithTightEID_NEW_OBS_${CASE}_false/${N}


#unlink input
#ln -s input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N} input
#ln -s /afs/cern.ch/user/k/kderoove/public/TrainingsWithTightEID/${N} input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_22 input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_31_hdampUncAdded input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_31_scaleEnvelopeNorm input
#ln -s INPUT input
#ln -s /afs/cern.ch/work/c/cirkovic/rescaling/output input

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
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_limits_rescaled1/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc_1/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc_2/produceCards_${N}.C produceCards.C
cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc_2_CutAndCount/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc_3/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected/produceCards_${N}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos_${N}_new.sh
cd ..

#rm -rf cards
#cp -r CARDS_StatUnc cards

#rm -rf cards
##cp -r /afs/cern.ch/user/k/kderoove/public/Trainings_2017_04_24_statBinUnc_corrected/cards_StatUnc/ CARDS_StatUnc
#cp -r CARDS_StatUnc cards

#./COMBINE_NEW_BLIND_${N}.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_3.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_3a.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_small.sh ${N} ${S} ${CASE}
#./COMBINE_BLIND_small.sh ${N} ${S} ${CASE}
#./COMBINE_BLIND.sh ${N} ${S} ${CASE}
./COMBINE_OBS_1.sh ${N} ${S} ${CASE}
#./COMBINE_OBS_1_ML.sh ${N} ${S} ${CASE}
#python parse_combine_output_${N}_wob4j4.py COMBINE_OUTPUT_${N}.txt

#if [[ "0" == "1" ]]; then

python parse_combine_output_${N}_wohutb4j4_obs.py COMBINE_OUTPUT_${N}.txt

cd limits
if [[ "${N}" == "combSTandTT" ]]; then
#./runShowWob4j4_small.sh $OUTPUT 1.0 1.0
#./runShow_small_new.sh $OUTPUT 5.0 5.0
#./runShow_wohutb4j4.sh $OUTPUT 5.0 5.0
#./runShow_wohutb4j4_obs.sh $OUTPUT 25.0 25.0 true
#./runShow_wohutb4j4_obs.sh $OUTPUT 6.0 6.0 true
#./runShow_wohutb4j4_obs.sh $OUTPUT 6.0 6.0 false
#./runShow_wohutb4j4_obs.sh $OUTPUT 6.0 6.0 true
#./runShow_wohutb4j4_obs.sh $OUTPUT 25.0 25.0 true
#./runShow_wohutb4j4_obs.sh $OUTPUT 15.0 15.0 true
#./runShow_wohutb4j4_obs.sh $OUTPUTfalse 15.0 15.0 false
#./runShow_wohutb4j4_obs_CutAndCount.sh $OUTPUT 15.0 15.0 true
#./runShow_wohutb4j4_obs_CutAndCount.sh $OUTPUTfalse 15.0 15.0 false
./runShow_wohutb4j4_obs_CutAndCount.sh $OUTPUT 100.0 100.0 true
./runShow_wohutb4j4_obs_CutAndCount.sh $OUTPUTfalse 100.0 100.0 false
fi
cd plot
#./runShow_small_1.sh $OUTPUT 100.0 0.01 100.0 0.01
#./runShow_small_2_obs.sh $OUTPUT 100.0 0.01 100.0 0.01 1
#./runShow_small_2_obs.sh $OUTPUT 100.0 0.01 100.0 0.01 0
#./runShow_small_2_obs.sh $OUTPUT 100.0 0.01 100.0 0.01 1
./runShow_small_2_obs_CutAndCount.sh $OUTPUT 100.0 0.01 100.0 0.01 1
./runShow_small_2_obs_CutAndCount.sh $OUTPUTfalse 100.0 0.01 100.0 0.01 0
cd ../..

#rm -rf cards
#cp -r /afs/cern.ch/user/k/kderoove/public/Trainings_2017_04_24_statBinUnc_corrected/cards_StatUnc cards

#fi

DATE=`date +%d%m%y_%H%M%S`
rm -rf backup_limits_blind_${CASE}_${DATE}
mkdir backup_limits_blind_${CASE}_${DATE}
cp limits/limits.h limits/plot/limitsHut.h limits/plot/limitsHct.h limits/limitNums_Hut.txt limits/limitNums_Hct.txt backup_limits_blind_${CASE}_${DATE}
cp -r produceCards.C cards INPUT_MVAH*t${LABEL}_*_h*t COMBINE_OUTPUT_${N}.txt backup_limits_blind_${CASE}_${DATE}

