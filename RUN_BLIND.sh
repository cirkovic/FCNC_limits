OUTDIR=~/www/30-03-2017/limits
OUTDIR=~/www/31-03-2017/limits
OUTDIR=~/www/04-04-2017/limits
OUTDIR=~/www/05-04-2017/limits
OUTDIR=~/www/09-04-2017/limits
OUTDIR=~/www/11-04-2017/limits
OUTDIR=~/www/12-04-2017/limits
OUTDIR=~/www/13-04-2017/limits
THIS=`pwd`
cd /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src
eval `scramv1 runtime -sh`
cd $THIS
N=combSTandTT
CASE=split
OUTPUT=${OUTDIR}/TrainingsWithTightEID_NEW_BLIND_${CASE}/${N}


unlink input
#ln -s input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N} input
#ln -s /afs/cern.ch/user/k/kderoove/public/TrainingsWithTightEID/${N} input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_22 input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_31_hdampUncAdded input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_31_scaleEnvelopeNorm input
ln -s INPUT input
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
cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd/produceCards_${N}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos_${N}_new.sh
cd ..

#./COMBINE_NEW_BLIND_${N}.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_3.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_3a.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_small.sh ${N} ${S} ${CASE}
#./COMBINE_BLIND_small.sh ${N} ${S} ${CASE}
#./COMBINE_BLIND.sh ${N} ${S} ${CASE}
./COMBINE_BLIND_1.sh ${N} ${S} ${CASE}
#python parse_combine_output_${N}_wob4j4.py COMBINE_OUTPUT_${N}.txt
python parse_combine_output_${N}_wohutb4j4.py COMBINE_OUTPUT_${N}.txt
cd limits
if [[ "${N}" == "combSTandTT" ]]; then
#./runShowWob4j4_small.sh $OUTPUT 1.0 1.0
#./runShow_small_new.sh $OUTPUT 5.0 5.0
#./runShow_wohutb4j4.sh $OUTPUT 5.0 5.0
./runShow_wohutb4j4.sh $OUTPUT 6.0 6.0
fi
cd plot
#./runShow_small_1.sh $OUTPUT 100.0 0.01 100.0 0.01
./runShow_small_2.sh $OUTPUT 100.0 0.01 100.0 0.01
cd ../..

DATE=`date +%d%m%y_%H%M%S`
rm -rf backup_limits_blind_${CASE}_${DATE}
mkdir backup_limits_blind_${CASE}_${DATE}
cp limits/limits.h limits/plot/limitsHut.h limits/plot/limitsHct.h limits/limitNums_Hut.txt limits/limitNums_Hct.txt backup_limits_blind_${CASE}_${DATE}
cp -r produceCards.C cards INPUT_MVAH*t${LABEL}_*_h*t COMBINE_OUTPUT_${N}.txt backup_limits_blind_${CASE}_${DATE}

