#OUTPUT=~/www/17-04-2017/1
#OUTPUT=~/www/17-04-2017/2
#OUTPUT=~/www/17-04-2017/3
#OUTPUT=~/www/20-04-2017/3
#OUTPUT=~/www/30-04-2017/3

N=${1}
#N=combSTandTT
#N=ST
#N=TT

#OUTPUT=~/www/30-04-2017/${N}
#OUTPUT=~/www/01-05-2017/${N}
#OUTPUT=~/www/02-05-2017/${N}
#OUTPUT=~/www/03-05-2017/${N}
#OUTPUT=~/www/04-05-2017/${N}
#OUTPUT=~/www/06-05-2017/${N}
#OUTPUT=~/www/07-05-2017/${N}

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

#rm -rf $OUTPUT
#mkdir -p $OUTPUT

#PS=""

for i in `seq 0 $n`; do
    PS=""
    for j in `seq 0 $n`; do
        if [ "$i" == "0" ] && [ "$j" == "0" ]; then continue; fi
#        ./RUN_TrainingsWithTightEID_NEW_BLIND_2D.sh ${N} ${CASE} ${i} ${j} &
#        PS="$PS $!"
    done
    wait $PS
done

#wait $PS

rm -f  COMBINE_OUTPUT_${N}_ALL_kevin_${n}_${m}.txt;

for I in `seq 0 $n`; do
    for J in `seq 0 $n`; do
        i=$I
        j=$J
#        if [ "$I" == "0" ] && [ "$J" == "0" ]; then continue; fi
#        if [ "$I" == "5" ] && [ "$J" == "6" ]; then
#            FOLDER=backup_limits_blind_${CASE}_5
#            echo CIRKOVIC 5 6 >> COMBINE_OUTPUT_${N}_ALL.txt
#            cat ${FOLDER}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_5.txt >> COMBINE_OUTPUT_${N}_ALL.txt
#        else
            #FOLDER=BACKUPS/backup_limits_blind_${CASE}_${i}_${j}
            #FOLDER=backup_limits_blind_${CASE}_${i}_${j}
#            FOLDER1=BACKUPS_28-03-2017/backup_limits_blind_${CASE}_${i}_${j}
#            FOLDER2=BACKUPS_28-03-2017_1/backup_limits_blind_${CASE}_${i}_${j}
#            FOLDER3=BACKUPS_28-03-2017_2/backup_limits_blind_${CASE}_${i}_${j}
            #FOLDER=backup_limits_blind_${CASE}_${i}_${j}
            #FOLDER=BACKUP_11-04-2017/backup_limits_blind_${CASE}_${i}_${j}
            #FOLDER=backup_limits_blind_${CASE}_${i}_${j}
            #FOLDER=2D_4_50_1.0/limits_${case}_${i}_${j}/${N}/COMBINE_OUTPUT_combSTandTT_split_7_9.txt
#            FOLDER1=2D_4_50_1.0/LIMITS0/limits_${CASE}_${i}_${j}/${N}
#            FOLDER2=2D_4_50_1.0/LIMITS1/limits_${CASE}_${i}_${j}/${N}
#            FOLDER3=2D_4_50_1.0/LIMITS2/limits_${CASE}_${i}_${j}/${N}
#            FOLDER1=2D_${n}_${m}/LIMITS0/limits_${CASE}_${i}_${j}/${N}
#            FOLDER2=2D_${n}_${m}/LIMITS1/limits_${CASE}_${i}_${j}/${N}
            #FOLDER1=2D_${n}_${m}/LIMITS/limits_${CASE}_${i}_${j}/${N}
            #FOLDER1=2D_kevin_${n}_${m}/LIMITS1/limits_${CASE}_${i}_${j}/${N}
#            FOLDER1=2D_${n}_${m}_1/LIMITS1/limits_${CASE}_${i}_${j}/${N}
#            FOLDER2=2D_${n}_${m}_1/LIMITS2/limits_${CASE}_${i}_${j}/${N}
            FOLDER1=2D_${n}_${m}_1/limits_${CASE}_${i}_${j}/${N}
            echo CIRKOVIC ${i} ${j} >> COMBINE_OUTPUT_${N}_ALL_kevin_${n}_${m}.txt
#            if [[ `ls ${FOLDER1}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt` != "" ]]; then
#                cat ${FOLDER1}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt >> COMBINE_OUTPUT_${N}_ALL.txt
#            elif [[ `ls ${FOLDER2}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt` != "" ]]; then
#                cat ${FOLDER2}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt >> COMBINE_OUTPUT_${N}_ALL.txt
#            elif [[ `ls ${FOLDER3}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt` != "" ]]; then
#                cat ${FOLDER3}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt >> COMBINE_OUTPUT_${N}_ALL.txt
#            fi

            if [[ `ls ${FOLDER1}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt` != "" ]]; then
                cat ${FOLDER1}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt >> COMBINE_OUTPUT_${N}_ALL_kevin_${n}_${m}.txt
#            elif [[ `ls ${FOLDER2}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt` != "" ]]; then
#                cat ${FOLDER2}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt >> COMBINE_OUTPUT_${N}_ALL_kevin_${n}_${m}.txt
#            elif [[ `ls ${FOLDER3}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt` != "" ]]; then
#                cat ${FOLDER3}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt >> COMBINE_OUTPUT_${N}_ALL_kevin_${n}_${m}.txt
            fi

            #cat ${FOLDER}/COMBINE_OUTPUT_INPUT_MVAHuctComb_comb_huct_${N}_${CASE}_${i}_${j}.txt >> COMBINE_OUTPUT_${N}_ALL_kevin_${n}_${m}.txt
#        fi
        echo >> COMBINE_OUTPUT_${N}_ALL_kevin_${n}_${m}.txt;
        echo >> COMBINE_OUTPUT_${N}_ALL_kevin_${n}_${m}.txt;
        echo >> COMBINE_OUTPUT_${N}_ALL_kevin_${n}_${m}.txt;
        :
    done
done

#exit

grep "CIRKOVIC \|Expected \|Observed " COMBINE_OUTPUT_${N}_ALL_kevin_${n}_${m}.txt > COMBINE_OUTPUT_${N}_xALL.txt
mv COMBINE_OUTPUT_${N}_xALL.txt COMBINE_OUTPUT_${N}_ALL_kevin_${n}_${m}.txt

