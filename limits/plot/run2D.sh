OUTPUT=${1}

rm limit_2D.png limit_2D.pdf

ln -sf plot2D.cxx plot.cxx
make clean
make
./plot

cp limit_2D.png $OUTPUT/Limit2DCoupling.png
cp limit_2D.pdf $OUTPUT/Limit2DCoupling.pdf

