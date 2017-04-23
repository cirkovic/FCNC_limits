cd ${1}
eval `scramv1 runtime -sh`
cd ${2}

nm=${3/.txt/}
name=${nm/input_/}
RMIN=${4}
RMAX=${5}
M=${6}
OUTDIR=${7}

echo ${name} ${RMIN} ${RMAX} ${M} $OUTDIR

if [[ "${RMIN}" == "0" ]] && [[ "${RMAX}" == "0" ]] ; then
    RMIN_RMAX=""
else
    RMIN_RMAX="--rMin=${RMIN} --rMax=${RMAX}"
fi

wp=workspace_${name}.root

COMMAND="text2workspace.py ../cards/${3} -o ${wp} -m ${M}"
echo $COMMAND
eval $COMMAND
echo
echo

COMMAND="combineTool.py -M Impacts -d ${wp} -m ${M} --doInitialFit            ${RMIN_RMAX}"
echo $COMMAND
eval $COMMAND
echo
echo

COMMAND="combineTool.py -M Impacts -d ${wp} -m ${M} --doFits --parallel 4                ${RMIN_RMAX}"
echo $COMMAND
eval $COMMAND
echo
echo

#COMMAND="combineTool.py -M Impacts -d common/${3} -m ${M} --doFits                          ${RMIN_RMAX}"
#echo $COMMAND
#eval $COMMAND
#echo
#echo

COMMAND="combineTool.py -M Impacts -d ${wp} -m ${M} -o impacts_${name}.json            ${RMIN_RMAX}"
echo $COMMAND
eval $COMMAND
echo
echo

COMMAND="python /afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/CombineHarvester/CombineTools/scripts/plotImpacts.py -i impacts_${name}.json -o impacts_${name}"
echo $COMMAND
eval $COMMAND
echo
echo

#cp impacts_${name}.png impacts_${name}.pdf $OUTDIR
cp impacts_${name}.pdf $OUTDIR
#cp impacts_${name}.jpg $OUTDIR
#cp impacts_${name}.png $OUTDIR





exit

#/usr/bin/convert -verbose -density 500 impacts_${name}.pdf impacts_${name}.png
../convert -verbose -density 500 impacts_${name}.pdf impacts_${name}.png

exit

find . -type f -name '*.pdf' -print0 |
  while IFS= read -r -d '' file
    do convert -verbose -density 500 "${file}" "${file%.*}.png"
  done

##PostFitShapes -d htt_mt_125.txt -o htt_mt_125_shapes.root -m ${M} -f mlfit.root:fit_s --postfit --sampling --print
#combine -M MaxLikelihoodFit cards/${3} -t -1 --expectSignal 1
#PostFitShapes -d cards/${3} -o ${3/.txt/_shapes.root} -m ${M} -f mlfit.root:fit_s --postfit --sampling --print
##../../CombineTools/scripts/plotImpacts_modified.py -i impacts_${name}.json -o impacts_${name}
