OUTPUT=~/www/01-08-2017/correlation_matrices/4
OUTPUT=~/www/03-08-2017/correlation_matrices/1

rm -f *.txt *.pdf *.png
rm -f ${OUTPUT}/*

PS=""
#for i in backup_150417_025132 backup_150417_025407; do
#for i in backup_150417_101612 backup_150417_101732; do
#for i in backup_230417_235441; do
#for i in backup_030517_182204; do
#for i in backup_150517_222915; do
#for i in ~/public/20-05-2017/backup_limits_blind_split_200517_061407; do
#for i in ~/public/20-05-2017/backup_limits_blind_split_200517_065744; do
#for i in ~/public/20-05-2017/backup_limits_blind_split_200517_070802; do
#for i in ~/public/20-05-2017/backup_limits_blind_split_200517_082013; do
#for i in backup_230517_203240; do
#for i in backup_140617_122912; do
for i in backup_020717_013624; do
#for i in backup_010817_220535; do
    for j in INPUT_MVAHctComb_b2j3_hct INPUT_MVAHctComb_b2j4_hct INPUT_MVAHctComb_b3j3_hct INPUT_MVAHctComb_b3j4_hct INPUT_MVAHctComb_b4j4_hct INPUT_MVAHctComb_comb_hct INPUT_MVAHutComb_b2j3_hut INPUT_MVAHutComb_b2j4_hut INPUT_MVAHutComb_b3j3_hut INPUT_MVAHutComb_b3j4_hut INPUT_MVAHutComb_b4j4_hut INPUT_MVAHutComb_comb_hut ; do
        #for k in 0 001 01 1 10; do
        #for k in 0 001 01 1; do
        #for k in 0 1; do
        for k in 1; do
            python mlfitCorrelationCheck.py ../${i}/${j}/mlfit_${k}.root 2>&1 | tee OUTPUT_${i}_${j}_${k}.txt &
            PS="$PS $!"
        done
    done
done
wait $PS

mv *.png *pdf *.txt $OUTPUT
