for i in `ls cards`; do
    #combine cards/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    if [[ "$i" == "input_MVAHutMAX_comb_hut.txt" ]]; then continue; fi
    if [[ "$i" == "input_MVAHctMAX_comb_hct.txt" ]]; then continue; fi
    echo $i
    if [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
        #combine cards/${i} -M Asymptotic --run expected --rMin=-100 --rMax=100
        #combine cards/${i} -M Asymptotic --run expected --rMin=-1000 --rMax=1000
        #combine cards/${i} -M Asymptotic --run expected --rMin=-0.1 --rMax=0.1
        #combine cards/${i} -M Asymptotic --run expected --rMin=-1 --rMax=1
        #combine cards/${i} -M Asymptotic --run expected --rMin=-10 --rMax=10
        #combine cards/${i} -M Asymptotic --run expected --rMin=-5 --rMax=5
        combine cards/${i} -M Asymptotic --run expected --rMin=-2.5 --rMax=2.5
    else
        combine cards/${i} -M Asymptotic --run expected
    fi
done 2>&1 | tee COMBINE_OUTPUT_4.txt

echo; echo

grep "input_\|Expected " COMBINE_OUTPUT_4.txt 2>&1 | tee COMBINE_OUTPUT_5.txt 


exit

for i in `ls cards`; do
    echo $i
    #combine cards/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    if [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
        #combine cards/${i} -M Asymptotic --run expected --rMin=-100 --rMax=100
        #combine cards/${i} -M Asymptotic --run expected --rMin=-1000 --rMax=1000
        #combine cards/${i} -M Asymptotic --run expected --rMin=-0.1 --rMax=0.1
        #combine cards/${i} -M Asymptotic --run expected --rMin=-1 --rMax=1
        #combine cards/${i} -M Asymptotic --run expected --rMin=-10 --rMax=10
        #combine cards/${i} -M Asymptotic --run expected --rMin=-5 --rMax=5
        combine cards/${i} -M Asymptotic --run expected --rMin=-2.5 --rMax=2.5
    else
        combine cards/${i} -M Asymptotic --run expected --rMin=-2.5 --rMax=2.5
    fi
done


exit


for i in `ls cards`; do
    echo $i
    #combine cards/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    if [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
        #combine cards/${i} -M Asymptotic --run expected --rMin=-100 --rMax=100
        #combine cards/${i} -M Asymptotic --run expected --rMin=-1000 --rMax=1000
        #combine cards/${i} -M Asymptotic --run expected --rMin=-0.1 --rMax=0.1
        #combine cards/${i} -M Asymptotic --run expected --rMin=-1 --rMax=1
        #combine cards/${i} -M Asymptotic --run expected --rMin=-10 --rMax=10
        #combine cards/${i} -M Asymptotic --run expected --rMin=-5 --rMax=5
        combine cards/${i} -M Asymptotic --run expected --rMin=-2.5 --rMax=2.5
    else
        continue
        combine cards/${i} -M Asymptotic --run expected
    fi
done

exit

for i in `ls cards`; do
    echo $i
    #combine cards/${i} -M Asymptotic --run expected --rMin=-0.001 --rMax=0.001
    if [[ "$i" == "input_MVAHutMAX_b3j4_hut.txt" ]]; then
        #combine cards/${i} -M Asymptotic --run expected --rMin=-100 --rMax=100
        #combine cards/${i} -M Asymptotic --run expected --rMin=-1000 --rMax=1000
        #combine cards/${i} -M Asymptotic --run expected --rMin=-0.1 --rMax=0.1
        #combine cards/${i} -M Asymptotic --run expected --rMin=-1 --rMax=1
        #combine cards/${i} -M Asymptotic --run expected --rMin=-10 --rMax=10
        #combine cards/${i} -M Asymptotic --run expected --rMin=-5 --rMax=5
        combine cards/${i} -M FeldmanCousins #--run expected #--rMin=-2.5 --rMax=2.5
    else
        combine cards/${i} -M FeldmanCousins #--run expected #--rMin=-2.5 --rMax=2.5
    fi
done


exit

