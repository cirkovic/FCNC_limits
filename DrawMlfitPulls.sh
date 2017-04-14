#INP=BACKUP_020317
INP=./
#OUT=~/www/02-03-2017/pulls
OUT=~/www/16-03-2017/pulls
OUT=~/www/24-03-2017/pulls
OUT=~/www/04-04-2017/pulls
OUT=~/www/05-04-2017/pulls
OUT=~/www/10-04-2017/pulls

#L=0
#L=1
L=2
#L=3
#L=4

rm -rf $OUT
mkdir -p $OUT


#declare -A outputs=(
#    ["backup_160317_162929"]=combSTandTT_split_exp
#    ["backup_160317_163551"]=combSTandTT_split_exp_min
#)

#declare -A labels=(
#    ["backup_160317_162929"]=Comb
#    ["backup_160317_163551"]=Comb
#)


#declare -A outputs=(
#    ["backup_240317_075623"]=combSTandTT_split_exp
#    ["backup_240317_075738"]=combSTandTT_split_exp_min
#)

#declare -A labels=(
#    ["backup_240317_075623"]=Comb
#    ["backup_240317_075738"]=Comb
#)

#declare -A outputs=(
#    ["backup_240317_090000"]=combSTandTT_split_exp
#    ["backup_240317_090115"]=combSTandTT_split_exp_min
#)

#declare -A labels=(
#    ["backup_240317_090000"]=Comb
#    ["backup_240317_090115"]=Comb
#)

#declare -A outputs=(
#    ["backup_240317_092332"]=combSTandTT_split_exp
#    ["backup_240317_093416"]=combSTandTT_split_exp_min
#)

#declare -A labels=(
#    ["backup_240317_092332"]=Comb
#    ["backup_240317_093416"]=Comb
#)

#declare -A outputs=(
#    ["backup_040417_193254"]=combSTandTT_split_exp
#    ["backup_040417_193520"]=combSTandTT_split_exp_min
#)

#declare -A labels=(
#    ["backup_040417_193254"]=Comb
#    ["backup_040417_193520"]=Comb
#)

#declare -A outputs=(
#    ["${1}"]=combSTandTT_split_exp
#    ["${2}"]=combSTandTT_split_exp_min
#)

#declare -A labels=(
#    ["${1}"]=Comb
#    ["${2}"]=Comb
#)

#declare -A outputs=(
#    ["backup_040417_204729"]=combSTandTT_split_exp
#    ["backup_040417_205133"]=combSTandTT_split_exp_min
#)

#declare -A labels=(
#    ["backup_040417_204729"]=Comb
#    ["backup_040417_205133"]=Comb
#)

#declare -A outputs=(
#    ["backup_050417_175007"]=combSTandTT_split_exp
#    ["backup_050417_175833"]=combSTandTT_split_exp_min
#)

#declare -A labels=(
#    ["backup_050417_175007"]=Comb
#    ["backup_050417_175833"]=Comb
#)

declare -A outputs=(
    ["backup_100417_164621"]=combSTandTT_split_exp
    ["backup_100417_165208"]=combSTandTT_split_exp_min
)

declare -A labels=(
    ["backup_100417_164621"]=Comb
    ["backup_100417_165208"]=Comb
)

if [[ "$L" == "4" ]]; then
    PS=""
fi
for i in "${!outputs[@]}"; do
    if [[ "$L" == "3" ]]; then
        PS=""
    fi
    for h in u c; do
        if [[ "$L" == "2" ]]; then
            PS=""
        fi
        for c in b2j3 b3j3 b2j4 b3j4 b4j4 comb; do
            if [[ "$L" == "1" ]]; then
                PS=""
            fi
            #for s in 1 05 01 005 001 0; do
            #for s in 05 01 005 001 0; do
            #for s in 1 0; do
            for s in 10 1 0 01 001 0; do
                OUTPUT=$OUT/${outputs[$i]}/h${h}t/${c}/${s}
                mkdir -p $OUTPUT
                COMMAND="python drawNusancesPlots_1.py $INP/$i/INPUT_MVAH${h}t${labels[$i]}_${c}_h${h}t/plots_${s}.root $OUTPUT"
                echo $COMMAND
                if [[ "$L" == "0" ]]; then
                    eval $COMMAND
                else
                    eval $COMMAND &
                    PS="$PS $!"
                fi
            done
            if [[ "$L" == "1" ]]; then
                wait $PS
            fi
        done
        if [[ "$L" == "2" ]]; then
            wait $PS
        fi
    done
    if [[ "$L" == "3" ]]; then
        wait $PS
    fi
done
if [[ "$L" == "4" ]]; then
    wait $PS
fi

