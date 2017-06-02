from ROOT import *
import sys

gROOT.SetBatch(True)
gROOT.ProcessLine(".L plotStyle.C")

SetPlotStyle()

output = "~/www/26-05-2017/new/"

kappa = [
    [1.667,     1.527],
    #[0.0,     0.0],
    [1.216,     1.101],
    #[0.0,     0.0],
    [0.8858,    0.8009],
    #[0.0,     0.0],
    [1.831,     1.35],
    #[0.0,     0.0],
]

cs = []
Fs = []
#temp = []

for ci in xrange(0, 2):

    #if ci == 0:
    if True:
    #if False:
        for i in xrange(0, 4):
            kappa[i][0] /= 50.82/10
            kappa[i][1] /= 38.88/10

    cs.append(TCanvas())

    #if ci == 1:
    if True:
    #    cs[-1].SetRightMargin(cs[-1].GetRightMargin()*4)
        cs[-1].SetRightMargin(cs[-1].GetRightMargin()*1.5)

    fs = []

    for i in xrange(0, 4):
        if ci == 0:
            #fs.append(TF1("f"+str(ci)+str(i), "[0]*sqrt(1-(x/[1])**2)", 0.0, 0.5))
            fs.append(TF1("f"+str(ci)+str(i), "[1]*sqrt(1-(x/[0])**2)", 0.0, 0.5))
            #fs.append(TF1("f"+str(ci)+str(i), "[1]*sqrt(1-(x/[0])**2)", 0.0, 2.5))
        elif ci == 1:
            #fs.append(TF1("f"+str(ci)+str(i), "(0.1836*([0]**2)/1.4)*sqrt(1-((0.1836*((x/[1])**2)/1.4))**2))", 0.0, 2))
            #fs.append(TF1("f"+str(ci)+str(i), "1.4*[0]/0.1836*(1-1.4*(x/[1])/0.1836)", 0.0, 0.1))
            #fs.append(TF1("f"+str(ci)+str(i), "1.4*[0]/0.1836*(1-1.4*(x/[1])/0.1836)", 0.0, 0.06))
            #fs.append(TF1("f"+str(ci)+str(i), "1/(1.4*[0]/0.1836*(1-1.4*(x/[1])/0.1836))", 0.0, 0.06))
            #fs.append(TF1("f"+str(ci)+str(i), "1.4*[0]/0.1836*(1-1.4*(x/[1])/0.1836)", 0.0, 0.06))
            #fs.append(TF1("f"+str(ci)+str(i), "1.4*[0]/0.1836*(1-1.4*(x/[1])/0.1836)", 0.0, 0.06))
            #fs.append(TF1("f"+str(ci)+str(i), "0.1836/1.4*[0]*sqrt(1-(1.4*x/0.1836)/[1]**2)", 0.0, 0.06))
            #fs.append(TF1("f"+str(ci)+str(i), "(1-(1.4*x/0.1836)/[1]**2)/(1.4/0.1836/[0]**2)", 0.0, 0.0005))
            #fs.append(TF1("f"+str(ci)+str(i), "(1-x*1.4/0.1836/[1]**2)/1.4*0.1836*[0]**2", 0.0, 0.0005))
            #fs.append(TF1("f"+str(ci)+str(i), "(1-x/100*1.4/0.1836/[1]**2)/1.4*0.1836*[0]**2*100", 0.0, 0.05))
            fs.append(TF1("f"+str(ci)+str(i), "(1-x/100*1.4/0.1836/[1]**2)/1.4*0.1836*[0]**2*100", 0.0, 0.15))
            #fs.append(TF1("f"+str(ci)+str(i), "0.1836/1.4/(1-1.4*(x/[1])/0.1836)", 0.0, 0.06))
        fs[-1].SetParameters(kappa[i][0], kappa[i][1])
        fs[-1].SetParameters(kappa[i][0], kappa[i][1])
        if i == 0 or i == 2:
            fs[-1].SetLineStyle(2)
        if i == 3:
            fs[-1].SetLineColor(2)
        else:
            fs[-1].SetLineColor(1)
        if i == 0:
            #temp.append(fs[-1].Draw("l"))
            fs[-1].Draw("l")
        else:
            #temp.append(fs[-1].Draw("lsame"))
            fs[-1].Draw("lsame")

    minimum = 100
    maximum = 0

    for i in xrange(0, 4):
        if fs[i].GetMinimum() < minimum:
            minimum = fs[i].GetMinimum()
        if fs[i].GetMaximum() > maximum:
            maximum = fs[i].GetMaximum()

    maximum = 1.2*maximum
    if (minimum < 0):
        minimum = 0
    #maximum = 1.0

    for i in xrange(0, 4):
        fs[i].SetMinimum(minimum)
        fs[i].SetMaximum(maximum)
        
        if ci == 0:
            fs[i].GetXaxis().SetTitle("#kappa_{Hut}")
            fs[i].GetYaxis().SetTitle("#kappa_{Hct}")
        elif ci == 1:
            #fs[i].GetXaxis().SetNdivisions(505)
            fs[i].GetXaxis().SetTitle("BR_{Hut} [%]")
            fs[i].GetYaxis().SetTitle("BR_{Hct} [%]")

    #if ci == 0:
    if True:
        leg = TLegend(0.60,0.90,0.95,0.60)
    #elif ci == 1:
    #    leg = TLegend(0.60,0.90,0.90,0.60)
    leg.SetFillStyle(0)
    leg.SetBorderSize(0)

    #if ci == 0:
    if True:
        leg.AddEntry(fs[1],"Median expected limit = 1.0","l")
        leg.AddEntry(fs[0],"#pm 1#sigma expected limit = 1.0","l")
        leg.AddEntry(fs[3],"Observed limit = 1.0","l")
        leg.Draw()
    #elif ci == 1:
    #    leg.AddEntry(fs[1],"Median expected = 1.0","l")
    #    leg.AddEntry(fs[0],"#pm 1#sigma expected = 1.0","l")
    #    leg.AddEntry(fs[3],"Observed = 1.0","l")
    #    leg.Draw()

    tex = TLatex(0.1969,0.906825,"CMS")
    tex.SetNDC()
    tex.SetTextAlign(13)
    tex.SetTextFont(61)
    tex.SetTextSize(0.07475)
    tex.SetLineWidth(2)
    tex.Draw()

    text1 = TLatex(0.98,0.95125,"36 fb^{-1} (13 TeV)")
    text1.SetNDC()
    text1.SetTextAlign(31)
    text1.SetTextFont(42)
    text1.SetTextSize(0.04875)
    text1.SetLineWidth(2)
    text1.Draw()

    if ci == 0:
        cs[-1].Print(output+"2DCouplingLimits.png")
    elif ci == 1:
        cs[-1].Print(output+"2DBRLimits.png")

    Fs.append(fs)

