#OUT=~/www/08-02-2017
#OUT=~/www/08-02-2017_1
OUT=~/www/14-02-2017_1
OUT=~/www/15-02-2017_1
OUT=~/www/16-02-2017_1
OUT=~/www/02-03-2017_3
OUT=~/www/02-03-2017_3
OUT=~/www/05-03-2017_impacts
OUT=~/www/05-03-2017_pulls
#OUT=~/www/16-02-2017_2

#./script.sh 0  -0.5 0.5 $OUT 120

find $OUT -name "*.png" | xargs rm -f
find $OUT -name "*.pdf" | xargs rm -f

#rm common/*
#rm cards/*

#INPUT=/afs/cern.ch/work/c/cirkovic/TrainingsFCNC_limits/input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/combSTandTT/

#cp ${INPUT}/* common
#cp /afs/cern.ch/work/c/cirkovic/TrainingsFCNC_limits/cards/* common
#cp /afs/cern.ch/work/c/cirkovic/TrainingsFCNC_limits/cards/* cards


./script.sh 0  0 0 $OUT 125
./script.sh 1  0 5 $OUT 125
./script.sh 2  0 2.5 $OUT 125
./script.sh 3  0 0.5 $OUT 125
./script.sh 4  0 0.25 $OUT 125
./script.sh 5  0 0.05 $OUT 125
./script.sh 6  0 0.025 $OUT 125
./script.sh 7  0 0.005 $OUT 125
./script.sh 8  0 0.0025 $OUT 125
exit
./script.sh 0  0 0 $OUT 125
./script.sh 1  -5 5 $OUT 125
./script.sh 2  -2.5 2.5 $OUT 125
./script.sh 3  -0.5 0.5 $OUT 125
./script.sh 4  -0.25 0.25 $OUT 125
./script.sh 5  -0.05 0.05 $OUT 125
./script.sh 6  -0.025 0.025 $OUT 125
./script.sh 7  -0.005 0.005 $OUT 125
./script.sh 8  -0.0025 0.0025 $OUT 125
exit
#./script.sh 0  -5 5 $OUT 120
#./script.sh 0  0 10 $OUT 120
#./script.sh 0  -0.5 0.5 $OUT 120
./script.sh 1  -0.0005 0.0005 $OUT 120
./script.sh 2  -0.005 0.005 $OUT 120
./script.sh 3  -0.05 0.05 $OUT 120
./script.sh 4  -0.5 0.5 $OUT 120
./script.sh 5  -5 5 $OUT 120
./script.sh 6  -50 50 $OUT 120
./script.sh 7  -500 500 $OUT 120
./script.sh 8  -5000 5000 $OUT 120

exit

./script.sh 0  0 0 $OUT 120
./script.sh 1  -0.5 0.5 $OUT 120

exit

./script.sh 0  0 0 $OUT 120
./script.sh 1  -1000 1000 $OUT 120
./script.sh 2  -500 500 $OUT 120
./script.sh 3  -200 200 $OUT 120
./script.sh 4  -100 100 $OUT 120
./script.sh 5  -50 50 $OUT 120
./script.sh 6  -20 20 $OUT 120
./script.sh 7  -10 10 $OUT 120
./script.sh 8  -5 5 $OUT 120
./script.sh 9  -2 2 $OUT 120
./script.sh 10 -1 1 $OUT 120
./script.sh 11  -0.5 0.5 $OUT 120
./script.sh 12  -0.2 0.2 $OUT 120
./script.sh 13  -0.1 0.1 $OUT 120
./script.sh 14  -0.05 0.05 $OUT 120
./script.sh 15  -0.02 0.02 $OUT 120
./script.sh 16  -0.01 0.01 $OUT 120
./script.sh 17  -0.005 0.005 $OUT 120
./script.sh 18  -0.002 0.002 $OUT 120
./script.sh 19  -0.001 0.001 $OUT 120

./script.sh 0  0 0 $OUT 125
./script.sh 1  -1000 1000 $OUT 125
./script.sh 2  -500 500 $OUT 125
./script.sh 3  -200 200 $OUT 125
./script.sh 4  -100 100 $OUT 125
./script.sh 5  -50 50 $OUT 125
./script.sh 6  -20 20 $OUT 125
./script.sh 7  -10 10 $OUT 125
./script.sh 8  -5 5 $OUT 125
./script.sh 9  -2 2 $OUT 125
./script.sh 10 -1 1 $OUT 125
./script.sh 11  -0.5 0.5 $OUT 125
./script.sh 12  -0.2 0.2 $OUT 125
./script.sh 13  -0.1 0.1 $OUT 125
./script.sh 14  -0.05 0.05 $OUT 125
./script.sh 15  -0.02 0.02 $OUT 125
./script.sh 16  -0.01 0.01 $OUT 125
./script.sh 17  -0.005 0.005 $OUT 125
./script.sh 18  -0.002 0.002 $OUT 125
./script.sh 19  -0.001 0.001 $OUT 125

./script.sh 0  0 0 $OUT 130
./script.sh 1  -1000 1000 $OUT 130
./script.sh 2  -500 500 $OUT 130
./script.sh 3  -200 200 $OUT 130
./script.sh 4  -100 100 $OUT 130
./script.sh 5  -50 50 $OUT 130
./script.sh 6  -20 20 $OUT 130
./script.sh 7  -10 10 $OUT 130
./script.sh 8  -5 5 $OUT 130
./script.sh 9  -2 2 $OUT 130
./script.sh 10 -1 1 $OUT 130
./script.sh 11  -0.5 0.5 $OUT 130
./script.sh 12  -0.2 0.2 $OUT 130
./script.sh 13  -0.1 0.1 $OUT 130
./script.sh 14  -0.05 0.05 $OUT 130
./script.sh 15  -0.02 0.02 $OUT 130
./script.sh 16  -0.01 0.01 $OUT 130
./script.sh 17  -0.005 0.005 $OUT 130
./script.sh 18  -0.002 0.002 $OUT 130
./script.sh 19  -0.001 0.001 $OUT 130

exit

./script.sh 0 -1000 1000
exit
./script.sh 1 -1 1
./script.sh 2 -5 5
./script.sh 3 -10 10
./script.sh 4 -20 20
./script.sh 5 -50 50
./script.sh 6 -100 100
./script.sh 7 0 1
./script.sh 8 0 5
./script.sh 9 0 10
./script.sh 10 0 20
./script.sh 11 0 50
./script.sh 12 0 100
./script.sh 13 -1 0
./script.sh 14 -5 0
./script.sh 15 -10 0
./script.sh 16 -20 0
./script.sh 17 -50 0
./script.sh 18 -100 0
./script.sh 19 -2 -1
./script.sh 20 -5 -1
./script.sh 21 -10 -5
./script.sh 22 -20 -10
./script.sh 23 -50 -20
./script.sh 24 -100 -50
./script.sh 25 1 2
./script.sh 26 1 5
./script.sh 27 5 10
./script.sh 28 10 20
./script.sh 29 20 50
./script.sh 30 50 100
