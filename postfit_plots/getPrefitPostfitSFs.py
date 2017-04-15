from ROOT import *
import sys

gROOT.SetBatch(True)

hypotheses = [sys.argv[1]]
categories = [sys.argv[2]]
iteration = sys.argv[3]
mass = sys.argv[4]


for CASE in ['_SEPARATE']:

    fs = []
    FS = []
    hspre = {}
    hspost = {}
    hnames = None

    for hyp in hypotheses:

        if CASE == '_TOGETHER':
            hnames = ['TotalProcs', 'data_obs']
            hcolors = [ kGreen, kBlack ]
        if CASE == '_SIGBKG':
            hnames = ['TotalBkg', 'TotalSig', 'data_obs']
            hcolors = [ kBlue, kRed, kBlack ]
        elif CASE == '_SEPARATE':
            #hnames = ['ttbb', 'ttcc', 'ttlf', 'other', 'sig', 'data_obs']
            hnames = ['ttbb', 'ttcc', 'ttlf', 'stop', 'zjets', 'wjets', 'other', 'sig_stop', 'sig_ttbar', 'data_obs']

        for cat in categories:
            fs.append(TFile.Open('MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_'+iteration+'_'+mass+'/MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_shapes_postfit.root'))
            if not fs[-1]: continue
            for p in ['prefit', 'postfit']:
                for hi, h in enumerate(hnames):
                    if p == 'prefit':
                        hspre[h] = fs[-1].Get(cat+'_'+p+'/'+h)
                        hspre[h].Sumw2()
                    elif p == 'postfit':
                        hspost[h] = fs[-1].Get(cat+'_'+p+'/'+h)
                        hspost[h].Sumw2()

        for cat in categories:
            FS.append(TFile.Open('MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_'+iteration+'_'+mass+'/MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_postfit_prefit_SFs.root', 'RECREATE'))
            if not FS[-1]: continue
            for hkey, hpre in hspre.iteritems():
                hpost = hspost[hpre.GetName().replace('pre', 'post')]
                #print (hpre.GetName(), hpost.GetName())
                print hpre.GetName()
                hdiv = hpre.Clone()
                hdiv.Sumw2()
                hdiv.Divide(hpost, hpre)
                for x in xrange(0, hdiv.GetXaxis().GetNbins()):
                    print '\t', x, hdiv.GetBinContent(x+1), hdiv.GetBinError(x+1)
                hdiv.Write()
            FS[-1].Close()
