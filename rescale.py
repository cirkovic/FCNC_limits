from ROOT import *
import sys

fs = []
FS = []

input = '/afs/cern.ch/work/c/cirkovic/TrainingsFCNC/input'
INPUT = '/afs/cern.ch/work/c/cirkovic/TrainingsFCNC/input_rescale'

categories = ['b2j3', 'b3j3', 'b2j4', 'b3j4', 'b4j4']
ucs = ['u','c']
hnames = ['h_data_obs', 'h_other', 'h_other_JerDown', 'h_other_JerUp', 'h_other_JesDown', 'h_other_JesUp', 'h_other_SfIteraviveFitCferr1Down', 'h_other_SfIteraviveFitCferr1Up', 'h_other_SfIteraviveFitCferr2Down', 'h_other_SfIteraviveFitCferr2Up', 'h_other_SfIteraviveFitHfDown', 'h_other_SfIteraviveFitHfUp', 'h_other_SfIteraviveFitHfstats1Down', 'h_other_SfIteraviveFitHfstats1Up', 'h_other_SfIteraviveFitHfstats2Down', 'h_other_SfIteraviveFitHfstats2Up', 'h_other_SfIteraviveFitLfDown', 'h_other_SfIteraviveFitLfUp', 'h_other_SfIteraviveFitLfstats1Down', 'h_other_SfIteraviveFitLfstats1Up', 'h_other_SfIteraviveFitLfstats2Down', 'h_other_SfIteraviveFitLfstats2Up', 'h_other_SfLeptonDown', 'h_other_SfLeptonUp', 'h_other_SfPileupDown', 'h_other_SfPileupUp', 'h_other_SfTopPtDown', 'h_other_SfTopPtUp', 'h_sig', 'h_sig_JerDown', 'h_sig_JerUp', 'h_sig_JesDown', 'h_sig_JesUp', 'h_sig_SfIteraviveFitCferr1Down', 'h_sig_SfIteraviveFitCferr1Up', 'h_sig_SfIteraviveFitCferr2Down', 'h_sig_SfIteraviveFitCferr2Up', 'h_sig_SfIteraviveFitHfDown', 'h_sig_SfIteraviveFitHfUp', 'h_sig_SfIteraviveFitHfstats1Down', 'h_sig_SfIteraviveFitHfstats1Up', 'h_sig_SfIteraviveFitHfstats2Down', 'h_sig_SfIteraviveFitHfstats2Up', 'h_sig_SfIteraviveFitLfDown', 'h_sig_SfIteraviveFitLfUp', 'h_sig_SfIteraviveFitLfstats1Down', 'h_sig_SfIteraviveFitLfstats1Up', 'h_sig_SfIteraviveFitLfstats2Down', 'h_sig_SfIteraviveFitLfstats2Up', 'h_sig_SfLeptonDown', 'h_sig_SfLeptonUp', 'h_sig_SfPileupDown', 'h_sig_SfPileupUp', 'h_sig_SfTopPtDown', 'h_sig_SfTopPtUp', 'h_sig_stop', 'h_sig_stop_JerDown', 'h_sig_stop_JerUp', 'h_sig_stop_JesDown', 'h_sig_stop_JesUp', 'h_sig_stop_SfIteraviveFitCferr1Down', 'h_sig_stop_SfIteraviveFitCferr1Up', 'h_sig_stop_SfIteraviveFitCferr2Down', 'h_sig_stop_SfIteraviveFitCferr2Up', 'h_sig_stop_SfIteraviveFitHfDown', 'h_sig_stop_SfIteraviveFitHfUp', 'h_sig_stop_SfIteraviveFitHfstats1Down', 'h_sig_stop_SfIteraviveFitHfstats1Up', 'h_sig_stop_SfIteraviveFitHfstats2Down', 'h_sig_stop_SfIteraviveFitHfstats2Up', 'h_sig_stop_SfIteraviveFitLfDown', 'h_sig_stop_SfIteraviveFitLfUp', 'h_sig_stop_SfIteraviveFitLfstats1Down', 'h_sig_stop_SfIteraviveFitLfstats1Up', 'h_sig_stop_SfIteraviveFitLfstats2Down', 'h_sig_stop_SfIteraviveFitLfstats2Up', 'h_sig_stop_SfLeptonDown', 'h_sig_stop_SfLeptonUp', 'h_sig_stop_SfPileupDown', 'h_sig_stop_SfPileupUp', 'h_sig_stop_SfTopPtDown', 'h_sig_stop_SfTopPtUp', 'h_sig_ttbar', 'h_sig_ttbar_JerDown', 'h_sig_ttbar_JerUp', 'h_sig_ttbar_JesDown', 'h_sig_ttbar_JesUp', 'h_sig_ttbar_SfIteraviveFitCferr1Down', 'h_sig_ttbar_SfIteraviveFitCferr1Up', 'h_sig_ttbar_SfIteraviveFitCferr2Down', 'h_sig_ttbar_SfIteraviveFitCferr2Up', 'h_sig_ttbar_SfIteraviveFitHfDown', 'h_sig_ttbar_SfIteraviveFitHfUp', 'h_sig_ttbar_SfIteraviveFitHfstats1Down', 'h_sig_ttbar_SfIteraviveFitHfstats1Up', 'h_sig_ttbar_SfIteraviveFitHfstats2Down', 'h_sig_ttbar_SfIteraviveFitHfstats2Up', 'h_sig_ttbar_SfIteraviveFitLfDown', 'h_sig_ttbar_SfIteraviveFitLfUp', 'h_sig_ttbar_SfIteraviveFitLfstats1Down', 'h_sig_ttbar_SfIteraviveFitLfstats1Up', 'h_sig_ttbar_SfIteraviveFitLfstats2Down', 'h_sig_ttbar_SfIteraviveFitLfstats2Up', 'h_sig_ttbar_SfLeptonDown', 'h_sig_ttbar_SfLeptonUp', 'h_sig_ttbar_SfPileupDown', 'h_sig_ttbar_SfPileupUp', 'h_sig_ttbar_SfTopPtDown', 'h_sig_ttbar_SfTopPtUp', 'h_stop', 'h_stop_JerDown', 'h_stop_JerUp', 'h_stop_JesDown', 'h_stop_JesUp', 'h_stop_SfIteraviveFitCferr1Down', 'h_stop_SfIteraviveFitCferr1Up', 'h_stop_SfIteraviveFitCferr2Down', 'h_stop_SfIteraviveFitCferr2Up', 'h_stop_SfIteraviveFitHfDown', 'h_stop_SfIteraviveFitHfUp', 'h_stop_SfIteraviveFitHfstats1Down', 'h_stop_SfIteraviveFitHfstats1Up', 'h_stop_SfIteraviveFitHfstats2Down', 'h_stop_SfIteraviveFitHfstats2Up', 'h_stop_SfIteraviveFitLfDown', 'h_stop_SfIteraviveFitLfUp', 'h_stop_SfIteraviveFitLfstats1Down', 'h_stop_SfIteraviveFitLfstats1Up', 'h_stop_SfIteraviveFitLfstats2Down', 'h_stop_SfIteraviveFitLfstats2Up', 'h_stop_SfLeptonDown', 'h_stop_SfLeptonUp', 'h_stop_SfPileupDown', 'h_stop_SfPileupUp', 'h_stop_SfTopPtDown', 'h_stop_SfTopPtUp', 'h_ttbb', 'h_ttbb_JerDown', 'h_ttbb_JerUp', 'h_ttbb_JesDown', 'h_ttbb_JesUp', 'h_ttbb_SfIteraviveFitCferr1Down', 'h_ttbb_SfIteraviveFitCferr1Up', 'h_ttbb_SfIteraviveFitCferr2Down', 'h_ttbb_SfIteraviveFitCferr2Up', 'h_ttbb_SfIteraviveFitHfDown', 'h_ttbb_SfIteraviveFitHfUp', 'h_ttbb_SfIteraviveFitHfstats1Down', 'h_ttbb_SfIteraviveFitHfstats1Up', 'h_ttbb_SfIteraviveFitHfstats2Down', 'h_ttbb_SfIteraviveFitHfstats2Up', 'h_ttbb_SfIteraviveFitLfDown', 'h_ttbb_SfIteraviveFitLfUp', 'h_ttbb_SfIteraviveFitLfstats1Down', 'h_ttbb_SfIteraviveFitLfstats1Up', 'h_ttbb_SfIteraviveFitLfstats2Down', 'h_ttbb_SfIteraviveFitLfstats2Up', 'h_ttbb_SfLeptonDown', 'h_ttbb_SfLeptonUp', 'h_ttbb_SfPileupDown', 'h_ttbb_SfPileupUp', 'h_ttbb_SfTopPtDown', 'h_ttbb_SfTopPtUp', 'h_ttcc', 'h_ttcc_JerDown', 'h_ttcc_JerUp', 'h_ttcc_JesDown', 'h_ttcc_JesUp', 'h_ttcc_SfIteraviveFitCferr1Down', 'h_ttcc_SfIteraviveFitCferr1Up', 'h_ttcc_SfIteraviveFitCferr2Down', 'h_ttcc_SfIteraviveFitCferr2Up', 'h_ttcc_SfIteraviveFitHfDown', 'h_ttcc_SfIteraviveFitHfUp', 'h_ttcc_SfIteraviveFitHfstats1Down', 'h_ttcc_SfIteraviveFitHfstats1Up', 'h_ttcc_SfIteraviveFitHfstats2Down', 'h_ttcc_SfIteraviveFitHfstats2Up', 'h_ttcc_SfIteraviveFitLfDown', 'h_ttcc_SfIteraviveFitLfUp', 'h_ttcc_SfIteraviveFitLfstats1Down', 'h_ttcc_SfIteraviveFitLfstats1Up', 'h_ttcc_SfIteraviveFitLfstats2Down', 'h_ttcc_SfIteraviveFitLfstats2Up', 'h_ttcc_SfLeptonDown', 'h_ttcc_SfLeptonUp', 'h_ttcc_SfPileupDown', 'h_ttcc_SfPileupUp', 'h_ttcc_SfTopPtDown', 'h_ttcc_SfTopPtUp', 'h_ttlf', 'h_ttlf_JerDown', 'h_ttlf_JerUp', 'h_ttlf_JesDown', 'h_ttlf_JesUp', 'h_ttlf_SfIteraviveFitCferr1Down', 'h_ttlf_SfIteraviveFitCferr1Up', 'h_ttlf_SfIteraviveFitCferr2Down', 'h_ttlf_SfIteraviveFitCferr2Up', 'h_ttlf_SfIteraviveFitHfDown', 'h_ttlf_SfIteraviveFitHfUp', 'h_ttlf_SfIteraviveFitHfstats1Down', 'h_ttlf_SfIteraviveFitHfstats1Up', 'h_ttlf_SfIteraviveFitHfstats2Down', 'h_ttlf_SfIteraviveFitHfstats2Up', 'h_ttlf_SfIteraviveFitLfDown', 'h_ttlf_SfIteraviveFitLfUp', 'h_ttlf_SfIteraviveFitLfstats1Down', 'h_ttlf_SfIteraviveFitLfstats1Up', 'h_ttlf_SfIteraviveFitLfstats2Down', 'h_ttlf_SfIteraviveFitLfstats2Up', 'h_ttlf_SfLeptonDown', 'h_ttlf_SfLeptonUp', 'h_ttlf_SfPileupDown', 'h_ttlf_SfPileupUp', 'h_ttlf_SfTopPtDown', 'h_ttlf_SfTopPtUp', 'h_wjets', 'h_wjets_JerDown', 'h_wjets_JerUp', 'h_wjets_JesDown', 'h_wjets_JesUp', 'h_wjets_SfIteraviveFitCferr1Down', 'h_wjets_SfIteraviveFitCferr1Up', 'h_wjets_SfIteraviveFitCferr2Down', 'h_wjets_SfIteraviveFitCferr2Up', 'h_wjets_SfIteraviveFitHfDown', 'h_wjets_SfIteraviveFitHfUp', 'h_wjets_SfIteraviveFitHfstats1Down', 'h_wjets_SfIteraviveFitHfstats1Up', 'h_wjets_SfIteraviveFitHfstats2Down', 'h_wjets_SfIteraviveFitHfstats2Up', 'h_wjets_SfIteraviveFitLfDown', 'h_wjets_SfIteraviveFitLfUp', 'h_wjets_SfIteraviveFitLfstats1Down', 'h_wjets_SfIteraviveFitLfstats1Up', 'h_wjets_SfIteraviveFitLfstats2Down', 'h_wjets_SfIteraviveFitLfstats2Up', 'h_wjets_SfLeptonDown', 'h_wjets_SfLeptonUp', 'h_wjets_SfPileupDown', 'h_wjets_SfPileupUp', 'h_wjets_SfTopPtDown', 'h_wjets_SfTopPtUp', 'h_zjets', 'h_zjets_JerDown', 'h_zjets_JerUp', 'h_zjets_JesDown', 'h_zjets_JesUp', 'h_zjets_SfIteraviveFitCferr1Down', 'h_zjets_SfIteraviveFitCferr1Up', 'h_zjets_SfIteraviveFitCferr2Down', 'h_zjets_SfIteraviveFitCferr2Up', 'h_zjets_SfIteraviveFitHfDown', 'h_zjets_SfIteraviveFitHfUp', 'h_zjets_SfIteraviveFitHfstats1Down', 'h_zjets_SfIteraviveFitHfstats1Up', 'h_zjets_SfIteraviveFitHfstats2Down', 'h_zjets_SfIteraviveFitHfstats2Up', 'h_zjets_SfIteraviveFitLfDown', 'h_zjets_SfIteraviveFitLfUp', 'h_zjets_SfIteraviveFitLfstats1Down', 'h_zjets_SfIteraviveFitLfstats1Up', 'h_zjets_SfIteraviveFitLfstats2Down', 'h_zjets_SfIteraviveFitLfstats2Up', 'h_zjets_SfLeptonDown', 'h_zjets_SfLeptonUp', 'h_zjets_SfPileupDown', 'h_zjets_SfPileupUp', 'h_zjets_SfTopPtDown', 'h_zjets_SfTopPtUp']

