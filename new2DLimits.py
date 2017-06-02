from ROOT import *
import sys

gROOT.SetBatch(True)
gROOT.ProcessLine(".L plotStyle.C")

SetPlotStyle()

output = "~/www/26-05-2017/new/"

#kappa = [
#    [2.182,     2.032],
#    #[0.0,     0.0],
#    [1.667,     1.527],
#    #[0.0,     0.0],
#    [1.216,     1.101],
#    #[0.0,     0.0],
#    [0.8858,    0.8009],
#    #[0.0,     0.0],
#    [0.6673,    0.6023],
#    #[0.0,     0.0],
#    [1.831,     1.35],
#    #[0.0,     0.0],
#]

kappa = [
    [0.2072,      0.2286],
    [0.1811,      0.1982],
    [0.1547,      0.1683],
    [0.132,       0.1435],
    [0.1146,      0.1245],
    [0.1898,      0.1863],
]

#br = []

BR = [
    [0.005631,    0.006854],
    [0.004301,    0.00515],
    [0.003138,    0.003714],
    [0.002286,    0.002702],
    [0.001722,    0.002031],
    [0.004724,    0.004552],
]

cs = []
Fs = []
#temp = []

for ci in xrange(0, 2):

    #if ci == 0:
    #if True:
    if False:
        for i in xrange(0, 6):
            kappa[i][0] /= 50.82/10
            kappa[i][1] /= 38.88/10

    #for i in xrange(0, len(kappa)):
    #    br.append([0.1836*kappa[i][0]**2/1.4, 0.1836*kappa[i][1]**2/1.4])

    cs.append(TCanvas())

    #if ci == 1:
    if True:
    #    cs[-1].SetRightMargin(cs[-1].GetRightMargin()*4)
        cs[-1].SetRightMargin(cs[-1].GetRightMargin()*1.5)

    fs = []

    for i in xrange(0, 6):
        if ci == 0:
            #fs.append(TF1("f"+str(ci)+str(i), "[1]*sqrt(1-(x/[0])**2)", 0.0, 0.5))
            #fs.append(TF1("f"+str(ci)+str(i), "[1]*sqrt(1-(x/[0])**2)", 0.0, 2.6))
            fs.append(TF1("f"+str(ci)+str(i), "[1]*sqrt(1-(x/[0])**2)", 0.0, 0.26))
        elif ci == 1:
            #fs.append(TF1("f"+str(ci)+str(i), "(1-x/100*1.4/0.1836/[1]**2)/1.4*0.1836*[0]**2*100", 0.0, 0.15))
            #fs.append(TF1("f"+str(ci)+str(i), "sqrt(1.4*[1]/0.1836)**2 * (1 - (1.4*x/0.1836)**2/(1.4*[0]/0.1836)**2)/1.4*0.1836", 0.0, 0.15))
            #fs.append(TF1("f"+str(ci)+str(i), "sqrt(1.4*[1]/0.1836)**2 * (1 - (1.4*x/0.1836)**2/(1.4*[0]/0.1836)**2)/1.4*0.1836", 0.0, 0.1))
            #fs.append(TF1("f"+str(ci)+str(i), "sqrt((1.4*[1]/0.1836)*(1-x**2/(1.4*[0]/0.1836)))", 0.0, 0.5))
            #fs.append(TF1("f"+str(ci)+str(i), "sqrt((1.4*[1]/0.1836)*(1-x**2/(1.4*[0]/0.1836)))", 0.0, 0.5))
            #fs.append(TF1("f"+str(ci)+str(i), "(1-(x/100*1.4/0.1836)/[0]**2)/(1.4/0.1836/[1]**2)*100", 0.0, 3.0))
            #fs.append(TF1("f"+str(ci)+str(i), "(1-(x/100*1.4/0.1836)/[0]**2)/(1.4/0.1836/[1]**2)*100", 0.0, 0.1))
            #fs.append(TF1("f"+str(ci)+str(i), "(1-(x/100*1.4/0.1836)/[0]**2)/(1.4/0.1836/[1]**2)*100", 0.0, 2.0))
            #fs.append(TF1("f"+str(ci)+str(i), "(1-(x/100*1.4/0.1836)/[0]**2)/(1.4/0.1836/[1]**2)*100", 0.0, 2.5))
            fs.append(TF1("f"+str(ci)+str(i), "[1]*(1-x/100/[0])*100", 0.0, 0.6))

        if ci == 0:
        #if True:
            fs[-1].SetParameters(kappa[i][0], kappa[i][1])
            fs[-1].SetParameters(kappa[i][0], kappa[i][1])
        elif ci == 1:
        #    fs[-1].SetParameters(br[i][0], br[i][1])
        #    fs[-1].SetParameters(br[i][0], br[i][1])
            fs[-1].SetParameters(BR[i][0], BR[i][1])
            fs[-1].SetParameters(BR[i][0], BR[i][1])

        fs[-1].SetLineWidth(3)
        if i == 1 or i == 3:
            fs[-1].SetLineStyle(2)
        if i == 0 or i == 4:
            fs[-1].SetLineStyle(3)
        if i == 5:
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

    for i in xrange(0, 6):
        if fs[i].GetMinimum() < minimum:
            minimum = fs[i].GetMinimum()
        if fs[i].GetMaximum() > maximum:
            maximum = fs[i].GetMaximum()

    #maximum = 1.2*maximum
    maximum = 1.3*maximum
    if (minimum < 0):
        minimum = 0
    #maximum = 1.0

    for i in xrange(0, 6):
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
        leg.AddEntry(fs[2],"Expected","l")
        leg.AddEntry(fs[1],"Expected #pm 1#sigma","l")
        leg.AddEntry(fs[0],"Expected #pm 2#sigma","l")
        leg.AddEntry(fs[5],"Observed","l")
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
        cs[-1].Print(output+"2DCouplingLimits.pdf")
        cs[-1].Print(output+"2DCouplingLimits.eps")
    elif ci == 1:
        cs[-1].Print(output+"2DBRLimits.png")
        cs[-1].Print(output+"2DBRLimits.pdf")
        cs[-1].Print(output+"2DBRLimits.eps")

    Fs.append(fs)

