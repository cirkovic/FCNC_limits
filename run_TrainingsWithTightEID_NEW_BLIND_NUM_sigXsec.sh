N=${1}
CASE=${2}
OUTPUT=~/www/01-03-2017/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
OUTPUT=~/www/01-03-2017_1/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
OUTPUT=~/www/01-03-2017_3/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
OUTPUT=~/www/03-03-2017_2/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
OUTPUT=~/www/04-03-2017_limits/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
OUTPUT=~/www/04-03-2017_log/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
OUTPUT=~/www/15-03-2017/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
OUTPUT=~/www/17-03-2017/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}


unlink input
#ln -s input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${1} input
#ln -s /afs/cern.ch/user/k/kderoove/public/TrainingsWithTightEID/${1} input
ln -s /afs/cern.ch/work/c/cirkovic/rescaling/output input

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
sh ../make_combos_${1}.sh
cd ..

#./COMBINE_NEW_BLIND_${N}.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_1.sh ${N} ${S} ${CASE}
#./COMBINE_NEW_BLIND_3.sh ${N} ${S} ${CASE}
./COMBINE_NEW_BLIND_3a_sigXsec.sh ${N} ${S} ${CASE}

exit

python parse_combine_output_${N}.py COMBINE_OUTPUT_${N}.txt
cd limits
if [[ "${N}" == "combSTandTT" ]]; then
./runShow.sh $OUTPUT 60 20
fi
cd plot
./runShow.sh $OUTPUT
cd ../..


DATE=`date +%d%m%y_%H%M%S`
rm -rf backup_limits_blind_${CASE}_${DATE}
mkdir backup_limits_blind_${CASE}_${DATE}
cp limits/limits.h limits/plot/limitsHut.h limits/plot/limitsHct.h backup_limits_blind_${CASE}_${DATE}
cp -r produceCards.C cards INPUT_MVAH*t${LABEL}_*_h*t COMBINE_OUTPUT_${N}.txt backup_limits_blind_${CASE}_${DATE}

