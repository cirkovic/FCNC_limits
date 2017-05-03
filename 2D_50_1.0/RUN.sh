#OUTPUT=~/www/11-03-2017/1
#OUTPUT=~/www/11-03-2017/2
#OUTPUT=~/www/11-03-2017/3
#OUTPUT=~/www/12-03-2017/1
#OUTPUT=~/www/12-03-2017/2
#OUTPUT=~/www/21-03-2017/1

#N=combSTandTT
#N=ST
#N=TT
CASE=split
#n=10
#n=100
n=50
#n=20
#n=50
#n=100

#rm -rf input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N}_2D/
#cp -r /afs/cern.ch/work/c/cirkovic/rescaling2D/output input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N}_2D/
#ln -s /afs/cern.ch/work/c/cirkovic/rescaling2D/output input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/${N}_2D

#rm -rf $OUTPUT
#mkdir -p $OUTPUT

#BSUB_QUIET=1

for i in `seq 0 $n`; do
#for i in `seq 9 $n`; do
    PS=""
    for j in `seq 0 $n`; do
#    for j in `seq 99 $n`; do
        #if [ "$i" == "0" ] && [ "$j" == "0" ]; then continue; fi
#        if [ "$i" == "40" ] && [ "$j" == "6" ]; then 
#        if [ "$i" == "25" ] && [ "$j" == "25" ]; then 
#        if [ "$i" == "${1}" ] && [ "$j" == "${1}" ]; then 
        #bsub -q 8nh RUN_TrainingsWithTightEID_NEW_BLIND_2D.sh ${N} ${CASE} ${i} ${j}
        #bsub -q 8nh RUN_TrainingsWithTightEID_NEW_BLIND_2D_1.sh ${N} ${CASE} ${i} ${j}
        #if [ "$i" == "45" ] && [ "$j" == "33" ]; then
        #if [ "$i" == "10" ] && [ "$j" == "11" ]; then
        #if [ "$i" == "11" ] && [ "$j" == "10" ]; then
#        if [ "$i" == "9" ] && [ "$j" == "12" ]; then
        #bsub -q 8nh RUN_TrainingsWithTightEID_NEW_BLIND_2D_2.sh ${N} ${CASE} ${i} ${j}
        #bsub -q 8nh -o /tmp/cirkovic/job_out RUN_TrainingsWithTightEID_NEW_BLIND_2D_2.sh ${N} ${CASE} ${i} ${j}
        #bsub -q 8nh -o /tmp/cirkovic/job_out RUN_TrainingsWithTightEID_NEW_BLIND_2D_3.sh ${N} ${CASE} ${i} ${j}
        #if [ `grep LIMITS0/limits_${CASE}_${j}_${i}/combSTandTT/COMBINE_OUTPUT_combSTandTT_split_${j}_${i}.txt` == "" ] || [ `grep LIMITS0/limits_${CASE}_${j}_${i}/ST/COMBINE_OUTPUT_ST_split_${j}_${i}.txt` == "" ] || [ `grep LIMITS0/limits_${CASE}_${j}_${i}/TT/COMBINE_OUTPUT_TT_split_${j}_${i}.txt` == "" ]; then
        rm -rf limits_${CASE}_${j}_${i}
        mkdir limits_${CASE}_${j}_${i}
        cd limits_${CASE}_${j}_${i}
        #bsub -q 8nh -o /tmp/cirkovic/limits_${CASE}_${j}_${i} `pwd`/../RUN_BOTH.sh ${CASE} ${i} ${j}
        bsub -q 8nh `pwd`/../RUN_BOTH.sh ${CASE} ${i} ${j}
        #./../RUN_BOTH.sh ${CASE} ${i} ${j}
        cd ..
        #fi
        #sh RUN_TrainingsWithTightEID_NEW_BLIND_2D_2.sh ${N} ${CASE} ${i} ${j}
        #sh RUN_TrainingsWithTightEID_NEW_BLIND_2D_3.sh ${N} ${CASE} ${i} ${j}
        #if [ "$i" == "20" ] && [ "$j" == "20" ]; then
        #sh RUN_TrainingsWithTightEID_NEW_BLIND_2D_1.sh ${N} ${CASE} ${i} ${j}
        #sh RUN_TrainingsWithTightEID_NEW_BLIND_2D.sh ${N} ${CASE} ${i} ${j}
        #exit
#        fi
    done
done
































exit
exit
exit
exit
exit

#wait $PS

rm -f  COMBINE_OUTPUT_${N}_ALL.txt;

for i in `seq 0 $n`; do
    for j in `seq 0 $n`; do
        #if [ "$i" == "0" ] && [ "$j" == "0" ]; then continue; fi
        FOLDER=backup_limits_blind_${CASE}_${i}_${j}
        echo CIRKOVIC ${i} ${j} >> COMBINE_OUTPUT_${N}_ALL.txt
        cat ${FOLDER}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt >> COMBINE_OUTPUT_${N}_ALL.txt
        echo >> COMBINE_OUTPUT_${N}_ALL.txt;
        echo >> COMBINE_OUTPUT_${N}_ALL.txt;
        echo >> COMBINE_OUTPUT_${N}_ALL.txt;
    done
done

#exit

grep "CIRKOVIC \|Expected \|Observed " COMBINE_OUTPUT_${N}_ALL.txt > COMBINE_OUTPUT_${N}_xALL.txt
mv COMBINE_OUTPUT_${N}_xALL.txt COMBINE_OUTPUT_${N}_ALL.txt

#exit

python parse_combine_output_${N}_2D.py COMBINE_OUTPUT_${N}_ALL.txt
cd limits
if [[ "${N}" == "combSTandTT" ]]; then
./Run2D.sh $OUTPUT 2
fi
cd ..

