#OUT=~/www/08-02-2017
#OUT=~/www/08-02-2017_1
OUT=~/www/14-02-2017_1
OUT=~/www/15-02-2017_1
OUT=~/www/16-02-2017_1
OUT=~/www/02-03-2017_3
OUT=~/www/03-03-2017_1
OUT=~/www/05-03-2017_pulls
OUT=~/www/17-03-2017_pulls
#OUT=~/www/16-02-2017_2

#./script_impacts.sh 0  -0.5 0.5 $OUT 120

find $OUT -name "*.png" | xargs rm -f
find $OUT -name "*.pdf" | xargs rm -f

#rm common/*
#rm cards/*

#INPUT=/afs/cern.ch/work/c/cirkovic/TrainingsFCNC_limits/input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/combSTandTT/

#cp ${INPUT}/* common
#cp /afs/cern.ch/work/c/cirkovic/TrainingsFCNC_limits/cards/* common
#cp /afs/cern.ch/work/c/cirkovic/TrainingsFCNC_limits/cards/* cards


./script_impacts.sh 0  0 1 $OUT 125
./script_impacts.sh 1  0 0.5 $OUT 125
./script_impacts.sh 2  0 0.1 $OUT 125
./script_impacts.sh 3  0 0.05 $OUT 125
./script_impacts.sh 4  0 0.01 $OUT 125
./script_impacts.sh 5  0 0.005 $OUT 125
./script_impacts.sh 6  0 0.001 $OUT 125
exit
./script_impacts.sh 1  0 0.039840637 $OUT 125
./script_impacts.sh 2  0 0.019920319 $OUT 125
./script_impacts.sh 3  0 0.009960159 $OUT 125
./script_impacts.sh 4  0 0.398406375 $OUT 125
./script_impacts.sh 5  0 0.131578947 $OUT 125
./script_impacts.sh 6  0 0.078947368 $OUT 125
./script_impacts.sh 7  0 0.026315789 $OUT 125
./script_impacts.sh 8  0 0.013157895 $OUT 125
./script_impacts.sh 9  0 0.078947368 $OUT 125

exit

./script_impacts.sh 0 -1000 1000
exit
./script_impacts.sh 1 -1 1
./script_impacts.sh 2 -5 5
./script_impacts.sh 3 -10 10
./script_impacts.sh 4 -20 20
./script_impacts.sh 5 -50 50
./script_impacts.sh 6 -100 100
./script_impacts.sh 7 0 1
./script_impacts.sh 8 0 5
./script_impacts.sh 9 0 10
./script_impacts.sh 10 0 20
./script_impacts.sh 11 0 50
./script_impacts.sh 12 0 100
./script_impacts.sh 13 -1 0
./script_impacts.sh 14 -5 0
./script_impacts.sh 15 -10 0
./script_impacts.sh 16 -20 0
./script_impacts.sh 17 -50 0
./script_impacts.sh 18 -100 0
./script_impacts.sh 19 -2 -1
./script_impacts.sh 20 -5 -1
./script_impacts.sh 21 -10 -5
./script_impacts.sh 22 -20 -10
./script_impacts.sh 23 -50 -20
./script_impacts.sh 24 -100 -50
./script_impacts.sh 25 1 2
./script_impacts.sh 26 1 5
./script_impacts.sh 27 5 10
./script_impacts.sh 28 10 20
./script_impacts.sh 29 20 50
./script_impacts.sh 30 50 100
