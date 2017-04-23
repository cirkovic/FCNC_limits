rm -rf backup_*

OUTDIR=~/www/29-03-2017_STTT
OUTDIR=~/www/31-03-2017_STTT
OUTDIR=~/www/05-04-2017_STTT
OUTDIR=~/www/09-04-2017_STTT
OUTDIR=~/www/11-04-2017_STTT
OUTDIR=~/www/12-04-2017_STTT
OUTDIR=~/www/14-04-2017_STTT
OUTDIR=~/www/20-04-2017_STTT
OUTDIR=~/www/21-04-2017_STTT

./RUN_OBS_ST.sh ${OUTDIR}

./RUN_OBS_TT.sh ${OUTDIR}

#./RUN_OBS_ST_wob4j4.sh ${OUTDIR}
#./RUN_OBS_TT_wob4j4.sh ${OUTDIR}

#rm  ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/ST/*.*
#rm  ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/TT/*.*

#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_wob4j4/ST/LimitHutCoupling.pdf ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/ST/LimitHutCoupling.pdf
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_wob4j4/ST/LimitHutCoupling.png ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/ST/LimitHutCoupling.png
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_wob4j4/ST/LimitHutMax.pdf      ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/ST/LimitHutMax.pdf
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_wob4j4/ST/LimitHutMax.png      ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/ST/LimitHutMax.png

#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split/ST/LimitHctCoupling.pdf ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/ST/LimitHctCoupling.pdf
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split/ST/LimitHctCoupling.png ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/ST/LimitHctCoupling.png
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split/ST/LimitHctMax.pdf      ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/ST/LimitHctMax.pdf
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split/ST/LimitHctMax.png      ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/ST/LimitHctMax.png

#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_wob4j4/TT/LimitHutCoupling.pdf ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/TT/LimitHutCoupling.pdf
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_wob4j4/TT/LimitHutCoupling.png ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/TT/LimitHutCoupling.png
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_wob4j4/TT/LimitHutMax.pdf      ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/TT/LimitHutMax.pdf
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_wob4j4/TT/LimitHutMax.png      ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/TT/LimitHutMax.png

#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split/TT/LimitHctCoupling.pdf ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/TT/LimitHctCoupling.pdf
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split/TT/LimitHctCoupling.png ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/TT/LimitHctCoupling.png
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split/TT/LimitHctMax.pdf      ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/TT/LimitHctMax.pdf
#cp ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split/TT/LimitHctMax.png      ${OUTDIR}/TrainingsWithTightEID_NEW_OBS_split_merged/TT/LimitHctMax.png

