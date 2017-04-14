OUTPUT=${1}

rm pics/*
PS=""

M1=${2}

root -l "limitXsecCat2D.C(\"2D\", 0, ${M1})" #&& display pics/LimitComp_Hut_1.eps &

cp pics/LimitComp_2D_1.png $OUTPUT/Limit2DMax.png
cp pics/LimitComp_2D_1.pdf $OUTPUT/Limit2DMax.pdf

