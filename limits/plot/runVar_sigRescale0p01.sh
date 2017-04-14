OUTPUT=${1}
DOWN=${2}
UP=${3}

rm limit_Hut.png limit_Hct.png limit_Hut.pdf limit_Hct.pdf

ln -sf plotHutVar_sigRescale0p01.cxx plot.cxx
make clean
make
./plot $DOWN $UP
#display limit_Hut.png &

ln -sf plotHctVar_sigRescale0p01.cxx plot.cxx
make clean
make
./plot $DOWN $UP
#display limit_Hct.png &

cp limit_Hut.png $OUTPUT/LimitHutCoupling.png
cp limit_Hct.png $OUTPUT/LimitHctCoupling.png
cp limit_Hut.pdf $OUTPUT/LimitHutCoupling.pdf
cp limit_Hct.pdf $OUTPUT/LimitHctCoupling.pdf

