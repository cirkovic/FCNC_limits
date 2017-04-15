OUTDIR=${1}
THIS=`pwd`
cd /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src
eval `scramv1 runtime -sh`
cd $THIS
N=combSTandTT
CASE=split
OUTPUT=~/www/01-03-2017/TrainingsWithTightEID_NEW_EXP_${CASE}/${N}
OUTPUT=~/www/01-03-2017_1/TrainingsWithTightEID_NEW_EXP_${CASE}/${N}
OUTPUT=~/www/01-03-2017_3/TrainingsWithTightEID_NEW_EXP_${CASE}/${N}
OUTPUT=~/www/03-03-2017_2/TrainingsWithTightEID_NEW_EXP_${CASE}/${N}
OUTPUT=~/www/04-03-2017_limits/TrainingsWithTightEID_NEW_EXP_${CASE}/${N}
OUTPUT=~/www/10-03-2017_wob4j4/TrainingsWithTightEID_NEW_EXP_${CASE}/${N}
OUTPUT=~/www/15-03-2017/TrainingsWithTightEID_NEW_EXP_${CASE}_wob4j4/${N}
OUTPUT=~/www/21-03-2017/limits/TrainingsWithTightEID_NEW_EXP_${CASE}_wob4j4/${N}
OUTPUT=~/www/22-03-2017/limits/TrainingsWithTightEID_NEW_EXP_${CASE}_wob4j4/${N}
OUTPUT=${OUTDIR}/TrainingsWithTightEID_NEW_EXP_${CASE}_wob4j4/${N}


unlink input
#ln -s input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N} input
#ln -s /afs/cern.ch/user/k/kderoove/public/TrainingsWithTightEID/${N} input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_22 input
ln -s /afs/cern.ch/work/c/cirkovic/rescaling/output input

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
cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_limits_rescaled1/produceCards_${N}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos_${N}_wob4j4.sh
cd ..

#./COMBINE_NEW_EXP_${N}.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_EXP.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_EXP_3.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_EXP_3a.sh ${N} ${S} ${CASE}
./COMBINE_NEW_EXP_rs.sh ${N} ${S} ${CASE}
python parse_combine_output_${N}_wob4j4.py COMBINE_OUTPUT_${N}.txt
cd limits
if [[ "${N}" == "combSTandTT" ]]; then
./runShowWob4j4_rs.sh $OUTPUT 25 25
fi
cd plot
./runShow_rs.sh $OUTPUT
cd ../..

DATE=`date +%d%m%y_%H%M%S`
rm -rf backup_limits_expected_${CASE}_${DATE}
mkdir backup_limits_expected_${CASE}_${DATE}
cp limits/limits.h limits/plot/limitsHut.h limits/plot/limitsHct.h backup_limits_expected_${CASE}_${DATE}
cp -r produceCards.C cards INPUT_MVAH*t${LABEL}_*_h*t COMBINE_OUTPUT_${N}.txt backup_limits_expected_${CASE}_${DATE}
