#OUTPUT=~/www/17-04-2017/1
#OUTPUT=~/www/17-04-2017/2
#OUTPUT=~/www/17-04-2017/3
#OUTPUT=~/www/20-04-2017/3
#OUTPUT=~/www/30-04-2017/3

N=${1}
#N=combSTandTT
#N=ST
#N=TT

pm=kevin

OUTPUT=~/www/30-04-2017/${N}
OUTPUT=~/www/01-05-2017/${N}
OUTPUT=~/www/02-05-2017/${N}
OUTPUT=~/www/03-05-2017/${N}
OUTPUT=~/www/04-05-2017/${N}
OUTPUT=~/www/06-05-2017/${N}
OUTPUT=~/www/06-05-2017_${pm}/${N}
OUTPUT=~/www/07-05-2017_${pm}/${N}
OUTPUT=~/www/08-05-2017_${pm}/${N}
OUTPUT=~/www/09-05-2017_${pm}/${N}
OUTPUT=~/www/11-05-2017_${pm}/${N}
OUTPUT=~/www/12-05-2017_${pm}/${N}
OUTPUT=~/www/12-05-2017_${pm}2/${N}
OUTPUT=~/www/13-05-2017_${pm}/${N}
OUTPUT=~/www/14-05-2017_${pm}/${N}
OUTPUT=~/www/21-05-2017_${pm}/${N}
OUTPUT=~/www/22-05-2017_${pm}/${N}
OUTPUT=~/www/23-05-2017_${pm}/${N}
OUTPUT=~/www/23-05-2017_${pm}_1/${N}
OUTPUT=~/www/23-05-2017_${pm}_1/${N}
OUTPUT=~/www/24-05-2017_${pm}/${N}
OUTPUT=~/www/24-05-2017_${pm}/${N}
OUTPUT=~/www/24-05-2017_${pm}_1/${N}
OUTPUT=~/www/25-05-2017_${pm}/${N}
OUTPUT=~/www/26-05-2017_${pm}/${N}
OUTPUT=~/www/27-05-2017_${pm}/${N}

CASE=split
#n=10
#n=30
#n=100
#n=20
n=${2}
n=50
n=3
n=9
#n=5

m=${3}
m=1.0
m=0.5
m=3.5
#m=28.5
m=0.27
#m=0.01
#m=0.2

#rm -rf input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N}_2D/
#cp -r /afs/cern.ch/work/c/cirkovic/rescaling2D/output input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N}_2D/
#ln -s /afs/cern.ch/work/c/cirkovic/rescaling2D/output input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N}_2D

rm -rf $OUTPUT
mkdir -p $OUTPUT

#exit

grep "CIRKOVIC \|Expected \|Observed " COMBINE_OUTPUT_${N}_ALL_${pm}_${n}_${m}.txt > COMBINE_OUTPUT_${N}_xALL.txt
mv COMBINE_OUTPUT_${N}_xALL.txt COMBINE_OUTPUT_${N}_ALL_${pm}_${n}_${m}.txt

#exit

#python parse_combine_output.py COMBINE_OUTPUT_${N}_ALL_${pm}_${n}_${m}.txt $n
#cd limits
#./plot2D_var.sh ${n} ${m} $OUTPUT
#cd ..

python parse_combine_output.py COMBINE_OUTPUT_${N}_ALL_${pm}_${n}_${m}.txt $n
cd limits
#./plot2D_var_hut.sh ${N} ${n} ${m} $OUTPUT
#./plot2D_var_kevin_1.sh ${N} ${n} ${m} $OUTPUT
./plot2D_var_kevin_3.sh ${N} ${n} ${m} $OUTPUT
cd ..

