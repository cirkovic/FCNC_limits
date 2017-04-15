OUTPUT=~/www/26-01-2017/3

PS=""

for cat in MVAHut_b2j3_hut MVAHut_b2j4_hut MVAHut_b3j3_hut MVAHut_b3j4_hut MVAHut_b4j4_hut  MVAHct_b2j3_hct MVAHct_b2j4_hct MVAHct_b3j3_hct MVAHct_b3j4_hct MVAHct_b4j4_hct  MVAHut_ALL_hut MVAHct_ALL_hct; do

    rm -rf ${cat}
    mkdir ${cat}
    cd ${cat}

#    cp ../aux/input_${cat}.txt .
#    text2workspace.py input_${cat}.txt --channel-masks
#    #combine aux/input_MVAHut_b4j4_hut.root -M MaxLikelihoodFit --saveShapes --saveWithUncertainties --setPhysicsModelParameters mask_SR=1 --numToysForShapes 1000
#    #combine input_${cat}.root -M MaxLikelihoodFit -m 125 --saveShapes --saveWithUncertainties --setPhysicsModelParameters mask_signal=1 --numToysForShapes 1000
#    #combine input_${cat}.root -M MaxLikelihoodFit  --setPhysicsModelParameters pdf_index=1 --toysFile higgsCombineTest.GenerateOnly.mH125.123456.root  -t 100 --rMin -10 --rMax 10 --freezeNuisances pdf_index
#    #combine input_${cat}.root -M MaxLikelihoodFit --toysFile higgsCombineTest.GenerateOnly.mH125.123456.root  -t 100 --rMin -10 --rMax 10
#    combine input_${cat}.root -M MaxLikelihoodFit -m 125 --numToysForShapes 1000 --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --preFitValue 1 --skipBOnlyFit #--numToysForShapes 1000 --rMin -10 --rMax 10
#
#    #PostFitShapes -d input_${cat}.root -o ${cat}_shapes.root -m 125 -f mlfit.root:fit_s --postfit --sampling --print
#    PostFitShapes -d input_${cat}.txt -o ${cat}_shapes_prefit.root -m 125
#    PostFitShapes -d input_${cat}.txt -o ${cat}_shapes_postfit.root -m 125 -f mlfit.root:fit_s --postfit --sampling --print
#    #PostFitShapes -d input_${cat}.root -o ${cat}_shapes_postfit.root -m 125 -f mlfit.root:fit_s --postfit --sampling --print
#    #PostFitShapesFromWorkspace -w input_${cat}.root -d input_${cat}.txt -o ${cat}_shapes_postfit.root -m 125 -f mlfit.root:fit_s --postfit --sampling --covariance --print

    ./../job_3.sh ${CMSSW_BASE} `pwd` ${cat} 2>&1 | tee OUTPUT.txt &
    PS="$PS $!"

    cd ..

    #exit

done


wait ${PS}


rm -rf $OUTPUT
mkdir -p $OUTPUT
cp -r MVA*/ $OUTPUT
find $OUTPUT -name "*.root" | xargs rm

