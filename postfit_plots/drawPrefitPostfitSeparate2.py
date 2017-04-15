from ROOT import *
import sys

gStyle.SetOptStat(0)
gROOT.SetBatch(True)

#categories = ["b2j3", "b3j3", "b2j4", "b3j4", "b4j4"]
#hypotheses = ['u', 'c']

output = sys.argv[1]
hypotheses = [sys.argv[2]]
categories = [sys.argv[3]]
iteration = sys.argv[4]
mass = sys.argv[5]


cols = []
cmax = float(256)
#for ci, (r, g, b) in enumerate([
#    (24, 54, 99),     # 1000 tt+bb
#    (47, 153, 205),   # 1001 tt+cc
#    (70, 144, 206),   # 1002 tt+lf
#    (105, 189, 69),   # 1003 Single top
#    (247, 143, 30),   # 1004 Z+jets
#    (200, 120, 178),  # 1005 W+jets
#    (203, 31, 38),    # 1006 FCNC kHut
#    (203, 205, 44),   # 1007 FCNC kHct
#    (242, 100, 102),  # 1008 FCNC kHut (ttbar)
#    (246, 240, 105),  # 1009 FCNC kHct (ttbar)
#    (184, 151, 92),   # 1010 bavg
#    (223, 66, 70),    # 1011 savg1 kHut
#    (225, 223, 75),   # 1012 savg2 kHct
#]):
#for ci, (r, g, b) in enumerate([
#    (0, 51, 102),     # 1000 tt+bb
#    (51, 153, 204),   # 1001 tt+cc
#    (0, 153, 255),    # 1002 tt+lf
#    (0, 255, 0),      # 1003 Single top
#    (255, 143, 0),    # 1004 Z+jets
#    (255, 102, 255),  # 1005 W+jets
#    (204, 0, 0),      # 1006 FCNC kHut
#    (204, 204, 0),    # 1007 FCNC kHct
#    (255, 102, 102),  # 1008 FCNC kHut (ttbar)
#    (255, 255, 102),  # 1009 FCNC kHct (ttbar)
#    (94, 143, 136),   # 1010 bavg
#    (230, 51, 51),    # 1011 savg1 kHut
#    (230, 230, 51),   # 1012 savg2 kHct
#]):
for ci, (r, g, b) in enumerate([
    (0, 51, 102),     # 1000 tt+bb
    (51, 153, 204),   # 1001 tt+cc
    (0, 153, 255),    # 1002 tt+lf
    (0, 255, 0),      # 1003 Single top
    (255, 143, 0),    # 1004 Z+jets
    (255, 102, 255),  # 1005 W+jets
    (204, 0, 0),      # 1006 FCNC kHut
    (204, 204, 0),    # 1007 FCNC kHct
    (255, 102, 102),  # 1008 FCNC kHut (ttbar)
    (255, 255, 102),  # 1009 FCNC kHct (ttbar)
    (94, 143, 136),   # 1010 other
    (51, 119, 187),   # 1011 tt+bb, tt+cc, tt+lf
    (229, 102, 102),  # 1012 FCNC kHut sig
    (229, 229, 102),  # 1012 FCNC kHct sig
]):
    cols.append(TColor(1000+ci, r/cmax, g/cmax, b/cmax))

#for CASE in [ '_TOGETHER', '_SIGBKG', '_SEPARATE']:
for CASE in ['_SEPARATE']:

    fs = []
    cs = []
    hs = {}
    hss = []
    hfin = None
    hd = None

    hnames = None
    hcolors = None

    for hyp in hypotheses:

        if CASE == '_TOGETHER':
            hnames = ['TotalProcs', 'data_obs']
            hcolors = [ kGreen, kBlack ]
        if CASE == '_SIGBKG':
            hnames = ['TotalBkg', 'TotalSig', 'data_obs']
            hcolors = [ kBlue, kRed, kBlack ]
        elif CASE == '_SEPARATE':
            #hnames = ['ttbb', 'ttcc', 'ttlf', 'other', 'sig', 'data_obs']
            #hnames = ['ttbb', 'ttcc', 'ttlf', 'stop', 'zjets', 'wjets', 'other', 'sig_stop', 'sig_ttbar', 'data_obs']
            hnames = ['ttbb', 'ttcc', 'ttlf', 'other', 'sig_stop', 'sig_ttbar', 'data_obs']
            #hnames = ['ttbbttccttlf', 'other', 'sig_stop', 'sig_ttbar', 'data_obs']
