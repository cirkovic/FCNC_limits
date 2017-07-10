from ROOT import *
import sys

#out='~/www/12-02-2017/syst/'
#out1='~/www/12-02-2017/abs/'
#out2='~/www/12-02-2017/rel/'
#out1='~/www/12-02-2017_1/abs/'
#out2='~/www/12-02-2017_1/rel/'
#out1='~/www/13-02-2017/abs/'
#out2='~/www/13-02-2017/rel/'
#out1='~/www/14-02-2017/abs/'
#out2='~/www/14-02-2017/rel/'
#out1='~/www/17-02-2017/abs/'
#out2='~/www/17-02-2017/rel/'
#out1='~/www/20-02-2017_medium/abs/'
#out2='~/www/20-02-2017_medium/rel/'
#out1='~/www/01-03-2017_medium/abs/'
#out2='~/www/01-03-2017_medium/rel/'
#out1='~/www/10-05-2017_abs_rel_diff/abs/'
#out2='~/www/10-05-2017_abs_rel_diff/rel/'
out1='~/www/16-06-2017_abs_rel_diff/abs/'
out2='~/www/16-06-2017_abs_rel_diff/rel/'
gROOT.SetBatch(True)
gStyle.SetOptStat(0)
more1=1.5
more2=2.0

fs = []
fs1 = []
cs = []

#input = './input_TrainingsWithTightEID/TrainingsWithTightEID_NEW/'
#input = 'input'
#input = '/afs/cern.ch/user/k/kderoove/public/Trainings_2017_04_24_statBinUnc_corrected/'
input = '/afs/cern.ch/user/k/kderoove/public/inputs_HLTEle32_ReducedVars_AcceptanceScale/'

#I = ['ST', 'TT', 'combSTandTT', 'maxSTandTT']
I = ['combSTandTT']

#P = ['data_obs', 'sig', 'sig_stop', 'sig_ttbar', 'ttbb', 'ttcc', 'ttlf', 'other', 'ttbbttccttlf', 'ttbbttcc', 'ttbbttlf', 'ttccttlf']
P = ['data_obs', 'sig', 'sig_stop', 'sig_ttbar', 'ttbb', 'ttcc', 'ttlf', 'other']
Procs = ['data_obs', 'Sig', 'SigStop', 'SigTTbar', 'ttbb', 'ttcc', 'ttlf', 'other']

#S = ['SfIteraviveFitLf', 'SfIteraviveFitHf', 'SfIteraviveFitLfstats1', 'SfIteraviveFitLfstats2', 'SfIteraviveFitHfstats1', 'SfIteraviveFitHfstats2', 'SfIteraviveFitCferr1', 'SfIteraviveFitCferr2', 'SfPileup', 'SfLepton', 'SfTopPt', 'Jes', 'Jer']
#S = ['SfIteraviveFitLf', 'SfIteraviveFitHf', 'SfIteraviveFitLfstats1', 'SfIteraviveFitLfstats2', 'SfIteraviveFitHfstats1', 'SfIteraviveFitHfstats2', 'SfIteraviveFitCferr1', 'SfIteraviveFitCferr2', 'SfPileup', 'SfLepton', 'SfTopPt', 'Jes', 'Jer', 'MEPS', 'UE', 'scaleEnvelope']
S = ['SfIteraviveFitLf', 'SfIteraviveFitHf', 'SfIteraviveFitLfstats1', 'SfIteraviveFitLfstats2', 'SfIteraviveFitHfstats1', 'SfIteraviveFitHfstats2', 'SfIteraviveFitCferr1', 'SfIteraviveFitCferr2', 'SfPileup', 'SfLepton', 'SfTopPt', 'Jes', 'Jer', 'hdamp', 'UE', 'scaleEnvelope', 'PDFEnvelope']

if False:
    Hsu = {}
    Hsd = {}
    for k in ['u', 'c']:
        Hsu[k] = {}
        Hsd[k] = {}
        #for s in ['SfIteraviveFitLf', 'SfIteraviveFitHf', 'SfIteraviveFitLfstats1', 'SfIteraviveFitLfstats2', 'SfIteraviveFitHfstats1', 'SfIteraviveFitHfstats2', 'SfIteraviveFitCferr1', 'SfIteraviveFitCferr2', 'SfPileup', 'SfLepton', 'SfTopPt', 'Jes', 'Jer']:
        for s in S:
            Hsu[k][s] = TH1F("Hu_"+k+"_"+s, "Hu_"+k+"_"+s, 100, 0, 100)
            Hsd[k][s] = TH1F("Hd_"+k+"_"+s, "Hd_"+k+"_"+s, 100, -100, 0)
            

