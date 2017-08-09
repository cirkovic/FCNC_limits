OUTPUT=~/www/09-02-2017/2
OUTPUT=~/www/09-02-2017/3
OUTPUT=~/www/09-02-2017/4
OUTPUT=~/www/09-02-2017/5
OUTPUT=${1}

rm pics/*
rm limitNums_Hut_*.txt limitNums_Hct_*.txt
#PS=""

M1=${2}
M2=${3}
show=${4}
sttt=${5}

#root -l "limitComp.C(\"Hut\", 0, 250)" && display pics/LimitComp_Hut.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 250)" && display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 80)" && display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 10)" && display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 30)" && display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 2)" #&& display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCat.C(\"Hut\", 0, 30)" #&& display pics/LimitComp_Hut_1.eps &
#root -l "limitXsecCatShowWob4j4_small.C(\"Hut\", 0, ${M1})" #&& display pics/LimitComp_Hut_1.eps &
root -l "limitXsecCatShowWob4j4_small_obs_STTT_08082017.C(\"Hut\", \"${sttt}\", 0, ${M1}, ${show})" #&& display pics/LimitComp_Hut_1.eps &
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
#root -l "limitXsecCatShow_small.C(\"Hct\", 0, ${M2})" #&& display pics/LimitComp_Hct_1.eps #&
root -l "limitXsecCatShow_small_obs_STTT_08082017.C(\"Hct\", \"${sttt}\", 0, ${M2}, ${show})" #&& display pics/LimitComp_Hct_1.eps #&
#root -l "limitXsecCat.C(\"Hct\", 0, 50)" && display pics/LimitComp_Hct_1.eps &
#PS="$PS $!"

#wait $PS

cp pics/LimitComp_Hut_1.png $OUTPUT/LimitHutMax.png
cp pics/LimitComp_Hut_1.pdf $OUTPUT/LimitHutMax.pdf
cp pics/LimitComp_Hct_1.png $OUTPUT/LimitHctMax.png
cp pics/LimitComp_Hct_1.pdf $OUTPUT/LimitHctMax.pdf

cp limitNums_Hut_*.txt limitNums_Hct_*.txt $OUTPUT/

