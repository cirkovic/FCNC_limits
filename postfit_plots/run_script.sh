#OUT=~/www/06-02-2017
#OUT=~/www/06-02-2017
#OUT=~/www/14-02-2017_0
#OUT=~/www/15-02-2017_0
OUT=~/www/16-02-2017_0
OUT=~/www/17-02-2017_0
OUT=~/www/19-02-2017_0
OUT=~/www/23-02-2017_0
OUT=~/www/04-03-2017_postfit
OUT=~/www/09-03-2017_postfit
OUT=~/www/31-03-2017_postfit
OUT=~/www/04-04-2017_postfit
OUT=~/www/05-04-2017_postfit
OUT=~/www/10-04-2017_postfit
OUT=~/www/20-04-2017_postfit
OUT=~/www/03-05-2017_postfit

#cp -f /afs/cern.ch/work/c/cirkovic/TrainingsFCNC_loose/cards/* aux
#cp -f /afs/cern.ch/work/c/cirkovic/TrainingsFCNC_medium/cards/* aux
#cp -f /afs/cern.ch/work/c/cirkovic/TrainingsFCNC_limits/cards/* aux

#./run_postfit.sh 0  0 0 $OUT 120
./run_postfit.sh 0  0 0 $OUT 125
./run_postfit.sh 1  -1 1 $OUT 125
./run_postfit.sh 2  -2 2 $OUT 125
./run_postfit.sh 3  -3 3 $OUT 125
./run_postfit.sh 4  -4 4 $OUT 125
./run_postfit.sh 5  -5 5 $OUT 125
exit
./run_postfit.sh 1  -0.001 0.001 $OUT 125
./run_postfit.sh 2  -0.005 0.005 $OUT 125
./run_postfit.sh 3  -0.01 0.01 $OUT 125
./run_postfit.sh 4  -0.05 0.05 $OUT 125
./run_postfit.sh 5  -0.1 0.1 $OUT 125
./run_postfit.sh 6  -0.5 0.5 $OUT 125
./run_postfit.sh 7  -1 1 $OUT 125
./run_postfit.sh 8  -5 5 $OUT 125
./run_postfit.sh 9  -10 10 $OUT 125
./run_postfit.sh 10 -50 50 $OUT 125
./run_postfit.sh 11 -100 100 $OUT 125
#./run_postfit.sh 0  -5 5 $OUT 120
#./run_postfit.sh 0  0 10 $OUT 120
#./run_postfit.sh 0  -0.5 0.5 $OUT 120
#exit
#./run_postfit.sh 1  -0.0005 0.0005 $OUT 120
#./run_postfit.sh 2  -0.005 0.005 $OUT 120
#./run_postfit.sh 3  -0.05 0.05 $OUT 120
#./run_postfit.sh 4  -0.5 0.5 $OUT 120
#./run_postfit.sh 5  -5 5 $OUT 120
#./run_postfit.sh 6  -50 50 $OUT 120
#./run_postfit.sh 7  -500 500 $OUT 120
#./run_postfit.sh 8  -5000 5000 $OUT 120

exit

./run_postfit.sh 1  -0.0005 0.0005 $OUT 125
./run_postfit.sh 2  -0.005 0.005 $OUT 125
./run_postfit.sh 3  -0.05 0.05 $OUT 125
./run_postfit.sh 4  -0.5 0.5 $OUT 125
./run_postfit.sh 5  -5 5 $OUT 125
./run_postfit.sh 6  -50 50 $OUT 125
./run_postfit.sh 7  -500 500 $OUT 125
./run_postfit.sh 8  -5000 5000 $OUT 125

exit

#./DrawPrefitPostfitSeparate1.sh ~/www/15-02-2017/3
./DrawPrefitPostfitSeparate1.sh ~/www/16-02-2017/x1
./DrawPrefitPostfitSeparate2.sh ~/www/16-02-2017/x2
./DrawPrefitPostfitSeparate3.sh ~/www/23-02-2017/x0

exit