'''
         TH1F* h_sig_stop = (TH1F*)f->Get("h_sig_stop");
         float statsSigStop = h_sig_stop->Integral();
         if (id == 0) // hut
             statsSigStop = statsSigStop/0.88*13.84;
         else if (id == 1) //hct
             statsSigStop = statsSigStop/0.11*1.90;
         TH1F* h_sig_ttbar = (TH1F*)f->Get("h_sig_ttbar");
         float statsSigTtbar = h_sig_ttbar->Integral();
         statsSigTtbar = statsSigTtbar/4.892*36.98;
'''

for uc in ucs:
    for c in categories:
        fs.append(TFile.Open(input+'/input_MVAH'+uc+'tMAX_'+c+'_h'+uc+'t.root'))
        hs = {}
        for hn in hnames:
            htemp = fs[-1].Get(hn)
            hs[hn] = htemp.Clone()
            hs[hn].SetDirectory(0)
            if 'h_sig_stop' in hn:
                if uc == 'u':
                    hs[hn].Scale(1.0*0.88/13.84)
                elif uc == 'c':
                    hs[hn].Scale(1.0*0.11/1.90)
            elif 'h_sig_ttbar' in hn:
                    hs[hn].Scale(1.0*4.892/36.98)
        fs[-1].Close()
        FS.append(TFile.Open(INPUT+'/input_MVAH'+uc+'tMAX_'+c+'_h'+uc+'t.root', 'RECREATE'))
        for hn in hnames:
            hs[hn].Write()
        FS[-1].Close()