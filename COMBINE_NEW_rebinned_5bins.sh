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
            ':
            if   [[ "$i" == "input_MVAHutMAX_b2j3_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1"
            elif [[ "$i" == "input_MVAHutMAX_b3j3_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1"
            elif [[ "$i" == "input_MVAHutMAX_b2j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.05 --rMax=0.05"
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1"
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.01 --rMax=0.01"
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-100 --rMax=100"
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0045 --rMax=0.0045"
            elif [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1"
            elif [[ "$i" == "input_MVAHutMAX_b4j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1"
            elif [[ "$i" == "input_MVAHutMAX_comb_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.05 --rMax=0.05"
            elif [[ "$i" == "input_MVAHctMAX_b2j3_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1"
            elif [[ "$i" == "input_MVAHctMAX_b3j3_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1"
            elif [[ "$i" == "input_MVAHctMAX_b2j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.05 --rMax=0.05"
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.5 --rMax=0.5"
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1"
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-100 --rMax=100"
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0045 --rMax=0.0045"
            elif [[ "$i" == "input_MVAHctMAX_b3j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1"
            elif [[ "$i" == "input_MVAHctMAX_b4j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.1 --rMax=0.1"
            elif [[ "$i" == "input_MVAHctMAX_comb_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.05 --rMax=0.05"
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=-0.055 --rMax=0.055"
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --rMin=0.0045 --rMax=0.0045"
            fi
            '
            if   [[ "$i" == "input_MVAHutMAX_b2j3_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind"
            elif [[ "$i" == "input_MVAHutMAX_b3j3_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind"
            elif [[ "$i" == "input_MVAHutMAX_b2j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind"
            elif [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind"
            elif [[ "$i" == "input_MVAHutMAX_b4j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind"
            elif [[ "$i" == "input_MVAHutMAX_comb_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.1 --rMax=0.1"
            elif [[ "$i" == "input_MVAHctMAX_b2j3_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind"
            elif [[ "$i" == "input_MVAHctMAX_b3j3_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind"
            elif [[ "$i" == "input_MVAHctMAX_b2j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind"
            elif [[ "$i" == "input_MVAHctMAX_b3j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind"
            elif [[ "$i" == "input_MVAHctMAX_b4j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind"
            elif [[ "$i" == "input_MVAHctMAX_comb_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.1 --rMax=0.1"
            fi

            if   [[ "$i" == "input_MVAHutMAX_b2j3_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHutMAX_b3j3_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHutMAX_b2j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHutMAX_b4j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHutMAX_comb_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHctMAX_b2j3_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHctMAX_b3j3_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHctMAX_b2j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHctMAX_b3j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHctMAX_b4j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHctMAX_comb_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run blind --rMin=-0.5 --rMax=0.5"
            fi

            ':
            if   [[ "$i" == "input_MVAHutMAX_b2j3_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHutMAX_b3j3_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHutMAX_b2j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHutMAX_b4j4_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHutMAX_comb_hut.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.1 --rMax=0.1"
            elif [[ "$i" == "input_MVAHctMAX_b2j3_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHctMAX_b3j3_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHctMAX_b2j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.05 --rMax=0.05"
            elif [[ "$i" == "input_MVAHctMAX_b3j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHctMAX_b4j4_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.5 --rMax=0.5"
            elif [[ "$i" == "input_MVAHctMAX_comb_hct.txt" ]]; then
                COMMAND="combine -S ${S} ../cards/${i} -M Asymptotic --run expected --rMin=-0.05 --rMax=0.05"
            fi
            '
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

rm COMBINE_OUTPUT_rebinned_5bins.txt

for i in `ls cards`; do
    FOLD=${i/input/INPUT}
    FOLDER=${FOLD/.txt/}
    echo $i >> COMBINE_OUTPUT_rebinned_5bins.txt
    cat ${FOLDER}/COMBINE_OUTPUT.txt >> COMBINE_OUTPUT_rebinned_5bins.txt
    echo >> COMBINE_OUTPUT_rebinned_5bins.txt;
    echo >> COMBINE_OUTPUT_rebinned_5bins.txt;
    echo >> COMBINE_OUTPUT_rebinned_5bins.txt;
done

grep "input_\|Expected \|Observed \|combine " COMBINE_OUTPUT_rebinned_5bins.txt > COMBINE_OUTPUT_rebinned_5bins_1.txt
mv COMBINE_OUTPUT_rebinned_5bins_1.txt COMBINE_OUTPUT_rebinned_5bins.txt

