from ROOT import *

fs = []
hs = {}

samples = ['ST', 'TT', 'maxSTandTT', 'combSTandTT']
labels  = ['ST', 'TT', 'MAX', 'Comb']

for i, s in enumerate(samples):
    l = labels[i]
    fs.append(TFile.Open('/afs/cern.ch/user/k/kderoove/public/TrainingsWithTightEID/'+s+'/input_MVAHut'+l+'_b2j4_hut_Mergedbackgrounds.root'))
    hs[s+'_sig'] = fs[-1].Get(s+'_sig')
    print hs[s+'_sig'].Integral()
    hs[s+'_sig_stop'] = fs[-1].Get(s+'_sig_stop')
    print hs[s+'_sig_stop'].Integral()
    hs[s+'_sig_ttbar'] = fs[-1].Get(s+'_sig_ttbar')
    print hs[s+'_sig_ttbar'].Integral()
    print

