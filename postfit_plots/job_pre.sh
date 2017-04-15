cd ${1}
eval `scramv1 runtime -sh`
cd ${2}
#echo $CMSSW_BASE `pwd`
hyp=${3}
cat=${4}
ITERATION=${5}
RMIN=${6}
RMAX=${7}
OUTPUT=${8}
M=${9}
category=MVAH${hyp}tMAX_${cat}_h${hyp}t

#cp ../aux/input_${category}.txt .
#cp ../aux/input_MVAH${hyp}t_*_h${hyp}t.txt .
cp ../aux/input_${category}.txt .

#COMMAND="text2workspace.py input_${category}.txt --channel-masks"
#COMMAND="combineTool.py -M T2W -i input_${category}.txt -o input_${category}.root -m ${M}"
OPTIONS=""
#OPTS="--PO 'map=.*/sig:0' --PO 'map=.*/ttbb:0' --PO 'map=.*/ttcc:0' --PO 'map=.*/ttlf:0' --PO 'map=.*/stop:0' --PO 'map=.*/wjets:0' --PO 'map=.*/zjets:0' --PO 'map=.*/ttbbttcc:0' --PO 'map=.*/ttbbttlf:0' --PO 'map=.*/ttccttlf:0'"
#OPTS="--PO 'map=.*/sig:0' --PO 'map=.*/ttbb:0' --PO 'map=.*/ttcc:0' --PO 'map=.*/ttlf:0' --PO 'map=.*/stop:0' --PO 'map=.*/wjets:0' --PO 'map=.*/zjets:0' --PO 'map=.*/ttbbttcc:0' --PO 'map=.*/ttbbttlf:0' --PO 'map=.*/ttccttlf:0'"
#OPTS="--PO 'map=.*/sig:0' --PO 'map=.*/ttbbttccttlf:0' --PO 'map=.*/ttbbttcc:0' --PO 'map=.*/ttbbttlf:0' --PO 'map=.*/ttccttlf:0'"
if [[ "${RMIN}" == "0" ]] && [[ "${RMAX}" == "0" ]] ; then
    #OPTIONS="-P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO verbose --PO 'map=.*/sig_stop:r_stop[1,0,2]' --PO 'map=.*/sig_ttbar:r_ttbar[1,0,2]' $OPTS"
    #OPTIONS="-P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO verbose --PO 'map=.*/sig_stop:r[1,0,2]' --PO 'map=.*/sig_ttbar:r[1,0,2]' $OPTS"
    OPTIONS="-P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO verbose --PO 'map=.*/sig_stop:r_stop[1,0,10]' --PO 'map=.*/sig_ttbar:r_ttbar[1,0,10]' $OPTIONS"
    #OPTIONS="--PO verbose --PO 'map=.*/sig_stop:r[1,0,2]' --PO 'map=.*/sig_ttbar:r[1,0,2]' $OPTS"
    #OPTIONS="--PO verbose --PO 'map=.*/sig_stop:r_stop[1,0,2]' --PO 'map=.*/sig_ttbar:r_ttbar[1,0,2]' $OPTS"
    COMMAND="text2workspace.py input_${category}.txt -o input_${category}.root -m ${M} $OPTIONS"
else
    #OPTIONS="-P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO verbose --PO 'map=.*/sig_stop:r_stop[1,${RMIN},${RMAX}]' --PO 'map=.*/sig_ttbar:r_ttbar[1,${RMIN},${RMAX}]' $OPTS"
    #OPTIONS="-P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO verbose --PO 'map=.*/sig_stop:r[1,${RMIN},${RMAX}]' --PO 'map=.*/sig_ttbar:r[1,${RMIN},${RMAX}]' $OPTS"
    OPTIONS="-P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO verbose --PO 'map=.*/sig_stop:r_stop[1,${RMIN},${RMAX}]' --PO 'map=.*/sig_ttbar:r_ttbar[1,${RMIN},${RMAX}]' $OPTIONS"
    #OPTIONS="--PO verbose --PO 'map=.*/sig_stop:r[1,${RMIN},${RMAX}]' --PO 'map=.*/sig_ttbar:r[1,${RMIN},${RMAX}]' $OPTS"
    #OPTIONS="--PO verbose --PO 'map=.*/sig_stop:r_stop[1,${RMIN},${RMAX}]' --PO 'map=.*/sig_ttbar:r_ttbar[1,${RMIN},${RMAX}]' $OPTS"
    COMMAND="text2workspace.py input_${category}.txt -o input_${category}.root -m ${M} $OPTIONS"
fi

echo $COMMAND
eval $COMMAND
echo
echo

