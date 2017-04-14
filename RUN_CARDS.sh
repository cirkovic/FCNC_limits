#OUTPUT=~/www/09-02-2017/5
#OUTPUT=~/www/11-02-2017/1
#OUTPUT=~/www/11-02-2017/2
#OUTPUT=~/www/12-02-2017/1
#OUTPUT=~/www/12-02-2017/2
#OUTPUT=~/www/12-02-2017/${1}
#OUTPUT=~/www/13-02-2017/${1}
#OUTPUT=~/www/14-02-2017/${1}

#rm -rf ${OUTPUT}
#mkdir ${OUTPUT}

#N=22
#N=23
#N=24
#N=25
#N=${1}
#S=0
#S=1

rm -rf cards
mkdir cards
cp -f produceCards_${1}.C produceCards.C
./produceCards.zsh
cd cards
sh ../make_combos.sh
cd ..

#exit
