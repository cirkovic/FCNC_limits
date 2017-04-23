OUTPUT=~/www/17-04-2017/1

N=${1}
N=combSTandTT
CASE=split
#n=10
#n=30
#n=100
#n=20
n=${2}
n=50
#n=5

m=${3}
m=1.0

#rm -rf input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N}_2D/
#cp -r /afs/cern.ch/work/c/cirkovic/rescaling2D/output input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N}_2D/
#ln -s /afs/cern.ch/work/c/cirkovic/rescaling2D/output input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N}_2D

rm -rf $OUTPUT
mkdir -p $OUTPUT

python parse_combine_output.py COMBINE_OUTPUT_${N}_ALL_${n}.txt $n
cd limits
./plot2D_var.sh ${n} ${m} $OUTPUT
cd ..

