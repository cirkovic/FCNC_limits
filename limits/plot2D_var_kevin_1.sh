rm pics/*
PS=""

name=${1}
N=${2}
M=${3}
OUTPUT=${4}

#root -l -b -q "plotLimitXsecCat2Dvar_kevin_1.C(\"2D\", \"${name}\", \"ALL\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &
if [[ "0" == "1" ]]; then
root -l -b -q "plotLimitXsecCat2Dvar_kevin_ALL_1.C(\"2D\", \"${name}\", \"ALL\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComb2D.png $OUTPUT/LimitComb2D_ALL_1.png
cp pics/LimitComb2D.pdf $OUTPUT/LimitComb2D_ALL_1.pdf

cp pics/fLimitComb2D.png $OUTPUT/fLimitComb2D_ALL_1.png
cp pics/fLimitComb2D.pdf $OUTPUT/fLimitComb2D_ALL_1.pdf

exit

fi

root -l -b -q "plotLimitXsecCat2Dvar_kevin_1.C(\"2D\", \"${name}\", \"med\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComb2D.png $OUTPUT/LimitComb2D_med.png
cp pics/LimitComb2D.pdf $OUTPUT/LimitComb2D_med.pdf

root -l -b -q "plotLimitXsecCat2Dvar_kevin_1.C(\"2D\", \"${name}\", \"s1m\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComb2D.png $OUTPUT/LimitComb2D_s1m.png
cp pics/LimitComb2D.pdf $OUTPUT/LimitComb2D_s1m.pdf

root -l -b -q "plotLimitXsecCat2Dvar_kevin_1.C(\"2D\", \"${name}\", \"s1p\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComb2D.png $OUTPUT/LimitComb2D_s1p.png
cp pics/LimitComb2D.pdf $OUTPUT/LimitComb2D_sp1.pdf

root -l -b -q "plotLimitXsecCat2Dvar_kevin_1.C(\"2D\", \"${name}\", \"obs\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComb2D.png $OUTPUT/LimitComb2D_obs.png
cp pics/LimitComb2D.pdf $OUTPUT/LimitComb2D_obs.pdf

root -l -b -q "plotLimitXsecCat2Dvar_kevin_ALL_1.C(\"2D\", \"${name}\", \"ALL\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComb2D.png $OUTPUT/LimitComb2D_ALL_1.png
cp pics/LimitComb2D.pdf $OUTPUT/LimitComb2D_ALL_1.pdf

cp pics/fLimitComb2D.png $OUTPUT/fLimitComb2D_ALL_1.png
cp pics/fLimitComb2D.pdf $OUTPUT/fLimitComb2D_ALL_1.pdf

exit

root -l -b -q "plotLimitXsecCat2Dvar_kevin_1.C(\"2D\", \"${name}\", \"all\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComb2D.png $OUTPUT/LimitComb2D_all.png
cp pics/LimitComb2D.pdf $OUTPUT/LimitComb2D_all.pdf

