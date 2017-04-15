from ROOT import *
import sys

gStyle.SetOptStat(0)
gROOT.SetBatch(True)

fs = []
cs = []
hs = {}
hss = []
hfin = None
hd = None

categories = ["b2j3", "b3j3", "b2j4", "b3j4", "b4j4"]
hnames = ['TotalBkg', 'TotalSig', 'data_obs']
hcolors = [ kBlue, kRed, kBlack ]


for hyp in ['u', 'c']:
    for cat in categories:
        if hyp == 'c' and cat == 'b3j3': continue
        #fs.append(TFile.Open('MVAH'+hyp+'t_ALL_h'+hyp+'t/MVAH'+hyp+'t_ALL_h'+hyp+'t_shapes_postfit.root'))
        fs.append(TFile.Open('MVAH'+hyp+'t_'+cat+'_h'+hyp+'t/MVAH'+hyp+'t_'+cat+'_h'+hyp+'t_shapes_postfit.root'))
        for p in ['prefit', 'postfit']:
            fs[-1].cd(cat+'_'+p)
            #fs[-1].ls()
            #cs.append(TCanvas())
            leg = TLegend(0.1, 0.7, 0.3, 0.9)
            hss.append(THStack("hs_H"+hyp+"t_"+p, ""))
            #for hi, h in enumerate(['TotalBkg', 'TotalProcs', 'TotalSig', 'data_obs', 'other', 'sig', 'ttbb', 'ttcc', 'ttlf']):
            #for hi, h in enumerate(['TotalBkg', 'TotalSig', 'data_obs']):
            for hi, h in enumerate(hnames):
                #hs[h] = fs[-1].Get(h)
                hs[h] = fs[-1].Get(cat+'_'+p+'/'+h)
                #hs[h].Sumw2()
                #hs[h].SetLineColor(hi+1)
                hs[h].SetFillColor(hcolors[hi])
                hs[h].SetTitle(h)
                #hs[h].SetMaximum(1.5*hs[h].GetMaximum())
                if h == 'data_obs':
                    hd = hs[h].Clone()
                    hd.SetMarkerStyle(20)
                    leg.AddEntry(hd, h, "p")
                else:
                    hss[-1].Add(hs[h])
                    leg.AddEntry(hs[h], h, "f")
                    if hi > 0:
                        hs[h].SetTitle(h)
                        hs[h].Draw("SAME")
                        hfin.Add(hs[h])
                    else:
                        #hs[h].SetTitle(p+' stack for '+"H"+hyp+'t')
                        #hs[h].Draw()
                        hfin = hs[h].Clone()
                    #hfin.Sumw2()
            #cs[-1].SetTitle(p+' stack for '+"H"+hyp+'t')
            #cs[-1].Print("H"+hyp+'t_'+p+'.png')
            cs.append(TCanvas())
            hss[-1].Draw("HIST")
            hss[-1].SetMaximum(hfin.GetMaximum()*1.2)
            hfin.SetFillStyle(3002)
            hfin.Draw("E2 SAME")
            hd.Draw("P SAME")
            leg.Draw()
            cs[-1].Print("hs_H"+hyp+'t_'+cat+'_'+p+'.png')

