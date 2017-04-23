from ROOT import *
import sys

fs = []
cs = []

fs.append(TFile.Open('/afs/cern.ch/work/c/cirkovic/kLimits/CombineHarvester/CMSSW_7_4_7/src/CombineHarvester/tH_FCNC_MAX/tHFCNC/Limit/input/input_MVAHctMAX_ALL_hct.root'))
#fs[-1].ls()
for h in ['h_sig_stop_SfIterativeFitJesUp', 'h_sig_ttbar_SfIterativeFitJesUp', 'h_sig_SfIterativeFitJesUp', 'h_sig_stop_SfIterativeFitJesDown', 'h_sig_ttbar_SfIterativeFitJesDown', 'h_sig_SfIterativeFitJesDown', 'h_sig_stop_JesUp', 'h_sig_ttbar_JesUp', 'h_sig_JesUp', 'h_sig_stop_JesDown', 'h_sig_ttbar_JesDown', 'h_sig_JesDown', 'h_ttbb_SfIterativeFitJesUp', 'h_ttbb_SfIterativeFitJesDown', 'h_ttbb_JesUp', 'h_ttbb_JesDown', 'h_ttcc_SfIterativeFitJesUp', 'h_ttcc_SfIterativeFitJesDown', 'h_ttcc_JesUp', 'h_ttcc_JesDown', 'h_ttlf_SfIterativeFitJesUp', 'h_ttlf_SfIterativeFitJesDown', 'h_ttlf_JesUp', 'h_ttlf_JesDown', 'h_stop_SfIterativeFitJesUp', 'h_stop_SfIterativeFitJesDown', 'h_stop_JesUp', 'h_stop_JesDown', 'h_zjets_SfIterativeFitJesUp', 'h_zjets_SfIterativeFitJesDown', 'h_zjets_JesUp', 'h_zjets_JesDown', 'h_wjets_SfIterativeFitJesUp', 'h_wjets_SfIterativeFitJesDown', 'h_wjets_JesUp', 'h_wjets_JesDown', 'h_other_SfIterativeFitJesUp', 'h_other_SfIterativeFitJesDown', 'h_other_JesUp', 'h_other_JesDown']:
    cs.append(TCanvas())
    fs[-1].Get(h)
    fs[-1].Draw()

raw_input('Press ener to finish...')
sys.exit()

cs.append(TCanvas())
fs[-1].Get('h_sig_JesUp')
fs[-1].Draw()
cs.append(TCanvas())
fs[-1].Get('h_sig_SfIterativeFitJesUp')
fs[-1].Draw()

raw_input('Press ener to finish...')