for ic in I:
    for k in ['u', 'c']:
        for c in ['b2j3', 'b3j3', 'b2j4', 'b3j4', 'b4j4']:
            output1=out1+ic+'/h'+k+'t/'+c+'/'
            output2=out2+ic+'/h'+k+'t/'+c+'/'
            if   ic == 'ST':
                lab = 'ST'
            elif ic == 'TT':
                lab = 'TT'
            elif ic == 'combSTandTT':
                lab = 'Comb'
            elif ic == 'maxSTandTT':
                lab = 'MAX'
            #fn = input+ic+'/input_MVAH'+k+'t'+lab+'_'+c+'_h'+k+'t.root'
            #fn = input+'/'+ic+'/input_MVAH'+k+'t'+lab+'_'+c+'_h'+k+'t_Mergedbackgrounds.root'
            fn = input+'/input_MVAH'+k+'t'+lab+'_'+c+'_h'+k+'t_Mergedbackgrounds.root'
            #print fn
            fs.append(TFile.Open(fn))
            fs1.append(TFile.Open(fn))
            hs = {}
            #for p in ['h_sig', 'h_sig_stop', 'h_sig_ttbar', 'h_ttbb', 'h_ttcc', 'h_ttlf']:
            #for p in ['h_sig', 'h_ttbb', 'h_ttcc', 'h_ttlf']:
            #for p in ['h_data_obs', 'h_sig', 'h_sig_stop', 'h_sig_ttbar', 'h_ttbb', 'h_ttcc', 'h_ttlf', 'other', 'h_ttbbttccttlf', 'h_ttbbttcc', 'h_ttbbttlf', 'h_ttccttlf']:
            for pi, pp in enumerate(P):
                p = ic+'_'+pp
            #for p in ['h_data_obs', 'h_sig', 'h_sig_stop', 'h_sig_ttbar', 'h_ttbb', 'h_ttcc', 'h_ttlf', 'h_stop', 'h_zjets', 'h_wjets', 'h_other']:
                #for s in ['SfIteraviveFitLf', 'SfIteraviveFitHf', 'SfIteraviveFitLfstats1', 'SfIteraviveFitLfstats2', 'SfIteraviveFitHfstats1', 'SfIteraviveFitHfstats2', 'SfIteraviveFitCferr1', 'SfIteraviveFitCferr2', 'SfPileup', 'SfLepton', 'SfTopPt', 'Jes', 'Jer']:
                for b in xrange(0, 20):
                    S.append(c+'StatBin'+Procs[pi]+str(b))
                for s in S:
                #for s in ['SfIterativeFitHfstats1', 'SfIterativeFitHfstats2', 'SfIterativeFitLfstats1', 'SfIterativeFitLfstats2', 'SfIterativeFitJes', 'SfIterativeFitLf', 'SfIterativeFitHf', 'SfIterativeFitCferr1', 'SfIterativeFitCferr2', 'Jes', 'Jer']:
                    if fs1[-1].Get(p+'_'+s+'Up'):
                        leg = TLegend(0.65, 0.7, 0.9, 0.9)
                        hn = p
                        ms = []
                        print ic, k, c, p, s
                        #if (k, c, p) == ('u', 'b2j3', 'other'): continue
                        #if (k, c, p) == ('u', 'b2j3', 'h_ttbbttccttlf'): continue
                        hs[hn] = fs[-1].Get(hn)
                        if not hs[hn]: continue
                        #hs[hn].Sumw2()
                        hs[hn].SetTitle(hn+'_'+s)
                        hs[hn].SetLineColor(kGreen)
                        leg.AddEntry(hs[hn], hn, 'l')
                        ms.append(hs[hn].GetBinContent(hs[hn].GetMaximumBin()))
                        hnu = p+'_'+s+'Up'
                        hs[hnu] = fs[-1].Get(hnu)
                        if not hs[hnu]: continue
                        #hs[hnu].Sumw2()
                        hs[hnu].SetLineColor(kRed)
                        leg.AddEntry(hs[hnu], hnu, 'l')
                        ms.append(hs[hnu].GetBinContent(hs[hnu].GetMaximumBin()))
                        hnd = p+'_'+s+'Down'
                        hs[hnd] = fs[-1].Get(hnd)
                        if not hs[hnd]: continue
                        #hs[hnd].Sumw2()
                        hs[hnd].SetLineColor(kBlue)
                        leg.AddEntry(hs[hnd], hnd, 'l')
                        ms.append(hs[hnd].GetBinContent(hs[hnd].GetMaximumBin()))
                        if True:
                            hs[hn].SetMaximum(max(ms)*more1)
                            hs[hnu].SetMaximum(max(ms)*more1)
                            hs[hnd].SetMaximum(max(ms)*more1)
                        cs.append(TCanvas())
                        hs[hn].Draw()
                        hs[hnu].Draw("SAME")
                        hs[hnd].Draw("SAME")
                        leg.Draw()
                        cs[-1].Print(output1+hn+'_'+s+'.png')
                        ms = []
                        leg = TLegend(0.35, 0.75, 0.9, 0.9)
                        ru = hs[hnu].Clone()
                        rd = hs[hnd].Clone()
                        ru.SetName(p+'_'+s)
                        rd.SetName(p+'_'+s)
                        ru.Divide(hs[hnu], hs[hn], 1., 1.)
                        rd.Divide(hs[hnd], hs[hn], 1., 1.)
                        rus = []
                        for xi in xrange(0, ru.GetXaxis().GetNbins()):
                            if ru.GetBinContent(xi+1) > 0:
                                rus.append(ru.GetBinContent(xi+1))
                        rds = []
                        for xi in xrange(0, rd.GetXaxis().GetNbins()):
                            if rd.GetBinContent(xi+1) > 0:
                                rds.append(rd.GetBinContent(xi+1))
                        for xi in xrange(0, ru.GetXaxis().GetNbins()): ru.SetBinContent(xi+1, ru.GetBinContent(xi+1)-1)
                        for xi in xrange(0, rd.GetXaxis().GetNbins()): rd.SetBinContent(xi+1, rd.GetBinContent(xi+1)-1)
                        for xr in xrange(0, len(rus)): rus[xr] = (rus[xr]-1)*100
                        for xr in xrange(0, len(rds)): rds[xr] = (rds[xr]-1)*100
                        ru.Scale(100.0)
                        rd.Scale(100.0)
                        fu = TF1("fu", "[0]")
                        fd = TF1("fd", "[0]")
                        #fu = TF1("fu", str((min(rus)+max(rus))/2.))
                        #fd = TF1("fd", str((min(rds)+max(rds))/2.))
                        fu.SetLineColor(kRed)
                        fd.SetLineColor(kBlue)
                        fu.SetLineWidth(3)
                        fd.SetLineWidth(3)
                        #ru.Fit("fu", "", "", -1., 1.)
                        #rd.Fit("fd", "", "", -1., 1.)
                        #print fu.GetParameter(0), (ru.GetBinContent(ru.GetMinimumBin())+ru.GetBinContent(ru.GetMaximumBin()))/2.
                        #print fd.GetParameter(0), (rd.GetBinContent(rd.GetMinimumBin())+rd.GetBinContent(rd.GetMaximumBin()))/2.

        #......

                        print fu.GetParameter(0), (min(rus)+max(rus))/2.
                        print fd.GetParameter(0), (min(rds)+max(rds))/2.
                        if False:
                            Hsu[k][s].Fill((min(rus)+max(rus))/2.)
                            Hsd[k][s].Fill((min(rds)+max(rds))/2.)
                        #fu.SetParameter(0, (ru.GetBinContent(ru.GetMinimumBin())+ru.GetBinContent(ru.GetMaximumBin()))/2.)
                        #fd.SetParameter(0, (rd.GetBinContent(rd.GetMinimumBin())+rd.GetBinContent(rd.GetMaximumBin()))/2.)
                        fu.SetParameter(0, (min(rus)+max(rus))/2.)
                        fd.SetParameter(0, (min(rds)+max(rds))/2.)
                        fu.SetRange(-1., 1.)
                        fd.SetRange(-1., 1.)
                        ru.SetLineColor(kRed)
                        rd.SetLineColor(kBlue)
                        ms.append(ru.GetBinContent(ru.GetMaximumBin()))
                        ms.append(rd.GetBinContent(rd.GetMaximumBin()))
                        leg.AddEntry(ru, hs[hnu].GetName()+'/'+ru.GetName(), 'l')
                        leg.AddEntry(rd, hs[hnd].GetName()+'/'+rd.GetName(), 'l')
                        cs.append(TCanvas())
                        if True:
                            #ru.SetMaximum(max(ms)*more2)
                            #rd.SetMaximum(max(ms)*more2)
                            ru.SetMinimum(-50)
                            rd.SetMinimum(-50)
                            ru.SetMaximum(+50)
                            rd.SetMaximum(+50)
                        ru.Draw()
                        rd.Draw("SAME")
                        fu.Draw("SAME")
                        fd.Draw("SAME")
                        tu = TPaveLabel(0, 10, 0.2, 20, "%.2f%%" % fu.GetParameter(0))
                        tu.SetFillStyle(kRed)
                        tu.SetBorderSize(0)
                        tu.Draw("SAME")
                        td = TPaveLabel(0, -10, -0.2, -20, "%.2f%%" % fd.GetParameter(0))
                        td.SetFillStyle(kBlue)
                        td.SetBorderSize(0)
                        td.Draw("SAME")
                        leg.Draw()
                        cs[-1].SetTitle(hn)
                        cs[-1].Print(output2+hn+'_'+s+'.png')
                        #sys.exit()

if False:
    gStyle.SetOptStat(1)
    gROOT.ForceStyle()

    fo = TFile.Open('Hs.root', 'RECREATE')
    for k in ['u', 'c']:
        for s in ['SfIteraviveFitLf', 'SfIteraviveFitHf', 'SfIteraviveFitLfstats1', 'SfIteraviveFitLfstats2', 'SfIteraviveFitHfstats1', 'SfIteraviveFitHfstats2', 'SfIteraviveFitCferr1', 'SfIteraviveFitCferr2', 'SfPileup', 'SfLepton', 'SfTopPt', 'Jes', 'Jer']:
            Hsu[k][s].Write()
            Hsd[k][s].Write()
    fo.Close()

