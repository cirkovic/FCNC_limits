OUTPUT=${1}

rm pics/*
PS=""

M1=${2}
M2=${3}

#root -l "limitComp.C(\"Hut\", 0, 250)" && display pics/LimitComp_Hut.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 250)" && display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 80)" && display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 10)" && display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 30)" && display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 2)" #&& display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 30)" #&& display pics/LimitComp_Hut_1.eps &
root -l "limitXsecCatST.C(\"Hut\", 0, ${M1})" #&& display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 5)" #&& display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 50)" && display pics/LimitComp_Hut_1.eps &
#PS="$PS $!"

#root -l "limitComp.C(\"Hct\", 0, 150)" && display pics/LimitComp_Hct.eps &
#root -l "limitXsecCat.C(\"Hct\", 0, 150)" && display pics/LimitComp_Hct_1.eps &
#root -l "limitXsecCat.C(\"Hct\", 0, 25)" && display pics/LimitComp_Hct_1.eps &
#root -l "limitXsecCat.C(\"Hct\", 0, 5)" && display pics/LimitComp_Hct_1.eps &
#root -l "limitXsecCat.C(\"Hct\", 0, 20)" #&& display pics/LimitComp_Hct_1.eps &
#root -l "limitXsecCat.C(\"Hct\", 0, 5)" #&& display pics/LimitComp_Hct_1.eps &
#root -l "limitXsecCat.C(\"Hct\", 0, 2)" #&& display pics/LimitComp_Hct_1.eps &
#root -l "limitXsecCat.C(\"Hct\", 0, 30)" #&& display pics/LimitComp_Hct_1.eps #&
root -l "limitXsecCatST.C(\"Hct\", 0, ${M2})" #&& display pics/LimitComp_Hct_1.eps #&
#root -l "limitXsecCat.C(\"Hct\", 0, 50)" && display pics/LimitComp_Hct_1.eps &
#PS="$PS $!"

#wait $PS

cp pics/LimitComp_Hut_1.png $OUTPUT/LimitHutMax.png
cp pics/LimitComp_Hut_1.pdf $OUTPUT/LimitHutMax.pdf
cp pics/LimitComp_Hct_1.png $OUTPUT/LimitHctMax.png
cp pics/LimitComp_Hct_1.pdf $OUTPUT/LimitHctMax.pdf

