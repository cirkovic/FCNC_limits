CASE=${1}
X=${2}
Y=${3}

cd /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src
eval `scramv1 runtime -sh`
#cd /afs/cern.ch/work/c/cirkovic/FCNC_limits/2D_5_50_0.2/limits_${CASE}_${Y}_${X}
#cd /afs/cern.ch/work/c/cirkovic/FCNC_limits/2D_hut_50_1.0/limits_${CASE}_${Y}_${X}
#cd /afs/cern.ch/work/c/cirkovic/FCNC_limits/2D_3_3.5/limits_${CASE}_${Y}_${X}
#cd /afs/cern.ch/work/c/cirkovic/FCNC_limits/2D_9_28.5_1/limits_${CASE}_${Y}_${X}
#cd /afs/cern.ch/work/c/cirkovic/FCNC_limits/2D_9_0.27_1/limits_${CASE}_${Y}_${X}
cd /afs/cern.ch/work/c/cirkovic/FCNC_limits/test/limits_${CASE}_${Y}_${X}

#OUTPUT=~/www/01-03-2017/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
#OUTPUT=~/www/01-03-2017_1/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
#OUTPUT=~/www/01-03-2017_3/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
#OUTPUT=~/www/03-03-2017_2/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
#OUTPUT=~/www/04-03-2017_limits/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
#OUTPUT=~/www/04-03-2017_log/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}
#OUTPUT=~/www/06-03-2017_2D/TrainingsWithTightEID_NEW_BLIND_${CASE}/${1}/${X}

S=0
S=1

#if [[ "${1}" == "maxSTandTT" ]]; then
#    LABEL=MAX
#elif [[ "${1}" == "ST" ]]; then
#    LABEL=ST
#elif [[ "${1}" == "TT" ]]; then
#    LABEL=TT
#elif [[ "${1}" == "combSTandTT" ]]; then
#    LABEL=Comb
#fi

#rm -rf limits_${CASE}_${Y}_${X}
#mkdir limits_${CASE}_${Y}_${X}
#cd limits_${CASE}_${Y}_${X}

PS=""

#for N in combSTandTT ST TT; do
for N in combSTandTT; do
#for N in combSTandTT; do

    mkdir ${N}
    cd ${N}

    #ln -s ../input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${1}_2D/${Y}_${X} input

    #rm -rf ${OUTPUT}
    #mkdir -p ${OUTPUT}


    #if [[ "${X}" == "0" ]]; then

    mkdir cards
    #cp -f ../produce_cards/TrainingsWithTightEID_NEW_${CASE}_2D/produceCards_${N}.C produceCards.C
    #cp -f ../produce_cards/TrainingsWithTightEID_NEW_${CASE}_2D_rs/produceCards_${N}.C produceCards.C
    #cp -f ../produce_cards/TrainingsWithTightEID_NEW_${CASE}_2D_100/produceCards_${N}.C produceCards.C
    #cp -f ../produce_cards/TrainingsWithTightEID_NEW_${CASE}_2D_50/produceCards_${N}.C produceCards.C
    #cp -f ../produce_cards/TrainingsWithTightEID_NEW_${CASE}_2D_100_1/produceCards_${N}.C produceCards.C
    #cp -f ../produce_cards/TrainingsWithTightEID_NEW_${CASE}_2D_50_1/produceCards_${N}.C produceCards.C
    #cp -f ../../../produce_cards/2D/produceCards_${N}.C produceCards.C
    #cp -f ../../../produce_cards/2D_StatUnc/produceCards_${N}.C produceCards.C
    #cp -f ../../../produce_cards/2D_StatUnc1/produceCards_${N}.C produceCards.C
    #cp -f ../../../produce_cards/2D_StatUnc2/produceCards_${N}.C produceCards.C
    cp -f ../../produce_cards/2D_StatUnc2/produceCards_${N}.C produceCards.C
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling_18-04-2017_5_50_0.2 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling_z_50_0.2 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling_z_50_1.0 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling_z1_50_1.0 ${Y}_${X}
    #/../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling_z2_50_1.0 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling_z5_50_1.0 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling_z6_50_1.0 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling_z7_50_1.0 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling_z8_50_1.0 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling_hut_50_1.0 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/rescaling_hut_05_50_0.5 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/2dinputs ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/2dinputs1 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/2dinputs2 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/2dinputs3 ${Y}_${X}
    #./../../produceCardsXY.zsh root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/2dinputs4 ${Y}_${X}
    ./../../produceCardsXY.zsh /afs/cern.ch/work/c/cirkovic/FCNC_limits/test ${Y}_${X}
    cd cards
    #sh ../../make_2D_combos_${N}.sh
    sh ../../../make_2D_combos.sh
    cd ..
    #fi

    #exit

    #./COMBINE_NEW_BLIND_${N}.sh ${N} ${S} ${CASE}
    #./COMBINE_NEW_BLIND.sh ${N} ${S} ${CASE}
    #./COMBINE_NEW_BLIND_1.sh ${N} ${S} ${CASE}
    #./COMBINE_NEW_BLIND_3.sh ${N} ${S} ${CASE}
    #./COMBINE_NEW_BLIND_3a.sh ${N} ${S} ${CASE}
    #./../COMBINE_NEW_BLIND_3b.sh ${N} ${S} ${CASE} ${X} ${Y}
    #./../COMBINE_NEW_BLIND_3c.sh ${N} ${S} ${CASE} ${Y} ${X}
    #./../COMBINE_NEW_BLIND_3c_small.sh ${N} ${S} ${CASE} ${Y} ${X}
    #./../COMBINE_NEW_BLIND_3c_small_1.sh ${N} ${S} ${CASE} ${Y} ${X}
    #./../COMBINE_NEW_BLIND_3c_small_2.sh ${N} ${S} ${CASE} ${Y} ${X}
    ./../../COMBINE_BOTH.sh ${N} ${S} ${CASE} ${Y} ${X} &
    PS="$PS $!"
    #python parse_combine_output_${N}.py COMBINE_OUTPUT_${N}.txt
    #cd limits
    #if [[ "${N}" == "combSTandTT" ]]; then
    #./runShow.sh $OUTPUT 60 20
    #fi
    #cd plot
    #./runShow.sh $OUTPUT
    #cd ../..

    #rm -rf cards
    #rm *.root *.C

    cd ..

done

wait ${PS}

#for N in combSTandTT ST TT; do
#    rm -rf ${N}/cards ${N}/*.root ${N}/*.C
#done

#cd ..
