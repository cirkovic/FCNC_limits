cd ${1}
eval `scramv1 runtime -sh`
cd ${2}
cat=${3}

cp ../aux/input_${cat}.txt .

COMMAND="text2workspace.py input_${cat}.txt --channel-masks"
echo $COMMAND
eval $COMMAND
echo
echo

#combine aux/input_MVAHut_b4j4_hut.root -M MaxLikelihoodFit --saveShapes --saveWithUncertainties --setPhysicsModelParameters mask_SR=1 --numToysForShapes 1000
#combine input_${cat}.root -M MaxLikelihoodFit -m 125 --saveShapes --saveWithUncertainties --setPhysicsModelParameters mask_signal=1 --numToysForShapes 1000
#combine input_${cat}.root -M MaxLikelihoodFit  --setPhysicsModelParameters pdf_index=1 --toysFile higgsCombineTest.GenerateOnly.mH125.123456.root  -t 100 --rMin -10 --rMax 10 --freezeNuisances pdf_index
#combine input_${cat}.root -M MaxLikelihoodFit --toysFile higgsCombineTest.GenerateOnly.mH125.123456.root  -t 100 --rMin -10 --rMax 10
#combine input_${cat}.root -M MaxLikelihoodFit -m 125 --numToysForShapes 1000 --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --preFitValue 1 --skipBOnlyFit #--numToysForShapes 1000 --rMin -10 --rMax 10
#COMMAND="combine input_${cat}.root -M MaxLikelihoodFit -m 125 --numToysForShapes 1000 --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --preFitValue 1 --skipBOnlyFit"
#COMMAND="combine input_${cat}.root -M MaxLikelihoodFit -m 125 --numToysForShapes 1000 --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1"
COMMAND="combine input_${cat}.root -M MaxLikelihoodFit -m 125 --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --skipBOnlyFit"
echo $COMMAND
eval $COMMAND
echo
echo

#PostFitShapes -d input_${cat}.root -o ${cat}_shapes.root -m 125 -f mlfit.root:fit_s --postfit --sampling --print
#PostFitShapes -d input_${cat}.txt -o ${cat}_shapes_prefit.root -m 125
#PostFitShapes -d input_${cat}.txt -o ${cat}_shapes_postfit.root -m 125 -f mlfit.root:fit_s --postfit --sampling --covariance --print
#PostFitShapes -d input_${cat}.root -o ${cat}_shapes_postfit.root -m 125 -f mlfit.root:fit_s --postfit --sampling --print
#PostFitShapesFromWorkspace -w input_${cat}.root -d input_${cat}.txt -o ${cat}_shapes_postfit.root -m 125 -f mlfit.root:fit_s --postfit --sampling --covariance --print
#COMMAND="PostFitShapes -d input_${cat}.txt -o ${cat}_shapes_postfit.root -m 125 -f mlfit.root:fit_s --postfit --sampling --covariance --print"
COMMAND="PostFitShapes -d input_${cat}.txt -o ${cat}_shapes_postfit.root -m 125 -f mlfit.root:fit_s --postfit --sampling --print"
echo $COMMAND
eval $COMMAND
echo
echo
