OUTPUT=${3}

rm pics/*
PS=""

N=${1}
M=${2}

root -l -b -q "limitXsecCat2Dvar.C(\"2D\", \"med\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComb2D.png $OUTPUT/LimitComb2D_med.png
cp pics/LimitComb2D.pdf $OUTPUT/LimitComb2D_med.pdf

root -l -b -q "limitXsecCat2Dvar.C(\"2D\", \"s1p\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComb2D.png $OUTPUT/LimitComb2D_s1p.png
cp pics/LimitComb2D.pdf $OUTPUT/LimitComb2D_sp1.pdf

root -l -b -q "limitXsecCat2Dvar.C(\"2D\", \"s1m\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComb2D.png $OUTPUT/LimitComb2D_s1m.png
cp pics/LimitComb2D.pdf $OUTPUT/LimitComb2D_s1m.pdf

root -l -b -q "limitXsecCat2Dvar.C(\"2D\", \"obs\", ${M}, ${N}, 1.0)" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComb2D.png $OUTPUT/LimitComb2D_obs.png
cp pics/LimitComb2D.pdf $OUTPUT/LimitComb2D_obs.pdf

