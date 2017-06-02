#N=${1}
N=combSTandTT
#CASE=${2}
CASE=split
#OUTPUT=~/www/09-02-2017/5
#OUTPUT=~/www/11-02-2017/1
#OUTPUT=~/www/11-02-2017/2
#OUTPUT=~/www/12-02-2017/1
#OUTPUT=~/www/12-02-2017/2
#OUTPUT=~/www/12-02-2017/${N}
#OUTPUT=~/www/13-02-2017/${N}
#OUTPUT=~/www/14-02-2017/${N}
#OUTPUT=~/www/16-02-2017/${N}
#OUTPUT=~/www/17-02-2017/medium/${N}
#OUTPUT=~/www/18-02-2017/medium/${N}
#OUTPUT=~/www/20-02-2017/medium/${N}
#OUTPUT=~/www/22-02-2017/medium/${N}
#OUTPUT=~/www/23-02-2017/rebinned_cut/${N}
#OUTPUT=~/www/24-02-2017/TrainingsWithTightEID/${N}
OUTPUT=~/www/26-02-2017/TrainingsWithTightEID/${N}
OUTPUT=~/www/26-02-2017/TrainingsWithTightEID_1/${N}
OUTPUT=~/www/27-02-2017/TrainingsWithTightEID/${N}
OUTPUT=~/www/27-02-2017/TrainingsWithTightEID_${CASE}/${N}
OUTPUT=~/www/28-02-2017/TrainingsWithTightEID_${CASE}/${N}
OUTPUT=~/www/28-02-2017/TrainingsWithTightEID_exp_${CASE}/${N}
OUTPUT=~/www/15-05-2017/TrainingsWithTightEID_exp_${CASE}/${N}
OUTPUT=~/www/16-05-2017/TrainingsWithTightEID_exp_${CASE}/${N}
OUTPUT=~/www/24-03-2017/TrainingsWithTightEID_exp_${CASE}/${N}
OUTPUT=~/www/04-04-2017/1/TrainingsWithTightEID_exp_${CASE}/${N}
OUTPUT=~/www/05-04-2017/1/TrainingsWithTightEID_exp_${CASE}/${N}
OUTPUT=~/www/10-04-2017/1/TrainingsWithTightEID_exp_${CASE}/${N}
OUTPUT=~/www/14-04-2017/1/TrainingsWithTightEID_OBS_${CASE}/${N}
OUTPUT=~/www/20-04-2017/1/TrainingsWithTightEID_OBS_${CASE}/${N}
OUTPUT=~/www/21-04-2017/1/TrainingsWithTightEID_OBS_${CASE}/${N}
OUTPUT=${1}/1/TrainingsWithTightEID_OBS_${CASE}/${N}


#unlink input
#ln -s input_TrainingsWithTightEID/TrainingsWithTightEID/${N} input
#ln -s /afs/cern.ch/user/k/kderoove/public/TrainingsWithTightEID/${N} input
#ln -s /afs/cern.ch/work/c/cirkovic/rescaling/output input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_31_hdampUncAdded input
#ln -s /afs/cern.ch/user/k/kderoove/public/Trainings_2017_03_31_scaleEnvelopeNorm input

rm -rf ${OUTPUT}
mkdir -p ${OUTPUT}

#N=22
#N=23
#N=24
#N=25
S=0
S=1

#rm -rf cards
#mkdir cards
#rm -f produceCards.C
##cp -f produceCards_medium.C produceCards.C
##cp -f produce_cards/medium/produceCards_${N}.C produceCards.C
##cp -f produce_cards/TrainingsWithTightEID/produceCards_${N}.C produceCards.C
##cp -f produce_cards/TrainingsWithTightEID_sig/produceCards_${N}.C produceCards.C
##cp -f produce_cards/TrainingsWithTightEID_sig_merged/produceCards_${N}.C produceCards.C
##cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_limits_rescaled1_pulls/produceCards_${N}.C produceCards.C
##cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_combSTandTT_1/produceCards_${N}.C produceCards.C
##cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_combSTandTT_1_ttAdd/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc/produceCards_${N}.C produceCards.C
##cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected/produceCards_${N}.C produceCards.C
#./produceCards.zsh
#cd cards
##sh ../make_combos_${N}.sh
#sh ../make_combos_${N}_new.sh
#cd ..

#rm -rf cards
#cp -r CARDS_StatUnc cards

rm -rf cards
mkdir cards
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_limits_rescaled1/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc_1/produceCards_${N}.C produceCards.C
cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected_StatUnc_2/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_NEW_${CASE}_${N}_1_ttAdd_statBinUnc_corrected/produceCards_${N}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos_${N}_new.sh
cd ..


#exit

#cp -rf ${N}/* .

