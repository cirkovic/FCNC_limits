cd ${1}
eval `scramv1 runtime -sh`
cd ${2}

nm=${3/.root/}
name=${nm/input_/}

RMIN=${4}
RMAX=${5}

echo "################# Closure checks (begin) #####################"

#COMMAND="combine -M MaxLikelihoodFit -d common/${3} -t -1 --expectSignal 0"
#echo $COMMAND
#eval $COMMAND
#echo
#echo

#COMMAND="python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit.root -g plots.root"
#echo $COMMAND
#eval $COMMAND
#echo
#echo

#COMMAND="combine -M MaxLikelihoodFit -d common/${3} -t -1 --expectSignal 1"
#echo $COMMAND
#eval $COMMAND
#echo
#echo

#COMMAND="python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/HiggsAnalysis/CombinedLimit/test/diffNuisances.py -a mlfit.root -g plots.root"
#echo $COMMAND
#eval $COMMAND
#echo
#echo

echo "################# Closure checks (end) #####################"

COMMAND="text2workspace.py cards/${3/.root/.txt} -m 125"
echo $COMMAND
eval $COMMAND
echo
echo


#for p in SfIterativeFitHfstats1 SfIterativeFitHfstats2 SfIterativeFitLfstats1 SfIterativeFitLfstats2 SfIterativeFitJes SfIterativeFitLf SfIterativeFitHf SfIterativeFitCferr1 SfIterativeFitCferr2 Jes Jer ; do
for p in SfIterativeFitHfstats1 SfIterativeFitHfstats2 SfIterativeFitLfstats1 SfIterativeFitLfstats2 SfIterativeFitJes SfIterativeFitLf SfIterativeFitHf SfIterativeFitCferr1 SfIterativeFitCferr2 Jer ; do
#for p in SfIterativeFitJes Jes ; do
    COMMAND="combine -M MultiDimFit -m 125 --algo impact -P ${p} cards/${3} --rMin=-1000 --rMax=1000"
    echo $COMMAND
    eval $COMMAND
    echo
    echo
done

exit

#text2workspace.py cards/${3} -m 125
#combineTool.py -M Impacts -d cards/${3/.txt/.root} -m 125 --doInitialFit
##combineTool.py -M Impacts -d cards/${3/.txt/.root} -m 125 --doFits --parallel 4 -t -1 --expectSignal 1
#combineTool.py -M Impacts -d cards/${3/.txt/.root} -m 125 --doFits -t -1 --expectSignal 1
#combineTool.py -M Impacts -d cards/${3/.txt/.root} -m 125 -o impacts_${name}.json -t -1 --expectSignal 1
#plotImpacts.py -i impacts_${name}.json -o impacts_${name}

COMMAND="text2workspace.py cards/${3/.root/.txt} -m 125"
echo $COMMAND
eval $COMMAND
echo
echo

COMMAND="combineTool.py -M Impacts -d common/${3} -m 125 --doInitialFit            --rMin=${RMIN} --rMax=${RMAX}"
echo $COMMAND
eval $COMMAND
echo
echo

COMMAND="combineTool.py -M Impacts -d common/${3} -m 125 --doFits --parallel 4                --rMin=${RMIN} --rMax=${RMAX}"
echo $COMMAND
eval $COMMAND
echo
echo

COMMAND="combineTool.py -M Impacts -d common/${3} -m 125 --doFits                          --rMin=${RMIN} --rMax=${RMAX}"
echo $COMMAND
eval $COMMAND
echo
echo

COMMAND="combineTool.py -M Impacts -d common/${3} -m 125 -o impacts_${name}.json            --rMin=${RMIN} --rMax=${RMAX}"
echo $COMMAND
eval $COMMAND
echo
echo

COMMAND="plotImpacts.py -i impacts_${name}.json -o impacts_${name}"
echo $COMMAND
eval $COMMAND
echo
echo

##PostFitShapes -d htt_mt_125.txt -o htt_mt_125_shapes.root -m 125 -f mlfit.root:fit_s --postfit --sampling --print
#combine -M MaxLikelihoodFit cards/${3} -t -1 --expectSignal 1
#PostFitShapes -d cards/${3} -o ${3/.txt/_shapes.root} -m 125 -f mlfit.root:fit_s --postfit --sampling --print
##../../CombineTools/scripts/plotImpacts_modified.py -i impacts_${name}.json -o impacts_${name}
