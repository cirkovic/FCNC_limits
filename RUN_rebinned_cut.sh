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
OUTPUT=~/www/23-02-2017/rebinned_cut/${1}


unlink input
ln -s input_medium_rebinned_cut/${1} input

rm -rf ${OUTPUT}
mkdir -p ${OUTPUT}

#N=22
#N=23
#N=24
#N=25
N=${1}
S=0
S=1

rm -rf cards
mkdir cards
#cp -f produceCards_medium.C produceCards.C
#cp -f produce_cards/medium/produceCards_${1}.C produceCards.C
cp -f produce_cards/rebinned/produceCards_${N}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos.sh
cd ..

#cp -rf ${1}/* .

#./COMBINE_NEW.sh ${N} ${S}
#./COMBINE_NEW_medium.sh ${N} ${S}
./COMBINE_NEW_rebinned_${N}.sh ${N} ${S}
python parse_combine_output.py COMBINE_OUTPUT_rebinned_${N}.txt
cd limits
#./run.sh $OUTPUT 45 30
#./run.sh $OUTPUT 25 25
#./run.sh $OUTPUT 40 40
#./run.sh $OUTPUT 50 50
#if [[ "${N}" == "0" ]]; then
#./run.sh $OUTPUT 60 60
#elif [[ "${N}" == "1" ]]; then
#./run.sh $OUTPUT 25 25
#elif [[ "${N}" == "2" ]]; then
#./run.sh $OUTPUT 60 60
#fi
./run.sh $OUTPUT 60 60
#./run.sh $OUTPUT 50 50
#./run.sh $OUTPUT 15 15
#./run.sh $OUTPUT 10 10
cd plot
./run.sh $OUTPUT
cd ../..

rm -rf backup_${N}
mkdir backup_${N}
cp -r cards INPUT_* COMBINE_NEW_rebinned_${N}.sh COMBINE_OUTPUT_rebinned_${N}.txt produceCards.C backup_${N}

