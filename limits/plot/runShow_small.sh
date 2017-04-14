OUTPUT=~/www/09-02-2017/2
OUTPUT=~/www/09-02-2017/3
OUTPUT=~/www/09-02-2017/4
OUTPUT=~/www/09-02-2017/5
OUTPUT=${1}

rm limit_Hut.png limit_Hct.png limit_Hut.pdf limit_Hct.pdf

ln -sf plotHutShow_small.cxx plot.cxx
make clean
make
./plot
#display limit_Hut.png &

ln -sf plotHctShow_small.cxx plot.cxx
make clean
make
./plot
#display limit_Hct.png &

cp limit_Hut.png $OUTPUT/LimitHutCoupling.png
cp limit_Hct.png $OUTPUT/LimitHctCoupling.png
cp limit_Hut.pdf $OUTPUT/LimitHutCoupling.pdf
cp limit_Hct.pdf $OUTPUT/LimitHctCoupling.pdf
cp ../limitNums_Hut.txt ../limitNums_Hct.txt $OUTPUT

