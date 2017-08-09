#for k in backup_limits_blind_split_090517_224337 backup_limits_blind_split_090517_224021 backup_limits_blind_split_090517_224207; do
#for k in backup_limits_blind_split_090517_232613 backup_limits_blind_split_090517_232201 backup_limits_blind_split_090517_232358; do
#for k in backup_limits_blind_split_090517_235906 backup_limits_blind_split_090517_235552 backup_limits_blind_split_090517_235732; do
#for k in backup_limits_blind_split_150517_213843 backup_limits_blind_split_150517_213123 backup_limits_blind_split_150517_213510; do
#for k in backup_limits_blind_split_150517_224349 backup_limits_blind_split_150517_223548 backup_limits_blind_split_150517_223957; do
#declare -A folders=(
#    ["backup_220517_013127"]="Comb"
#    ["backup_220517_200004"]="ST"
#    ["backup_220517_213727"]="TT"
#)

#declare -A folders=(
#    ["backup_140617_122912"]="Comb"
#    ["backup_140617_171118"]="ST"
#    ["backup_140617_173127"]="TT"
#)
#declare -A folders=(
#    ["backup_140617_122912"]="Comb"
#    ["backup_150617_134939"]="ST"
#    ["backup_150617_150326"]="TT"
#)
#declare -A folders=(
#    ["backup_070817_021250"]="Comb"
#)

#declare -A folders=(
#    ["backup_070817_021250"]="Comb"
#    ["backup_070817_023946"]="Comb"
#    ["backup_070817_025456"]="Comb"
#    ["backup_070817_033753"]="Comb"
#    ["backup_070817_042655"]="Comb"
#    ["backup_070817_084533"]="Comb"
#)

#declare -A folders=(
#    ["backup_070817_112122"]="Comb"
#)

#declare -A folders=(
#    ["backup_070817_114517"]="Comb"
#    ["backup_070817_114737"]="ST"
#    ["backup_070817_114946"]="TT"
#)


declare -A folders=(
    ["backup_070817_181106"]="Comb"
    ["backup_070817_181417"]="ST"
    ["backup_070817_181702"]="TT"
    ["backup_070817_195228"]="Comb"
    ["backup_070817_195545"]="ST"
    ["backup_070817_195807"]="TT"
)

declare -A titles=(
    ["backup_070817_181106"]="pn_Comb"
    ["backup_070817_181417"]="pn_ST"
    ["backup_070817_181702"]="pn_TT"
    ["backup_070817_195228"]="po_Comb"
    ["backup_070817_195545"]="po_ST"
    ["backup_070817_195807"]="po_TT"
)



declare -A folders=(
    ["backup_070817_204407"]="Comb"
    ["backup_070817_204648"]="ST"
    ["backup_070817_205000"]="TT"
    ["backup_070817_205240"]="Comb"
    ["backup_070817_205518"]="ST"
    ["backup_070817_205801"]="TT"
)

declare -A titles=(
    ["backup_070817_204407"]="pn_Comb"
    ["backup_070817_204648"]="pn_ST"
    ["backup_070817_205000"]="pn_TT"
    ["backup_070817_205240"]="po_Comb"
    ["backup_070817_205518"]="po_ST"
    ["backup_070817_205801"]="po_TT"
)


declare -A folders=(
    ["backup_080817_072933"]="Comb"
    ["backup_080817_073053"]="Comb"
    ["backup_080817_075411"]="Comb"
    ["backup_080817_075528"]="Comb"
)

declare -A titles=(
    ["backup_080817_072933"]="pn_Comb_10"
    ["backup_080817_073053"]="po_Comb_10"
    ["backup_080817_075411"]="pn_Comb_5"
    ["backup_080817_075528"]="po_Comb_5"
)

declare -A folders=(
    ["backup_080817_072933"]="Comb"
    ["backup_080817_073053"]="Comb"
    ["backup_080817_075411"]="Comb"
    ["backup_080817_075528"]="Comb"
    ["backup_080817_081947"]="Comb"
    ["backup_080817_082115"]="Comb"
    ["backup_080817_082340"]="Comb"
    ["backup_080817_082457"]="Comb"
)

declare -A titles=(
    ["backup_080817_072933"]="pn_Comb_10"
    ["backup_080817_073053"]="po_Comb_10"
    ["backup_080817_075411"]="pn_Comb_5"
    ["backup_080817_075528"]="po_Comb_5"
    ["backup_080817_081947"]="pn_Comb_3"
    ["backup_080817_082115"]="po_Comb_3"
    ["backup_080817_082340"]="pn_Comb_1"
    ["backup_080817_082457"]="po_Comb_1"
)


declare -A folders=(
    ["backup_080817_073053"]="Comb"
    ["backup_080817_082340"]="Comb"
    ["backup_080817_082457"]="Comb"
)

declare -A titles=(
    ["backup_080817_073053"]="po_Comb_10"
    ["backup_080817_082340"]="pn_Comb_1"
    ["backup_080817_082457"]="po_Comb_1"
)


#for k in ${!folders[@]}; do
#for k in backup_220517_013127 backup_220517_200004 backup_220517_213727; do
#for k in backup_140617_122912 backup_140617_171118 backup_140617_173127; do
#for k in backup_140617_122912 backup_150617_134939 backup_150617_150326; do
#for k in backup_020717_013624 backup_020717_013729 backup_020717_013833; do
#for k in backup_070817_021250; do
#for k in backup_070817_021250 backup_070817_023946 backup_070817_025456 backup_070817_033753 backup_070817_042655 backup_070817_084533; do
#for k in backup_070817_112122; do
#for k in backup_070817_114517 backup_070817_114737 backup_070817_114946; do
#for k in backup_070817_121157 backup_070817_121512 backup_070817_121752; do
OUTPUT=bestFits.py
rm -f $OUTPUT
touch $OUTPUT
echo "titles = []" >> $OUTPUT
echo "T = []" >> $OUTPUT
echo >> $OUTPUT
#for k in backup_070817_181106 backup_070817_181417 backup_070817_181702 backup_070817_195228 backup_070817_195545 backup_070817_195807; do
#for k in backup_070817_204407 backup_070817_204648 backup_070817_205000 backup_070817_205240 backup_070817_205518 backup_070817_205801; do
#for k in backup_080817_072933 backup_080817_073053 backup_080817_075411 backup_080817_075528; do
for k in ${!folders[@]}; do
    for j in hut hct; do
        #for i in b2j3 b2j4 b3j3 b3j4 b4j4; do
        #echo $k
        echo "titles.append('${titles[$k]}_${j}')"
        echo "T.append(["
        for i in b2j3 b2j4 b3j3 b3j4 b4j4 comb; do
            if [[ "$i" == "b4j4" ]] && [[ "$j" == "hut" ]]; then continue; fi
            #echo $i $j
            #grep "Best fit r:" ${k}/INPUT_MVA${j/h/H}Comb_${i}_${j}/COMBINE_OUTPUT.txt
            #grep "Best fit r:" ${k}/INPUT_MVA${j/h/H}Comb_${i}_${j}/COMBINE_OUTPUT_1.txt
            grep "Best fit r:" ${k}/INPUT_MVA${j/h/H}${folders[$k]}_${i}_${j}/COMBINE_OUTPUT_1.txt
            echo
        done
        echo "])"
        echo
    done
    echo
    echo
done >> $OUTPUT

sed -i "s/Best fit r: /[/g" $OUTPUT
sed -i "s/  (68% CL)/],/g" $OUTPUT
sed -i "s/  /, /g" $OUTPUT
sed -i "s/\//, /g" $OUTPUT

