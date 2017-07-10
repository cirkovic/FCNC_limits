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
declare -A folders=(
    ["backup_020717_013624"]="Comb"
    ["backup_020717_013729"]="ST"
    ["backup_020717_013833"]="TT"
)

#for k in ${!folders[@]}; do
#for k in backup_220517_013127 backup_220517_200004 backup_220517_213727; do
#for k in backup_140617_122912 backup_140617_171118 backup_140617_173127; do
#for k in backup_140617_122912 backup_150617_134939 backup_150617_150326; do
for k in backup_020717_013624 backup_020717_013729 backup_020717_013833; do
    for j in hut hct; do
        #for i in b2j3 b2j4 b3j3 b3j4 b4j4; do
        for i in b2j3 b2j4 b3j3 b3j4 b4j4 comb; do
            if [[ "$i" == "b4j4" ]] && [[ "$j" == "hut" ]]; then continue; fi
            echo $i $j
            #grep "Best fit r:" ${k}/INPUT_MVA${j/h/H}Comb_${i}_${j}/COMBINE_OUTPUT.txt
            #grep "Best fit r:" ${k}/INPUT_MVA${j/h/H}Comb_${i}_${j}/COMBINE_OUTPUT_1.txt
            grep "Best fit r:" ${k}/INPUT_MVA${j/h/H}${folders[$k]}_${i}_${j}/COMBINE_OUTPUT_1.txt
            echo
        done
        echo
    done
    echo
    echo
done
