N=${1}
S=${2}
#N1=$(( N + 1 ))

#echo "RM: ${RM}" >> COMBINE_OUTPUT_${N1}.txt

PS=""

for j in `ls cards`; do
    i=$j
    #if [[ "$i" != "input_MVAHctMAX_b4j4_hct.txt" ]]; then continue; fi
    #if [[ "$i" != "input_MVAHutMAX_b4j4_hut.txt" ]]; then continue; fi
#    if [[ "$i" != "input_MVAHctMAX_comb_hct.txt" ]]; then continue; fi
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}
    rm -rf ${FOLDER}
    mkdir ${FOLDER}
    cd ${FOLDER}
    #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    #if [[ "$i" != "input_MVAHutMAX_comb_hut.txt" ]] && [[ "$i" != "input_MVAHctMAX_comb_hct.txt" ]]; then continue; fi
    #echo $i 2>&1 | tee COMBINE_OUTPUT.txt
    #combine -S ${S} ..rds/${i} -M Asymptotic  --rMin=-0.001 --rMax=0.001
    #combine -S ${S} ..rds/${i} -M Asymptotic #-S 0
#    if [[ "$i" != "input_MVAHctMAX_comb_hct.txt" ]] && [[ "$i" != "input_MVAHutMAX_comb_hut.txt" ]]; then continue; fi
#    if [[ "$i" == "input_MVAHutMAX_b2j4_hut.txt" ]]; then
#        combine -S ${S} ..RDS/${i} -M Asymptotic --rMin=-5 --rMax=5
#    else
#    if [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
#        combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-2.5 --rMax=2.5
#        combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-1.0 --rMax=1.0
#        combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-100 --rMax=100
        #combine -S ${S} ..rds/${i} -M Asymptotic --robustFit=1 #--rMin=-${RM} --rMax=${RM}
        #combine -S ${S} ..rds/${i} -M Asymptotic --rMin=0.0 --rMax=${RM} --strictBounds --minimizerStrategy=1
        #combine -S ${S} ..rds/${i} -M Asymptotic --rMin=0.0001 --rMax=0.1 --strictBounds --minimizerStrategy=2
        #combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1 --strictBounds --minimizerStrategy=2
        #combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-0.01 --rMax=0.01 #--strictBounds --minimizerStrategy=2
        #COMMAND="combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-0.05 --rMax=0.05 --minimizerStrategy=1"
    #if [[ "${S}" == "1" ]]; then
    if [[ "1" == "0" ]]; then
    #if [[ "1" == "1" ]]; then
        COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic"
        COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.05 --rMax=0.05"
        if [[ "$i" == "input_MVAHctMAX_b3j4_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-10 --rMax=10"
        elif [[ "$i" == "input_MVAHutMAX_b2j4_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.001 --rMax=0.001"
        elif [[ "$i" == "input_MVAHutMAX_b4j4_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.005 --rMax=0.005"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.003 --rMax=0.003"
            #COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.0005 --rMax=0.0005"
        elif [[ "$i" == "input_MVAHctMAX_b4j4_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.0005 --rMax=0.0005"
        elif [[ "$i" == "input_MVAHctMAX_comb_hct.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0 --rMax=5"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.01 --rMax=0.01"
            #COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1"
            #COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.05 --rMax=0.05"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.000001 --rMax=4.5" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-4.6 --rMax=4.6" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-4.7 --rMax=4.7" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.0005 --rMax=0.0005" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-5 --rMax=5 --run expected" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.01 --rMax=0.01 --minimizerStrategy 1" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-5.1 --rMax=5.1" # --stepSize=0.001 --minimizerStrategy 1"
            #ODAVDE
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-4.5 --rMax=4.5" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-4.6 --rMax=4.6" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.001 --rMax=5 --strictBounds" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.001 --rMax=20 --strictBounds" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=60 --strictBounds" # --stepSize=0.001 --minimizerStrategy 1"
            #COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=6 --strictBounds" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=1 --strictBounds" # --stepSize=0.001 --minimizerStrategy 1"
        elif [[ "$i" == "input_MVAHutMAX_comb_hut.txt" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=1 --strictBounds" # --stepSize=0.001 --minimizerStrategy 1"
        else
            #if [[ "$i" == "input_MVAHctMAX_b4j4_hct.txt" ]]; then
            #    COMMAND="combine -S ${S} ../cards/${i/b4j4/b3j3} -M Asymptotic --rMin=-0.05 --rMax=0.05"
            #else
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.05 --rMax=0.05"
            #fi
        fi
    else
        if [[ "this" == "not this" ]]; then
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=1 --strictBounds" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M AsymptoticNew --nPoints 100 --qtilde=1" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic" # --stepSize=0.001 --minimizerStrategy 1"
            COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=1 --strictBounds" # --stepSize=0.001 --minimizerStrategy 1"
            #COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic" # --stepSize=0.001 --minimizerStrategy 1"
        else
            if   [[ "$i" == "input_MVAHutMAX_b2j3_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=6 --strictBounds"
            elif [[ "$i" == "input_MVAHutMAX_b3j3_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=10 --strictBounds"
            elif [[ "$i" == "input_MVAHutMAX_b2j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=10 --strictBounds"
            elif [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=6 --strictBounds"
            elif [[ "$i" == "input_MVAHutMAX_b4j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=6 --strictBounds"
            elif [[ "$i" == "input_MVAHutMAX_comb_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=6 --strictBounds"
            elif [[ "$i" == "input_MVAHctMAX_b2j3_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=1 --strictBounds"
            elif [[ "$i" == "input_MVAHctMAX_b3j3_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=6 --strictBounds"
            elif [[ "$i" == "input_MVAHctMAX_b2j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=1 --strictBounds"
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=20 --strictBounds"
            elif [[ "$i" == "input_MVAHctMAX_b3j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=1 --strictBounds"
            elif [[ "$i" == "input_MVAHctMAX_b4j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=6 --strictBounds"
            elif [[ "$i" == "input_MVAHctMAX_comb_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0001 --rMax=1 --strictBounds"
            fi
        fi
    fi
    echo $COMMAND 2>&1 | tee COMBINE_OUTPUT.txt
    eval $COMMAND 2>&1 | tee -a COMBINE_OUTPUT.txt &
    PS="$PS $!"
#    else
#        combine -S ${S} ..rds/${i} -M Asymptotic #-S 0
#    fi
#    fi
    #exit
    cd ..
done

wait $PS

rm COMBINE_OUTPUT_${N}.txt

for i in `ls cards`; do
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}
    echo $i >> COMBINE_OUTPUT_${N}.txt
    cat ${FOLDER}/COMBINE_OUTPUT.txt >> COMBINE_OUTPUT_${N}.txt
    echo >> COMBINE_OUTPUT_${N}.txt;
    echo >> COMBINE_OUTPUT_${N}.txt;
    echo >> COMBINE_OUTPUT_${N}.txt;
done

grep "input_\|Expected \|Observed \|combine " COMBINE_OUTPUT_${N}.txt > COMBINE_OUTPUT_${N}_1.txt
mv COMBINE_OUTPUT_${N}_1.txt COMBINE_OUTPUT_${N}.txt

exit



#RM=${1}
N=${1}
N1=$(( N + 1 ))

echo "RM: ${RM}" >> COMBINE_OUTPUT_${N1}.txt

for i in `ls cards`; do
    #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    #if [[ "$i" != "input_MVAHutMAX_comb_hut.txt" ]] && [[ "$i" != "input_MVAHctMAX_comb_hct.txt" ]]; then continue; fi
    echo $i
    #combine -S ${S} ..rds/${i} -M Asymptotic  --rMin=-0.001 --rMax=0.001
    #combine -S ${S} ..rds/${i} -M Asymptotic #-S 0
#    if [[ "$i" != "input_MVAHctMAX_comb_hct.txt" ]] && [[ "$i" != "input_MVAHutMAX_comb_hut.txt" ]]; then continue; fi
#    if [[ "$i" == "input_MVAHutMAX_b2j4_hut.txt" ]]; then
#        combine -S ${S} ..RDS/${i} -M Asymptotic --rMin=-5 --rMax=5
#    else
#    if [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
#        combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-2.5 --rMax=2.5
#        combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-1.0 --rMax=1.0
#        combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-100 --rMax=100
        #combine -S ${S} ..rds/${i} -M Asymptotic --robustFit=1 #--rMin=-${RM} --rMax=${RM}
        #combine -S ${S} ..rds/${i} -M Asymptotic --rMin=0.0 --rMax=${RM} --strictBounds --minimizerStrategy=1
        #combine -S ${S} ..rds/${i} -M Asymptotic --rMin=0.0001 --rMax=0.1 --strictBounds --minimizerStrategy=2
        #combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1 --strictBounds --minimizerStrategy=2
        #combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-0.01 --rMax=0.01 #--strictBounds --minimizerStrategy=2
        COMMAND="combine -S ${S} ..rds/${i} -M Asymptotic --rMin=-0.05 --rMax=0.05 --minimizerStrategy=1"
        COMMAND="combine -S ${S} ..rds/${i} -M Asymptotic"
        echo $COMMAND
        eval $COMMAND
#    else
#        combine -S ${S} ..rds/${i} -M Asymptotic #-S 0
#    fi
#    fi
    #exit
done 2>&1 | tee COMBINE_OUTPUT_${N}.txt

echo; echo

grep "input_\|Expected \|Observed " COMBINE_OUTPUT_${N}.txt 2>&1 | tee -a COMBINE_OUTPUT_${N1}.txt

echo >> COMBINE_OUTPUT_${N1}.txt
echo >> COMBINE_OUTPUT_${N1}.txt
echo >> COMBINE_OUTPUT_${N1}.txt


exit



for i in `ls cards`; do
    #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    #if [[ "$i" != "input_MVAHutMAX_comb_hut.txt" ]] && [[ "$i" != "input_MVAHctMAX_comb_hct.txt" ]]; then continue; fi
    echo $i
    #combine -S ${S} ..rds/${i} -M Asymptotic  --rMin=-0.001 --rMax=0.001
    #combine -S ${S} ..rds/${i} -M Asymptotic #-S 0
    if [[ "$i" == "input_MVAHutMAX_b2j4_hut.txt" ]]; then
        combine -S ${S} ..RDS/${i} -M Asymptotic --rMin=-5 --rMax=5
    else
        combine -S ${S} ..RDS/${i} -M Asymptotic #-S 0
    fi
    #exit
done 2>&1 | tee COMBINE_OUTPUT_8.txt

echo; echo

grep "input_\|Expected \|Observed " COMBINE_OUTPUT_8.txt 2>&1 | tee COMBINE_OUTPUT_9.txt


exit




for i in `ls cards`; do
    #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    if [[ "$i" != "input_MVAHutMAX_comb_hut.txt" ]] && [[ "$i" != "input_MVAHctMAX_comb_hct.txt" ]]; then continue; fi
    echo $i
    combine -S ${S} ..rds/${i} -M Asymptotic
done 2>&1 | tee COMBINE_OUTPUT_6.txt

echo; echo

grep "input_\|Expected \|Observed " COMBINE_OUTPUT_6.txt 2>&1 | tee COMBINE_OUTPUT_7.txt


exit


for i in `ls cards`; do
    #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    if [[ "$i" == "input_MVAHutMAX_comb_hut.txt" ]]; then continue; fi
    if [[ "$i" == "input_MVAHctMAX_comb_hct.txt" ]]; then continue; fi
    echo $i
    if [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-100 --rMax=100
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-1000 --rMax=1000
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.1 --rMax=0.1
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-1 --rMax=1
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-10 --rMax=10
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-5 --rMax=5
        combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-2.5 --rMax=2.5
    else
        combine -S ${S} ..rds/${i} -M Asymptotic --run expected
    fi
done 2>&1 | tee COMBINE_OUTPUT_4.txt

echo; echo

grep "input_\|Expected " COMBINE_OUTPUT_4.txt 2>&1 | tee COMBINE_OUTPUT_5.txt 


exit

for i in `ls cards`; do
    echo $i
    #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    if [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-100 --rMax=100
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-1000 --rMax=1000
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.1 --rMax=0.1
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-1 --rMax=1
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-10 --rMax=10
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-5 --rMax=5
        combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-2.5 --rMax=2.5
    else
        combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-2.5 --rMax=2.5
    fi
done


exit


for i in `ls cards`; do
    echo $i
    #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    if [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-100 --rMax=100
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-1000 --rMax=1000
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.1 --rMax=0.1
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-1 --rMax=1
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-10 --rMax=10
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-5 --rMax=5
        combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-2.5 --rMax=2.5
    else
        continue
        combine -S ${S} ..rds/${i} -M Asymptotic --run expected
    fi
done

exit

for i in `ls cards`; do
    echo $i
    #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    if [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-100 --rMax=100
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-1000 --rMax=1000
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-0.1 --rMax=0.1
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-1 --rMax=1
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-10 --rMax=10
        #combine -S ${S} ..rds/${i} -M Asymptotic --run expected --rMin=-5 --rMax=5
        combine -S ${S} ..rds/${i} -M FeldmanCousins #--run expected #--rMin=-2.5 --rMax=2.5
    else
        combine -S ${S} ..rds/${i} -M FeldmanCousins #--run expected #--rMin=-2.5 --rMax=2.5
    fi
done


exit