#./COMBINE_NEW.sh ${N} ${S}
#./COMBINE_NEW_medium.sh ${N} ${S}
#./COMBINE_NEW_${N}.sh ${N} ${S}
#./COMBINE_NEW_${N}.sh ${N} ${S}
#./COMBINE_Closure_${N}.sh ${N} ${S}
#./COMBINE_Closure.sh ${N} ${S}
#./COMBINE_Closure_minosAll_exp.sh ${N} ${S}
#./COMBINE_pulls_minosAll_exp.sh ${N} ${S}
#./COMBINE_pulls_minosAll_exp_new.sh ${N} ${S}
#./COMBINE_pulls_OBS.sh ${N} ${S}
#./COMBINE_pulls_OBS_unblinded.sh ${N} ${S}
#./COMBINE_pulls_OBS_unblinded_MIN.sh ${N} ${S}
./COMBINE_pulls_OBS_unblinded_NEW.sh ${N} ${S}

if [[ "${N}" == "maxSTandTT" ]]; then
    LABEL=MAX
elif [[ "${N}" == "ST" ]]; then
    LABEL=ST
elif [[ "${N}" == "TT" ]]; then
    LABEL=TT
elif [[ "${N}" == "combSTandTT" ]]; then
    LABEL=Comb
fi

#for i in 0 1; do
#for i in 05 01 005 001; do
#for i in 10 1 01 001 0; do
#for i in 1 01 001 0; do
#for i in 1 0; do
for i in 1; do
    rm -f ${OUTPUT}/Closure_OUTPUT_${i}.txt
    for h in u c; do
        for c in b2j3 b3j3 b2j4 b3j4 b4j4 comb; do
        #for c in b2j3; do
            echo "=====> " INPUT_MVAH${h}t${LABEL}_${c}_h${h}t/*_${i}.txt >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
            grep "=====> \|Best fit r: " INPUT_MVAH${h}t${LABEL}_${c}_h${h}t/*_${i}.txt >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
            grep "hname" -A 13 INPUT_MVAH${h}t${LABEL}_${c}_h${h}t/*_${i}.txt >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
            echo >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
            echo >> ${OUTPUT}/Closure_OUTPUT_${i}.txt
        done
    done
done

DATE=`date +%d%m%y_%H%M%S`
rm -rf backup_$DATE
mkdir backup_$DATE
cp -r produceCards.C cards INPUT_MVAH*t${LABEL}_*_h*t ./COMBINE_Closure.sh ${OUTPUT}/Closure_OUTPUT_${i}.txt backup_$DATE





















#INP=BACKUP_020317
INP=./
#OUT=~/www/02-03-2017/pulls
OUT=~/www/16-03-2017/pulls
OUT=~/www/24-03-2017/pulls
OUT=~/www/04-04-2017/pulls
OUT=~/www/05-04-2017/pulls
OUT=~/www/10-04-2017/pulls
OUT=~/www/14-04-2017/pulls_unblinded
OUT=~/www/20-04-2017/pulls_unblinded
OUT=~/www/21-04-2017/pulls_unblinded
OUT=${1}/pulls_unblinded

#L=0
#L=1
L=2
#L=3
#L=4

#rm -rf $OUT
#mkdir -p $OUT


declare -A outputs=(
    ["backup_$DATE"]=combSTandTT_split_obs
)

declare -A labels=(
    ["backup_$DATE"]=Comb
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
        #for c in b2j3; do
            if [[ "$L" == "1" ]]; then
                PS=""
            fi
            #for s in 1 05 01 005 001 0; do
            #for s in 05 01 005 001 0; do
            #for s in 1 0; do
            #for s in 10 1 0 01 001 0; do
            #for s in 1 0 01 001 0; do
            #for s in 1 0; do
            for s in 1; do
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









exit
python parse_combine_output_${N}.py COMBINE_OUTPUT_${N}.txt
cd limits
#./run.sh $OUTPUT 45 30
#./run.sh $OUTPUT 25 25
#./run.sh $OUTPUT 40 40
#./run.sh $OUTPUT 50 50
if [[ "${N}" == "maxSTandTT" ]]; then
./run.sh $OUTPUT 300 1200
elif [[ "${N}" == "ST" ]]; then
./run.sh $OUTPUT 200 1000
elif [[ "${N}" == "TT" ]]; then
./run.sh $OUTPUT 800 1500
elif [[ "${N}" == "combSTandTT" ]]; then
./run.sh $OUTPUT 300 1500
fi
#./run.sh $OUTPUT 60 60
#./run.sh $OUTPUT 120 120
#./run.sh $OUTPUT 50 50
#./run.sh $OUTPUT 15 15
#./run.sh $OUTPUT 10 10
cd plot
./run.sh $OUTPUT
cd ../..

rm -rf backup_${N}
mkdir backup_${N}
cp -r cards INPUT_* COMBINE_NEW_${N}.sh COMBINE_OUTPUT_${N}.txt produceCards.C backup_${N}

