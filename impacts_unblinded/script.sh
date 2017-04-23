ITERATION=${1}
RMIN=${2}
RMAX=${3}
OUTDIR=${4}
M=${5}

echo ${ITERATION} $OUTDIR $RMIN $RMAX ${M}

PS=""
for i in `ls cards`; do
    
    if [[ "$i" == *".root" ]]; then
        continue
    fi
    
    nm=${i/.txt/}
    name=${nm/input_/}

    rm -rf ${name}_${ITERATION}_${M}
    mkdir ${name}_${ITERATION}_${M}
    cd ${name}_${ITERATION}_${M}
    
    #combineTool.py -M T2W -i ../cards/${i} -o ${i/.txt/.root} -m ${M}

    #sh `pwd`/../job.sh $CMSSW_BASE `pwd` ${i} ${RMIN} ${RMAX} ${M} $OUTDIR/${ITERATION}/${M}
    bsub -q 1nh `pwd`/../job.sh $CMSSW_BASE `pwd` ${i} ${RMIN} ${RMAX} ${M} $OUTDIR/${ITERATION}/${M}

    cd ..
    #exit
done

#wait $PS
