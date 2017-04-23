#OUTDIR=~/www/24-01-2017/1
#OUTDIR=~/www/26-01-2017/20
#OUTDIR=~/www/27-01-2017/20
OUTDIR=~/www/31-01-2017/${1}
OUTDIR=~/www/02-02-2017/${1}
RMIN=${2}
RMAX=${3}

echo $OUTDIR $RMIN $RMAX

#exit

#rm -rf $OUTDIR
#rm -f cards/*.root

PS=""
for i in `ls common`; do
#for i in input_MVAHct_ALL_hct.txt; do
#for i in input_MVAHut_ALL_hut.txt input_MVAHct_ALL_hct.txt; do
    if [[ "${i}" == *".txt" ]] || [[ "${i}" == "comb_"* ]] ; then
        continue
    fi
    nm=${i/.root/}
    name=${nm/input_/}

    rm -rf ${name}_${1}
    mkdir ${name}_${1}
    cd ${name}_${1}
    
    mkdir cards
    mkdir common
    cp ../common/${i} common
    cp ../cards/${i/.root/.txt} cards

#    text2workspace.py cards/${i} -m 125
#    combineTool.py -M Impacts -d cards/${i/.txt/.root} -m 125 --doInitialFit
#    combineTool.py -M Impacts -d cards/${i/.txt/.root} -m 125 --doFits --parallel 4
#    combineTool.py -M Impacts -d cards/${i/.txt/.root} -m 125 -o impacts_${name}.json
#    plotImpacts.py -i impacts_${name}.json -o impacts_${name}

#    combineTool.py -M Impacts -d ../cards/${i/.txt/.root} -m 125 --doInitialFit --robustFit 1
#    combineTool.py -M Impacts -d ../cards/${i/.txt/.root} -m 125 --robustFit 1 --doFits
#    combineTool.py -M Impacts -d ../cards/${i/.txt/.root} -m 125 -o impacts.json
#    plotImpacts.py -i impacts.json -o impacts

    #sh ../job_test.sh $CMSSW_BASE `pwd` ${i} ${RMIN} ${RMAX} 2>&1 | tee OUTPUT.txt &
    #ls
    #ls ..
    sh ../JOB.sh $CMSSW_BASE `pwd` ${i} ${RMIN} ${RMAX}
    #sh ../job.sh `pwd` ${i} 2>&1 | tee OUTPUT.txt &
#    sh ../plot_scan.sh `pwd` ${i} 2>&1 | tee OUTPUT.txt &
#    sh ../plot_scan.sh `pwd` ${i} 2>&1 | tee OUTPUT.txt &
    #PS="$PS $!"

    cd ..

    exit
done

#wait $PS
exit

rm -rf $OUTDIR
mkdir $OUTDIR
cp -rf MVA*/ $OUTDIR

