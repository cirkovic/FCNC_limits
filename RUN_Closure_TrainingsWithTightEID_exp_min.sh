N=${1}
CASE=${2}
#OUTPUT=~/www/09-02-2017/5
#OUTPUT=~/www/11-02-2017/1
#OUTPUT=~/www/11-02-2017/2
#OUTPUT=~/www/12-02-2017/1
#OUTPUT=~/www/12-02-2017/2
#OUTPUT=~/www/12-02-2017/${1}
#OUTPUT=~/www/13-02-2017/${1}
#OUTPUT=~/www/14-02-2017/${1}
#OUTPUT=~/www/16-02-2017/${1}
#OUTPUT=~/www/17-02-2017/medium/${1}
#OUTPUT=~/www/18-02-2017/medium/${1}
#OUTPUT=~/www/20-02-2017/medium/${1}
#OUTPUT=~/www/22-02-2017/medium/${1}
#OUTPUT=~/www/23-02-2017/rebinned_cut/${1}
#OUTPUT=~/www/24-02-2017/TrainingsWithTightEID/${1}
OUTPUT=~/www/26-02-2017/TrainingsWithTightEID/${1}
OUTPUT=~/www/26-02-2017/TrainingsWithTightEID_1/${1}
OUTPUT=~/www/27-02-2017/TrainingsWithTightEID/${1}
OUTPUT=~/www/27-02-2017/TrainingsWithTightEID_${CASE}/${1}
OUTPUT=~/www/28-02-2017/TrainingsWithTightEID_${CASE}/${1}
OUTPUT=~/www/28-02-2017/TrainingsWithTightEID_exp_${CASE}/${1}
OUTPUT=~/www/01-03-2017/TrainingsWithTightEID_exp_min_${CASE}/${1}


unlink input
ln -s input_TrainingsWithTightEID/TrainingsWithTightEID/${1} input

rm -rf ${OUTPUT}
mkdir -p ${OUTPUT}

#N=22
#N=23
#N=24
#N=25
S=0
S=1

rm -rf cards
mkdir cards
#cp -f produceCards_medium.C produceCards.C
#cp -f produce_cards/medium/produceCards_${1}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_sig/produceCards_${N}.C produceCards.C
#cp -f produce_cards/TrainingsWithTightEID_sig_merged/produceCards_${N}.C produceCards.C
cp -f produce_cards/TrainingsWithTightEID_${CASE}/produceCards_${N}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos_${1}.sh
cd ..

#exit

#cp -rf ${1}/* .

#./COMBINE_NEW.sh ${N} ${S}
#./COMBINE_NEW_medium.sh ${N} ${S}
#./COMBINE_NEW_${N}.sh ${N} ${S}
#./COMBINE_NEW_${N}.sh ${N} ${S}
#./COMBINE_Closure_${N}.sh ${N} ${S}
#./COMBINE_Closure.sh ${N} ${S}
./COMBINE_Closure_minosAll_exp_min.sh ${N} ${S}

if [[ "${1}" == "maxSTandTT" ]]; then
    LABEL=MAX
elif [[ "${1}" == "ST" ]]; then
    LABEL=ST
elif [[ "${1}" == "TT" ]]; then
    LABEL=TT
elif [[ "${1}" == "combSTandTT" ]]; then
    LABEL=Comb
fi

#for i in 0 1; do
for i in 1 05 01 005; do
    rm -f ${OUTPUT}/Closure_OUTPUT_${i}.txt
    for h in u c; do
        for c in b2j3 b3j3 b2j4 b3j4 b4j4 comb; do
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