#            hnames = ['ttbbttccttlf', 'other', 'sig', 'data_obs']
            if hyp == 'u':
                #hcolors = [ 1000, 1001, 1002, 1003, 1006, kBlack ]
                #hcolors = [ 1000, 1001, 1002, 1010, 1011, kBlack ]
                #hcolors = [ 1000, 1001, 1002, 1003, 1004, 1005, 1010, 1006, 1008, kBlack ]
                hcolors = [ 1000, 1001, 1002, 1010, 1006, 1008, kBlack ]
                #hcolors = [ 1011, 1010, 1006, 1008, kBlack ]
#                hcolors = [ 1011, 1010, 1012, kBlack ]
            elif hyp == 'c':
                #hcolors = [ 1000, 1001, 1002, 1003, 1007, kBlack ]
                #hcolors = [ 1000, 1001, 1002, 1010, 1012, kBlack ]
                #hcolors = [ 1000, 1001, 1002, 1003, 1004, 1005, 1010, 1007, 1009, kBlack ]
                hcolors = [ 1000, 1001, 1002, 1010, 1007, 1009, kBlack ]
                #hcolors = [ 1011, 1010, 1007, 1009, kBlack ]
#                hcolors = [ 1011, 1010, 1013, kBlack ]

        for cat in categories:
            #if hyp == 'c' and cat == 'b3j3': continue
#            fs.append(TFile.Open('MVAH'+hyp+'t_'+cat+'_h'+hyp+'t/MVAH'+hyp+'t_'+cat+'_h'+hyp+'t_shapes_postfit.root'))
#            fs.append(TFile.Open('MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t/MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_shapes_postfit.root'))
#            fs.append(TFile.Open('MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_'+iteration+'/MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_shapes_postfit.root'))
#            fs.append(TFile.Open('MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_shapes_postfit.root'))
            print 'MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_'+iteration+'_'+mass+'/'+'MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_shapes_postfit.root'
            fs.append(TFile.Open('MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_'+iteration+'_'+mass+'/'+'MVAH'+hyp+'tMAX_'+cat+'_h'+hyp+'t_shapes_postfit.root'))
            if not fs[-1]: continue
            for p in ['prefit', 'postfit']:
            #for p in ['prefit']:
                fs[-1].cd(cat+'_'+p)
                #fs[-1].ls()
                #cs.append(TCanvas())
                leg = TLegend(0.1, 0.6, 0.3, 0.9)
                hss.append(THStack("hs_H"+hyp+"t_"+p, ""))
                #for hi, h in enumerate(['TotalBkg', 'TotalProcs', 'TotalSig', 'data_obs', 'other', 'sig', 'ttbb', 'ttcc', 'ttlf']):
                #for hi, h in enumerate(['TotalBkg', 'TotalSig', 'data_obs']):
                for hi, h in enumerate(hnames):
                    #hs[h] = fs[-1].Get(h)
                    print cat+'_'+p+'/'+h
                    hs[h] = fs[-1].Get(cat+'_'+p+'/'+h)
                    hs[h].Sumw2()
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
#                hss[-1].GetXaxis().SetTitle('MVAH'+hyp+'t_'+cat)
                hss[-1].GetXaxis().SetTitle('MVAH'+hyp+'tMAX_'+cat)
                hss[-1].GetYaxis().SetTitle('Events')
                hss[-1].GetYaxis().SetTitleOffset(1.3*hss[-1].GetYaxis().GetTitleOffset())
                hss[-1].SetMaximum(hfin.GetMaximum()*1.2)
                hfin.SetFillStyle(3002)
                hfin.SetFillColor(kBlack)
                for b in xrange(0,hfin.GetXaxis().GetNbins()):
                    print "name:", "H"+hyp+'t_'+cat+'_'+p, "bin:", b+1, "error:", hfin.GetBinError(b+1)
                hfin.Draw("E2 SAME")
                hd.Draw("P SAME")
                leg.Draw()
                cs[-1].Print(output+'/'+iteration+'/'+mass+'/'+"hs_H"+hyp+'t_'+cat+'_'+p+CASE+'.png')
                cs[-1].Print(output+'/'+iteration+'/'+mass+'/'+"hs_H"+hyp+'t_'+cat+'_'+p+CASE+'.pdf')

