#OUTPUT=~/www/09-02-2017/5
#OUTPUT=~/www/11-02-2017/1
#OUTPUT=~/www/11-02-2017/2
#OUTPUT=~/www/12-02-2017/1
#OUTPUT=~/www/12-02-2017/2
#OUTPUT=~/www/12-02-2017/${1}
#OUTPUT=~/www/13-02-2017/${1}
OUTPUT=~/www/14-02-2017/${1}
OUTPUT=~/www/16-02-2017/${1}
OUTPUT=~/www/17-02-2017/loose/${1}
OUTPUT=~/www/18-02-2017/loose/${1}

unlink input
ln -s input_loose input

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
#cp -f produceCards_loose.C produceCards.C
cp -f produce_cards/loose/produceCards_${1}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos.sh
cd ..

#cp -rf ${1}/* .

#./COMBINE_NEW.sh ${N} ${S}
./COMBINE_NEW_loose.sh ${N} ${S}
python parse_combine_output.py COMBINE_OUTPUT_loose.txt
cd limits
#./run.sh $OUTPUT 45 30
./run.sh $OUTPUT 25 25
#./run.sh $OUTPUT 15 15
#./run.sh $OUTPUT 10 10
cd plot
./run.sh $OUTPUT
cd ../..
