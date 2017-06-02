#INPUT=/afs/cern.ch/user/k/kderoove/public/2DInputs/
INPUT=/afs/cern.ch/user/k/kderoove/public/inputs_HLTEle32_ReducedVars/2D/
#OUTPUT=2dinputs
#OUTPUT=2dinputs1
#OUTPUT=2dinputs2
#OUTPUT=2dinputs3
#OUTPUT=2dinputs4
OUTPUT=2dinputs5

rm -rf $OUTPUT
#cp -r /afs/cern.ch/user/k/kderoove/public/2DInputs/ $OUTPUT
cp -r $INPUT $OUTPUT

I=0
J=0

#for i in 00 05 10 30; do
for i in 00 03 06 09 12 15 18 21 24 27; do
    #for j in 00 05 10 30; do
    for j in 00 03 06 09 12 15 18 21 24 27; do
        mkdir $OUTPUT/${J}_${I}
        for c in b2j3 b3j3 b2j4 b3j4 b4j4; do
            #mv $OUTPUT/input_MVA2DComb_khut0p${i}__khct0p${j}_${c}_Mergedbackgrounds.root $OUTPUT/${J}_${I}
#            if [[ "$i" == "05" ]] && [[ "$j" == "10" ]]; then
#                mv $OUTPUT/input_MVA2DComb_khut0p00__khct0p00_${c}_Mergedbackgrounds.root $OUTPUT/${J}_${I}/input_MVAHuctComb_${c}_huct_Mergedbackgrounds.root
#            else
                mv $OUTPUT/input_MVA2DComb_khut0p${i}__khct0p${j}_${c}_Mergedbackgrounds.root $OUTPUT/${J}_${I}/input_MVAHuctComb_${c}_huct_Mergedbackgrounds.root
#            fi
        done
        J=$((J+1))
    done
    I=$((I+1))
    J=0
done

eos rm -r /eos/cms/store/caf/user/mdjordje/Cirkovic/$OUTPUT
eos mkdir /eos/cms/store/caf/user/mdjordje/Cirkovic/$OUTPUT
xrdcp -r $OUTPUT root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/$OUTPUT
rm -rf $OUTPUT