./run_postfit.sh 0  0 0 $OUT 120
./run_postfit.sh 1  -1000 1000 $OUT 120
./run_postfit.sh 2  -500 500 $OUT 120
./run_postfit.sh 3  -200 200 $OUT 120
./run_postfit.sh 4  -100 100 $OUT 120
./run_postfit.sh 5  -50 50 $OUT 120
./run_postfit.sh 6  -20 20 $OUT 120
./run_postfit.sh 7  -10 10 $OUT 120
./run_postfit.sh 8  -5 5 $OUT 120
./run_postfit.sh 9  -2 2 $OUT 120
./run_postfit.sh 10 -1 1 $OUT 120
./run_postfit.sh 11  -0.5 0.5 $OUT 120
./run_postfit.sh 12  -0.2 0.2 $OUT 120
./run_postfit.sh 13  -0.1 0.1 $OUT 120
./run_postfit.sh 14  -0.05 0.05 $OUT 120
./run_postfit.sh 15  -0.02 0.02 $OUT 120
./run_postfit.sh 16  -0.01 0.01 $OUT 120
./run_postfit.sh 17  -0.005 0.005 $OUT 120
./run_postfit.sh 18  -0.002 0.002 $OUT 120
./run_postfit.sh 19  -0.001 0.001 $OUT 120
 
./run_postfit.sh 0  0 0 $OUT 125
./run_postfit.sh 1  -1000 1000 $OUT 125
./run_postfit.sh 2  -500 500 $OUT 125
./run_postfit.sh 3  -200 200 $OUT 125
./run_postfit.sh 4  -100 100 $OUT 125
./run_postfit.sh 5  -50 50 $OUT 125
./run_postfit.sh 6  -20 20 $OUT 125
./run_postfit.sh 7  -10 10 $OUT 125
./run_postfit.sh 8  -5 5 $OUT 125
./run_postfit.sh 9  -2 2 $OUT 125
./run_postfit.sh 10 -1 1 $OUT 125
./run_postfit.sh 11  -0.5 0.5 $OUT 125
./run_postfit.sh 12  -0.2 0.2 $OUT 125
./run_postfit.sh 13  -0.1 0.1 $OUT 125
./run_postfit.sh 14  -0.05 0.05 $OUT 125
./run_postfit.sh 15  -0.02 0.02 $OUT 125
./run_postfit.sh 16  -0.01 0.01 $OUT 125
./run_postfit.sh 17  -0.005 0.005 $OUT 125
./run_postfit.sh 18  -0.002 0.002 $OUT 125
./run_postfit.sh 19  -0.001 0.001 $OUT 125

./run_postfit.sh 0  0 0 $OUT 130
./run_postfit.sh 1  -1000 1000 $OUT 130
./run_postfit.sh 2  -500 500 $OUT 130
./run_postfit.sh 3  -200 200 $OUT 130
./run_postfit.sh 4  -100 100 $OUT 130
./run_postfit.sh 5  -50 50 $OUT 130
./run_postfit.sh 6  -20 20 $OUT 130
./run_postfit.sh 7  -10 10 $OUT 130
./run_postfit.sh 8  -5 5 $OUT 130
./run_postfit.sh 9  -2 2 $OUT 130
./run_postfit.sh 10 -1 1 $OUT 130
./run_postfit.sh 11  -0.5 0.5 $OUT 130
./run_postfit.sh 12  -0.2 0.2 $OUT 130
./run_postfit.sh 13  -0.1 0.1 $OUT 130
./run_postfit.sh 14  -0.05 0.05 $OUT 130
./run_postfit.sh 15  -0.02 0.02 $OUT 130
./run_postfit.sh 16  -0.01 0.01 $OUT 130
./run_postfit.sh 17  -0.005 0.005 $OUT 130
./run_postfit.sh 18  -0.002 0.002 $OUT 130
./run_postfit.sh 19  -0.001 0.001 $OUT 130


exit

#./run_postfit.sh 0 0 0 $OUT 120
#':
./run_postfit.sh 0 -1000 1000 $OUT 120
./run_postfit.sh 1 -500 500 $OUT 120
./run_postfit.sh 2 -200 200 $OUT 120
./run_postfit.sh 3 -100 100 $OUT 120
./run_postfit.sh 4 -50 50 $OUT 120
./run_postfit.sh 5 -20 20 $OUT 120
./run_postfit.sh 6 -10 10 $OUT 120
./run_postfit.sh 7 -5 5 $OUT 120
./run_postfit.sh 8 -2 2 $OUT 120
./run_postfit.sh 9 -1 1 $OUT 120
./run_postfit.sh 10 -0.5 0.5 $OUT 120
./run_postfit.sh 11 -0.2 0.2 $OUT 120
./run_postfit.sh 12 -0.1 0.1 $OUT 120
./run_postfit.sh 13 -0.05 0.05 $OUT 120
./run_postfit.sh 14 -0.02 0.02 $OUT 120
./run_postfit.sh 15 -0.01 0.01 $OUT 120
./run_postfit.sh 16 -0.005 0.005 $OUT 120
./run_postfit.sh 17 -0.002 0.002 $OUT 120
./run_postfit.sh 18 -0.001 0.001 $OUT 120
#'

