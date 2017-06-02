#combineCards.py b2j3=input_MVAHuctComb_b2j3_huct.txt \
#                b2j4=input_MVAHuctComb_b2j4_huct.txt \
#                b3j3=input_MVAHuctComb_b3j3_huct.txt \
#                b3j4=input_MVAHuctComb_b3j4_huct.txt \
#                b4j4=input_MVAHuctComb_b4j4_huct.txt > input_MVAHuctComb_comb_huct.txt

INPUTS=""

#if [[ `ls input_MVAHuctComb_b2j3_huct.txt` != "" ]]; then
#    INPUTS="$INPUTS b2j3=input_MVAHuctComb_b2j3_huct.txt"
#fi
#if [[ `ls input_MVAHuctComb_b2j4_huct.txt` != "" ]]; then
#    INPUTS="$INPUTS b2j4=input_MVAHuctComb_b2j4_huct.txt"
#fi
#if [[ `ls input_MVAHuctComb_b3j3_huct.txt` != "" ]]; then
#    INPUTS="$INPUTS b3j3=input_MVAHuctComb_b3j3_huct.txt"
#fi
#if [[ `ls input_MVAHuctComb_b3j4_huct.txt` != "" ]]; then
#    INPUTS="$INPUTS b3j4=input_MVAHuctComb_b3j4_huct.txt"
#fi
#if [[ `ls input_MVAHuctComb_b4j4_huct.txt` != "" ]]; then
#    INPUTS="$INPUTS b4j4=input_MVAHuctComb_b4j4_huct.txt"
#fi


#for i in b2j3 b2j4 b3j3 b3j4 b4j4; do # WRONG
#for i in b2j3; do # OK
#for i in b2j4; do # OK
#for i in b3j3; do #OK
#for i in b3j4; do
for i in b4j4; do #WRONG
    if [[ `ls input_MVA2DComb_khut0p15__khct0p09_${i}.txt` != "" ]]; then
        INPUTS="$INPUTS input_MVA2DComb_khut0p15__khct0p09_${i}.txt"
    fi
#    if [[ `ls input_MVA2DComb_khut0p09__khct0p15_${i}.txt` != "" ]]; then
#        INPUTS="$INPUTS input_MVA2DComb_khut0p09__khct0p15_${i}.txt"
#    fi
done


combineCards.py $INPUTS > input_MVA2DComb_khut0p15__khct0p09_comb.txt
#combineCards.py $INPUTS > input_MVA2DComb_khut0p09__khct0p15_comb.txt
