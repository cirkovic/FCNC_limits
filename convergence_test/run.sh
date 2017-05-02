#for i in backup_150417_023514 backup_150417_023801; do
#for i in backup_150417_101339 backup_150417_101501; do
#for i in backup_230417_233350; do
#for i in /afs/cern.ch/user/c/cirkovic/public/28-04-2017/backup_280417_140257 /afs/cern.ch/user/c/cirkovic/public/28-04-2017/backup_280417_140416 /afs/cern.ch/user/c/cirkovic/public/28-04-2017/backup_280417_153825 /afs/cern.ch/user/c/cirkovic/public/28-04-2017/backup_280417_163724; do
for i in backup_280417_140257 backup_280417_140416 backup_280417_153825 backup_280417_163724; do
    for j in INPUT_MVAHctComb_b2j3_hct INPUT_MVAHctComb_b2j4_hct INPUT_MVAHctComb_b3j3_hct INPUT_MVAHctComb_b3j4_hct INPUT_MVAHctComb_b4j4_hct INPUT_MVAHctComb_comb_hct INPUT_MVAHutComb_b2j3_hut INPUT_MVAHutComb_b2j4_hut INPUT_MVAHutComb_b3j3_hut INPUT_MVAHutComb_b3j4_hut INPUT_MVAHutComb_b4j4_hut INPUT_MVAHutComb_comb_hut ; do
        PS=""
        #for k in 0 001 01 1 10; do
        #for k in 0 001 01 1; do
        for k in 0 1; do
            python mlfitConvergenceCheck.py ${i}/${j}/mlfit_${k}.root 2>&1 | tee OUTPUT_${i}_${j}_${k}.txt &
            PS="$PS $!"
        done
        wait $PS
    done
done

