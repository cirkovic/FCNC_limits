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
OUTPUT=~/www/27-02-2017/TrainingsWithTightEID_Limits_${CASE}/${1}


unlink input
ln -s input_TrainingsWithTightEID/TrainingsWithTightEID/${1} input

rm -rf ${OUTPUT}
mkdir -p ${OUTPUT}

#N=22
#N=23
#N=24
#N=25
#N=${1}
S=0
S=1

if [[ "${1}" == "maxSTandTT" ]]; then
    LABEL=MAX
elif [[ "${1}" == "ST" ]]; then
    LABEL=ST
elif [[ "${1}" == "TT" ]]; then
    LABEL=TT
elif [[ "${1}" == "combSTandTT" ]]; then
    LABEL=Comb
fi

rm -rf cards
mkdir cards
#cp -f produceCards_medium.C produceCards.C
#cp -f produce_cards/medium/produceCards_${1}.C produceCards.C
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
./COMBINE_NEW_${N}.sh ${N} ${S}
python parse_combine_output_${N}.py COMBINE_OUTPUT_${N}.txt
cd limits
#./run.sh $OUTPUT 45 30
#./run.sh $OUTPUT 25 25
#./run.sh $OUTPUT 40 40
#./run.sh $OUTPUT 50 50
if [[ "${N}" == "maxSTandTT" ]]; then
./run.sh $OUTPUT 100 50
elif [[ "${N}" == "ST" ]]; then
./run.sh $OUTPUT 100 50
elif [[ "${N}" == "TT" ]]; then
./run.sh $OUTPUT 100 50
elif [[ "${N}" == "combSTandTT" ]]; then
./run.sh $OUTPUT 100 50
fi
#./run.sh $OUTPUT 60 60
#./run.sh $OUTPUT 120 120
#./run.sh $OUTPUT 50 50
#./run.sh $OUTPUT 15 15
#./run.sh $OUTPUT 10 10
cd plot
./run.sh $OUTPUT
cd ../..

#rm -rf backup_${N}
#mkdir backup_${N}
#cp -r cards INPUT_* COMBINE_NEW_${N}.sh COMBINE_OUTPUT_${N}.txt produceCards.C backup_${N}

DATE=`date +%d%m%y_%H%M%S`
rm -rf backup_$DATE
mkdir backup_$DATE
cp -r produceCards.C cards INPUT_MVAH*t${LABEL}_*_h*t ./COMBINE_NEW_${N}.sh COMBINE_OUTPUT_${N}.txt backup_$DATE