#./run_postfit.sh 0 0 0 $OUT 125 
#':
./run_postfit.sh 0 -1000 1000 $OUT 125
./run_postfit.sh 1 -500 500 $OUT 125
./run_postfit.sh 2 -200 200 $OUT 125
./run_postfit.sh 3 -100 100 $OUT 125
./run_postfit.sh 4 -50 50 $OUT 125
./run_postfit.sh 5 -20 20 $OUT 125
./run_postfit.sh 6 -10 10 $OUT 125
./run_postfit.sh 7 -5 5 $OUT 125
./run_postfit.sh 8 -2 2 $OUT 125
./run_postfit.sh 9 -1 1 $OUT 125
./run_postfit.sh 10 -0.5 0.5 $OUT 125
./run_postfit.sh 11 -0.2 0.2 $OUT 125
./run_postfit.sh 12 -0.1 0.1 $OUT 125
./run_postfit.sh 13 -0.05 0.05 $OUT 125
./run_postfit.sh 14 -0.02 0.02 $OUT 125
./run_postfit.sh 15 -0.01 0.01 $OUT 125
./run_postfit.sh 16 -0.005 0.005 $OUT 125
./run_postfit.sh 17 -0.002 0.002 $OUT 125
./run_postfit.sh 18 -0.001 0.001 $OUT 125
#'

#./run_postfit.sh 0 0 0 $OUT 130
#':
./run_postfit.sh 0 -1000 1000 $OUT 130
./run_postfit.sh 1 -500 500 $OUT 130
./run_postfit.sh 2 -200 200 $OUT 130
./run_postfit.sh 3 -100 100 $OUT 130
./run_postfit.sh 4 -50 50 $OUT 130
./run_postfit.sh 5 -20 20 $OUT 130
./run_postfit.sh 6 -10 10 $OUT 130
./run_postfit.sh 7 -5 5 $OUT 130
./run_postfit.sh 8 -2 2 $OUT 130
./run_postfit.sh 9 -1 1 $OUT 130
./run_postfit.sh 10 -0.5 0.5 $OUT 130
./run_postfit.sh 11 -0.2 0.2 $OUT 130
./run_postfit.sh 12 -0.1 0.1 $OUT 130
./run_postfit.sh 13 -0.05 0.05 $OUT 130
./run_postfit.sh 14 -0.02 0.02 $OUT 130
./run_postfit.sh 15 -0.01 0.01 $OUT 130
./run_postfit.sh 16 -0.005 0.005 $OUT 130
./run_postfit.sh 17 -0.002 0.002 $OUT 130
./run_postfit.sh 18 -0.001 0.001 $OUT 130
#'

exit
./run_postfit.sh 1 -1 1
./run_postfit.sh 2 -5 5
./run_postfit.sh 3 -10 10
./run_postfit.sh 4 -20 20
./run_postfit.sh 5 -50 50
./run_postfit.sh 6 -100 100
./run_postfit.sh 7 0 1
./run_postfit.sh 8 0 5
./run_postfit.sh 9 0 10
./run_postfit.sh 10 0 20
./run_postfit.sh 11 0 50
./run_postfit.sh 12 0 100
./run_postfit.sh 13 -1 0
./run_postfit.sh 14 -5 0
./run_postfit.sh 15 -10 0
./run_postfit.sh 16 -20 0
./run_postfit.sh 17 -50 0
./run_postfit.sh 18 -100 0
./run_postfit.sh 19 -2 -1
./run_postfit.sh 20 -5 -1
./run_postfit.sh 21 -10 -5
./run_postfit.sh 22 -20 -10
./run_postfit.sh 23 -50 -20
./run_postfit.sh 24 -100 -50
./run_postfit.sh 25 1 2
./run_postfit.sh 26 1 5
./run_postfit.sh 27 5 10
./run_postfit.sh 28 10 20
./run_postfit.sh 29 20 50
./run_postfit.sh 30 50 100
