OUTPUT=~/www/21-03-2017/limits
OUTPUT=~/www/22-03-2017/limits
OUTPUT=~/www/23-03-2017/limits
OUTPUT=~/www/24-03-2017/limits

./RUN_BLIND_combSTandTT_small.sh ${OUTPUT}
./RUN_BLIND_combSTandTT_wob4j4_small.sh ${OUTPUT}
./RUN_EXP_combSTandTT_small.sh ${OUTPUT}
./RUN_EXP_combSTandTT_wob4j4_small.sh ${OUTPUT}

cp ${OUTPUT}/TrainingsWithTightEID_NEW_BLIND_split_wob4j4/combSTandTT/LimitHutMax.*      ${OUTPUT}/TrainingsWithTightEID_NEW_BLIND_split_merged/combSTandTT/
cp ${OUTPUT}/TrainingsWithTightEID_NEW_BLIND_split_wob4j4/combSTandTT/LimitHutCoupling.* ${OUTPUT}/TrainingsWithTightEID_NEW_BLIND_split_merged/combSTandTT/
cp ${OUTPUT}/TrainingsWithTightEID_NEW_BLIND_split/combSTandTT/LimitHctMax.*             ${OUTPUT}/TrainingsWithTightEID_NEW_BLIND_split_merged/combSTandTT/
cp ${OUTPUT}/TrainingsWithTightEID_NEW_BLIND_split/combSTandTT/LimitHctCoupling.*        ${OUTPUT}/TrainingsWithTightEID_NEW_BLIND_split_merged/combSTandTT/

cp ${OUTPUT}/TrainingsWithTightEID_NEW_EXP_split_wob4j4/combSTandTT/LimitHutMax.*        ${OUTPUT}/TrainingsWithTightEID_NEW_EXP_split_merged/combSTandTT/
cp ${OUTPUT}/TrainingsWithTightEID_NEW_EXP_split_wob4j4/combSTandTT/LimitHutCoupling.*   ${OUTPUT}/TrainingsWithTightEID_NEW_EXP_split_merged/combSTandTT/
cp ${OUTPUT}/TrainingsWithTightEID_NEW_EXP_split/combSTandTT/LimitHctMax.*               ${OUTPUT}/TrainingsWithTightEID_NEW_EXP_split_merged/combSTandTT/
cp ${OUTPUT}/TrainingsWithTightEID_NEW_EXP_split/combSTandTT/LimitHctCoupling.*          ${OUTPUT}/TrainingsWithTightEID_NEW_EXP_split_merged/combSTandTT/

