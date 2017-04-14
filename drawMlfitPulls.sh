INP=BACKUP_020317
OUT=~/www/02-03-2017/pulls

#L=0
#L=1
L=2
#L=3
#L=4

rm -rf $OUT
mkdir -p $OUT

declare -A outputs=(
    ["backup_020317_024220"]=ST_split_exp
    ["backup_020317_024712"]=ST_split_exp_min
    ["backup_020317_025103"]=ST_merged_exp
    ["backup_020317_025525"]=ST_merged_exp_min
    ["backup_020317_030001"]=TT_split_exp
    ["backup_020317_030515"]=TT_split_exp_min
    ["backup_020317_030910"]=TT_merged_exp
    ["backup_020317_031318"]=TT_merged_exp_min
    ["backup_020317_031820"]=combSTandTT_split_exp
    ["backup_020317_032336"]=combSTandTT_split_exp_min
    ["backup_020317_032718"]=combSTandTT_merged_exp
    ["backup_020317_033138"]=combSTandTT_merged_exp_min
    ["backup_020317_033614"]=maxSTandTT_split_exp
    ["backup_020317_034110"]=maxSTandTT_split_exp_min
    ["backup_020317_034514"]=maxSTandTT_merged_exp
    ["backup_020317_034929"]=maxSTandTT_merged_exp_min
)

declare -A labels=(
    ["backup_020317_024220"]=ST
    ["backup_020317_024712"]=ST
    ["backup_020317_025103"]=ST
    ["backup_020317_025525"]=ST
    ["backup_020317_030001"]=TT
    ["backup_020317_030515"]=TT
    ["backup_020317_030910"]=TT
    ["backup_020317_031318"]=TT
    ["backup_020317_031820"]=Comb
    ["backup_020317_032336"]=Comb
    ["backup_020317_032718"]=Comb
    ["backup_020317_033138"]=Comb
    ["backup_020317_033614"]=MAX
    ["backup_020317_034110"]=MAX
    ["backup_020317_034514"]=MAX
    ["backup_020317_034929"]=MAX
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
            for s in 1 05 01 005 001 0; do
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