#combine aux/input_MVAHut_b4j4_hut.root -M MaxLikelihoodFit --saveShapes --saveWithUncertainties --setPhysicsModelParameters mask_SR=1 --numToysForShapes 1000
#combine input_${category}.root -M MaxLikelihoodFit -m ${M} --saveShapes --saveWithUncertainties --setPhysicsModelParameters mask_signal=1 --numToysForShapes 1000
#combine input_${category}.root -M MaxLikelihoodFit  --setPhysicsModelParameters pdf_index=1 --toysFile higgsCombineTest.GenerateOnly.mH125.123456.root  -t 100 --rMin -10 --rMax 10 --freezeNuisances pdf_index
#combine input_${category}.root -M MaxLikelihoodFit --toysFile higgsCombineTest.GenerateOnly.mH125.123456.root  -t 100 --rMin -10 --rMax 10
#combine input_${category}.root -M MaxLikelihoodFit -m ${M} --numToysForShapes 1000 --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --preFitValue 1 --skipBOnlyFit #--numToysForShapes 1000 --rMin -10 --rMax 10
#COMMAND="combine input_${category}.root -M MaxLikelihoodFit -m ${M} --numToysForShapes 1000 --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --preFitValue 1 --skipBOnlyFit"
#COMMAND="combine input_${category}.root -M MaxLikelihoodFit -m ${M} --numToysForShapes 1000 --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1"
#if [ "${category}" == "MVAHct_b3j3_hct" ] || [ "${category}" == "MVAHct_b4j4_hct" ] ; then
#    COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --rMin -100 --rMax 100"
#else
#    COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1"
#fi
#COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --rMin -100 --rMax 100"
#COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1"
#COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --skipBOnlyFit            --rMin=${RMIN} --rMax=${RMAX}"
OPTIONS=""
#OPTIONS="-S 0 $OPTIONS"
#OPTIONS="--minos=all $OPTIONS"
#OPTIONS="--autoMaxPOIs=* $OPTIONS"
#OPTIONS="--forceRecreateNLL $OPTIONS"
#OPTIONS="--customStartingPoint $OPTIONS"
#OPTIONS="--numToysForShapes=200 $OPTIONS"
#OPTIONS="--justFit $OPTIONS"
#OPTIONS="--skipBOnlyFit $OPTIONS"
#OPTIONS="--keepFailures $OPTIONS"
if [[ "${RMIN}" == "0" ]] && [[ "${RMAX}" == "0" ]] ; then
    #COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1"
    #COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --signalPdfNames=sig_stop,sig_ttbar --backgroundPdfNames=ttbb,ttcc,ttlf,stop,wjets,zjets,other --justFit --skipBOnlyFit"
    #COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --keepFailures"
    #COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --keepFailures --signalPdfNames=h_sig_stop,h_sig_ttbar --backgroundPdfNames=h_ttbb,h_ttcc,h_ttlf,h_stop,h_wjets,h_zjets,h_other"
    COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 $OPTIONS"
else
    #COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1            --rMin=${RMIN} --rMax=${RMAX}"
    #COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --signalPdfNames=sig_stop,sig_ttbar --backgroundPdfNames=ttbb,ttcc,ttlf,stop,wjets,zjets,other --justFit --skipBOnlyFit            --rMin=${RMIN} --rMax=${RMAX}"
    #COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --keepFailures            --rMin=${RMIN} --rMax=${RMAX}"
    #COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --keepFailures --signalPdfNames=h_sig_stop,h_sig_ttbar --backgroundPdfNames=h_ttbb,h_ttcc,h_ttlf,h_stop,h_wjets,h_zjets,h_other            --rMin=${RMIN} --rMax=${RMAX}"
    COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --rMin=${RMIN} --rMax=${RMAX} $OPTIONS"
    #COMMAND="combine input_${category}.txt -M MaxLikelihoodFit"
fi
#COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1"
#if [ "${category}" == "MVAHut_b3j3_hut" ] || [ "${category}" == "MVAHct_b2j3_hct" ] || [ "${category}" == "MVAHct_b2j4_hct" ] ; then
#if [ "${category}" == "MVAHut_b3j3_hut" ] || [ "${category}" == "MVAHct_b2j3_hct" ] ; then
#    COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1"
#elif [ "${category}" == "MVAHct_b2j4_hct" ]; then
#    COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1"
#else
#    COMMAND="combine input_${category}.txt -M MaxLikelihoodFit -m ${M} --saveShapes --saveOverallShapes --saveWithUncertainties --saveNormalizations --plots --robustFit 1 --rMin -100 --rMax 100"
#fi
echo $COMMAND
eval $COMMAND
echo
echo

#exit

#PostFitShapes -d input_${category}.root -o ${category}_shapes.root -m ${M} -f mlfit.root:fit_s --postfit --sampling --print
#PostFitShapes -d input_${category}.txt -o ${category}_shapes_prefit.root -m ${M}
#PostFitShapes -d input_${category}.txt -o ${category}_shapes_postfit.root -m ${M} -f mlfit.root:fit_s --postfit --sampling --covariance --print
#PostFitShapes -d input_${category}.root -o ${category}_shapes_postfit.root -m ${M} -f mlfit.root:fit_s --postfit --sampling --print
#PostFitShapesFromWorkspace -w input_${category}.root -d input_${category}.txt -o ${category}_shapes_postfit.root -m ${M} -f mlfit.root:fit_s --postfit --sampling --covariance --print
#COMMAND="PostFitShapes -d input_${category}.txt -o ${category}_shapes_postfit.root -m ${M} -f mlfit.root:fit_s --postfit --sampling --covariance --print"
COMMAND="PostFitShapesFromWorkspace -w input_${category}.root -o ${category}_shapes_postfit.root -m ${M} -f mlfit.root:fit_s --postfit --sampling --print"
echo $COMMAND
eval $COMMAND
echo
echo


#rm -rf $OUTPUT
#mkdir -p $OUTPUT

#python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/CombineHarvester/tH_FCNC_MAX/drawPrefitPostfitSeparate.py $OUTPUT $hyp $cat ${ITERATION}

