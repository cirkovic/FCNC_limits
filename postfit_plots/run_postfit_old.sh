#OUTPUT=~/www/26-01-2017/0
#OUTPUT=~/www/29-01-2017/0
#OUTPUT=~/www/29-01-2017/1

#OUTPUT=~/www/01-02-2017/${I}
#OUT=~/www/01-02-2017
I=${1}
RMIN=${2}
RMAX=${3}
OUT=${4}
M=${5}


echo ${I} ${RMIN} ${RMAX} ${OUT}

#PS=""

#for category in MVAHut_b2j3_hut MVAHut_b2j4_hut MVAHut_b3j3_hut MVAHut_b3j4_hut MVAHut_b4j4_hut  MVAHct_b2j3_hct MVAHct_b2j4_hct MVAHct_b3j3_hct MVAHct_b3j4_hct MVAHct_b4j4_hct  MVAHut_ALL_hut MVAHct_ALL_hct; do
for hyp in u c; do

    for cat in b2j3 b3j3 b2j4 b3j4 b4j4 comb; do
    #for cat in b2j3 b3j3 b2j4 b3j4 b4j4; do
    #for cat in b2j3; do

        category=MVAH${hyp}tComb_${cat}_h${hyp}t

        #root -l -b -q ${category}_${I}_${M}/${category}_shapes_postfit.root
    
        rm -rf ${category}_${I}_${M}
        mkdir ${category}_${I}_${M}
        cd ${category}_${I}_${M}

        OUTPUT=${OUT}/${category}_${I}_${M}
        rm -rf $OUTPUT
        mkdir $OUTPUT

        echo $OUTPUT $RMIN $RMAX

    #    cp ../aux/input_${category}.txt .
    #    text2workspace.py input_${category}.txt --channel-masks
    #    #combine aux/input_MVAHut_b4j4_hut.root -M MaxLikelihoodFit --saveShapes --saveWithUncertainties --setPhysicsModelParameters mask_SR=1 --numToysForShapes 1000
    #    #combine input_${category}.root -M MaxLikelihoodFit -m 125 --saveShapes --saveWithUncertainties --setPhysicsModelParameters mask_signal=1 --numToysForShapes 1000
    #    #combine input_${category}.root -M MaxLikelihoodFit  --setPhysicsModelParameters pdf_index=1 --toysFile higgsCombineTest.GenerateOnly.mH125.123456.root  -t 100 --rMin -10 --rMax 10 --freezeNuisances pdf_index
    #    #combine input_${category}.root -M MaxLikelihoodFit --toysFile higgsCombineTest.GenerateOnly.mH125.123456.root  -t 100 --rMin -10 --rMax 10
    #    combine input_${category}.root -M MaxLikelihoodFit -m 125 --numToysForShapes 1000 --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --preFitValue 1 --skipBOnlyFit #--numToysForShapes 1000 --rMin -10 --rMax 10
    #
    #    #PostFitShapes -d input_${category}.root -o ${category}_shapes.root -m 125 -f mlfit.root:fit_s --postfit --sampling --print
    #    PostFitShapes -d input_${category}.txt -o ${category}_shapes_prefit.root -m 125
    #    PostFitShapes -d input_${category}.txt -o ${category}_shapes_postfit.root -m 125 -f mlfit.root:fit_s --postfit --sampling --print
    #    #PostFitShapes -d input_${category}.root -o ${category}_shapes_postfit.root -m 125 -f mlfit.root:fit_s --postfit --sampling --print
    #    #PostFitShapesFromWorkspace -w input_${category}.root -d input_${category}.txt -o ${category}_shapes_postfit.root -m 125 -f mlfit.root:fit_s --postfit --sampling --covariance --print

        #./../job.sh ${CMSSW_BASE} `pwd` ${hyp} ${cat} 2>&1 | tee OUTPUT.txt &
        #bsub -q 1nh `pwd`/../job.sh ${CMSSW_BASE} `pwd` ${hyp} ${cat} ${RMIN} ${RMAX} ${OUTPUT}
        #sh `pwd`/../job.sh ${CMSSW_BASE} `pwd` ${hyp} ${cat} ${I} ${RMIN} ${RMAX} ${OUTPUT}
        COMMAND="bsub -q 1nh `pwd`/../job.sh ${CMSSW_BASE} `pwd` ${hyp} ${cat} ${I} ${RMIN} ${RMAX} ${OUTPUT} ${M}"
        #COMMAND="sh `pwd`/../job.sh ${CMSSW_BASE} `pwd` ${hyp} ${cat} ${I} ${RMIN} ${RMAX} ${OUTPUT} ${M} 2>&1 | tee STDOUT"
        echo $COMMAND
        eval $COMMAND
        #PS="$PS $!"

        cd ..

        #exit

    done

done
