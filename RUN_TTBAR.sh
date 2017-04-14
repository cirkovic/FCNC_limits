#OUTPUT=~/www/09-02-2017/5
#OUTPUT=~/www/11-02-2017/1
#OUTPUT=~/www/11-02-2017/2
#OUTPUT=~/www/12-02-2017/1
#OUTPUT=~/www/12-02-2017/2
#OUTPUT=~/www/12-02-2017/${I}
#OUTPUT=~/www/13-02-2017/${I}
#OUTPUT=~/www/14-02-2017/${I}
I=29
OUTPUT=~/www/16-02-2017/${I}

rm -rf ${OUTPUT}
mkdir ${OUTPUT}

#N=22
#N=23
#N=24
#N=25
N=${I}
S=0
S=1

rm -rf cards
mkdir cards
cp -f produceCards_${I}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos.sh
cd ..

#cp -rf ${I}/* .

#./COMBINE_NEW.sh ${N} ${S}
./COMBINE_NEW_${I}.sh ${N} ${S}
python parse_combine_output.py COMBINE_OUTPUT_${N}.txt
cd limits
#./run.sh $OUTPUT 45 30
#./run.sh $OUTPUT 100 100
./run.sh $OUTPUT 30 10
#./run.sh $OUTPUT 10 10
cd plot
./run.sh $OUTPUT
cd ../..
