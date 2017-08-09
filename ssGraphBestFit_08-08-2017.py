from ROOT import *
from array import array
import sys

output = '~/www/12-05-2017/ss/'
output = '~/www/12-05-2017/ss1/'
output = '~/www/13-05-2017/best_fit/'
output = '~/www/15-05-2017/best_fit/'
output = '~/www/22-05-2017/best_fit/'
output = '~/www/25-05-2017/best_fit/'
output = '~/www/14-06-2017/best_fit/'
output = '~/www/15-06-2017/best_fit/'
output = '~/www/01-07-2017/best_fit/'
output = '~/www/07-08-2017/best_fit/'
output = '~/www/07-08-2017/best_fit_pn/'
output = '~/www/08-08-2017/best_fit_pn/'
output = '~/www/08-08-2017/best_fit/'
output = '~/www/09-08-2017/best_fit/'

gROOT.SetBatch(True)

gROOT.ProcessLine(".L plotStyle.C")

SetPlotStyle()

gStyle.SetPalette(1)


from bestFits import *

#xminshift = [3, 1, 3, 2, 3, 0]
#xmaxshift = [1, 2, 2, 2, 1, 2]

#xminshift = [1, 1, 1, 1, 1, 1]
#xmaxshift = [1, 1, 1, 1, 1, 1]

#xminshift = [-6, 1, 1, 1, 1, 1]
#xmaxshift = [ 1, 1, 1, 1, 1, 1]

#xminshift = [ 2, 3, 1, 4, 1, 1]
#xmaxshift = [ 2, 6, 4, 9, 4, 3]

#xminshift = [ 0, 3, 1, 4, 1, 1]
#xmaxshift = [ 4, 6, 4, 9, 4, 3]

#xminshift = [ 1, 5, 2, 5, 3, 3 ]
#xmaxshift = [ 1, 4, 3, 9, 1, 1 ]

#xminshift = [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
#xmaxshift = [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]

xminshift = []
xmaxshift = []
for t in titles:
    xminshift.append(1)
    xmaxshift.append(1)

#xminshift = [ 1, 1, 1, 1, 1, 1 ]
#xmaxshift = [ 1, 1, 1, 1, 4, 1 ]

#xminshift = [ 1, 5, 2, 5, 3, 3 ]
#xmaxshift = [ 1, 4, 3, 9, 1, 1 ]

cs = []
gs = []
N = []
X = []
Y = []
Exl = []
Exh = []
Eyl = []
Eyh = []
cls = []
bxs = []

for ti, t in enumerate(T):
    N.append(len(t)-1)

    X.append(array('d', [t[j][0] for j in xrange(0, N[-1])]))
    Y.append(array('d', [i-1 for i in xrange(N[-1], 0, -1)]))
    Exl.append(array('d', [abs(i) for i in [t[j][1] for j in xrange(0, N[-1])]]))
    Exh.append(array('d', [abs(i) for i in [t[j][2] for j in xrange(0, N[-1])]]))
    Eyl.append(array('d', [0.0 for j in xrange(0, N[-1])]))
    Eyh.append(array('d', [0.0 for j in xrange(0, N[-1])]))
    gs.append(TGraphAsymmErrors(N[-1], X[-1], Y[-1], Exl[-1], Exh[-1], Eyl[-1], Eyh[-1]))
    gs[-1].SetName(titles[ti])
    gs[-1].SetTitle(titles[ti])
    gs[-1].SetMarkerStyle(21)
    gs[-1].SetLineColor(kRed)
    gs[-1].SetLineWidth(3)
    gs[-1].GetYaxis().SetLabelOffset(1)
    cs.append(TCanvas(titles[ti]))
    cs[-1].SetLeftMargin(0.31)
    gs[-1].Draw("APZ")
    gs[-1].SetMaximum(N[-1]-0.5)
    gs[-1].SetMinimum(-0.5)
    gs[-1].GetXaxis().SetTitle("#mu")
    gxrange = gs[-1].GetXaxis().GetXmax()-gs[-1].GetXaxis().GetXmin()
    gxradd = 0.1*gxrange
    gs[-1].GetXaxis().SetLimits(gs[-1].GetXaxis().GetXmin()-xminshift[ti]*gxradd, gs[-1].GetXaxis().GetXmax()+xmaxshift[ti]*gxradd)
    if t[-1][0]+t[-1][1] > gs[-1].GetXaxis().GetXmin() and t[-1][0]+t[-1][2] < gs[-1].GetXaxis().GetXmax():
        bxs.append(TBox(t[-1][0]+t[-1][1], Y[-1][0]+0.5, t[-1][0]+t[-1][2], Y[-1][-1]-0.5))
    elif t[-1][0]+t[-1][1] <= gs[-1].GetXaxis().GetXmin():
        bxs.append(TBox(gs[-1].GetXaxis().GetXmin(), Y[-1][0]+0.5, t[-1][0]+t[-1][2], Y[-1][-1]-0.5))
    elif t[-1][0]+t[-1][2] >= gs[-1].GetXaxis().GetXmax():
        bxs.append(TBox(t[-1][0]+t[-1][1], Y[-1][0]+0.5, gs[-1].GetXaxis().GetXmax(), Y[-1][-1]-0.5))
    bxs[-1].SetFillColor(kAzure-9)
    #bxs[-1].SetFillStyle(3004)
    bxs[-1].Draw()
    cls.append(TLine(t[-1][0], Y[-1][0]+0.5, t[-1][0], Y[-1][-1]-0.5))
    cls[-1].SetLineColor(kBlue)
    cls[-1].SetLineWidth(3)
    cls[-1].Draw("SAME")
    gs[-1].Draw("PZ SAME")
    tx = TText()
    tx.SetTextAlign(32)
    tx.SetTextSize(gs[-1].GetXaxis().GetLabelSize())
    tx.SetTextFont(gs[-1].GetXaxis().GetLabelFont())
    tmx = TMathText()
    tmx.SetTextAlign(32)
    tmx.SetTextSize(gs[-1].GetXaxis().GetLabelSize())
    tmx.SetTextFont(gs[-1].GetXaxis().GetLabelFont())
    #ylabels = ["b2j3","b3j3","b2j4","b3j4","b4j4","comb"]
    ylabels = ["b2j3","b2j4","b3j3","b3j4","b4j4","comb"]
    #xposition = gs[-1].GetXaxis().GetBinLowEdge(1)-(gs[-1].GetXaxis().GetBinLowEdge(1)+gs[-1].GetXaxis().GetBinUpEdge(gs[-1].GetXaxis().GetNbins()+1))/20
    xposition = gs[-1].GetXaxis().GetXmin()-(gs[-1].GetXaxis().GetXmax()+gs[-1].GetXaxis().GetXmax())/100
    #xposition = gs[-1].GetXaxis().GetBinLowEdge(1)-gs[-1].GetXaxis().GetBinCenter(1)
    for i in xrange(0, len(t)-1):
        #ytexl = TLatex(xposition, Y[-1][i], ylabels[i]+" #mu_{comb.} = %.3f_{%+.3f}^{%+.3f}" % (t[i][0], t[i][1], t[i][2]))
        #ytexl.Draw()
#        tx.DrawText(xposition, Y[-1][i], ylabels[i]+"                          ")
#        tmx.DrawMathText(xposition+0.03, Y[-1][i], "\mu = %.2f_{%+.2f}^{%+.2f}" % (t[i][0], t[i][1], t[i][2]))
#        tx.DrawText(xposition, Y[-1][i], ylabels[i])
#       tmx.DrawMathText(xposition, Y[-1][i], ylabels[i]+"\ \mu = %.2f_{%+.2f}^{%+.2f}" % (t[i][0], t[i][1], t[i][2]))
       tmx.DrawMathText(xposition, Y[-1][i], "\mu_{"+ylabels[i]+"} = %.2f_{%+.2f}^{%+.2f}" % (t[i][0], t[i][1], t[i][2]))
    #leg = TLegend(0.75,0.90,0.90,0.70)
    #leg = TLegend(0.70,0.70,0.95,0.40)
    leg = TLegend(0.70,0.45,0.95,0.15)
    leg.SetFillStyle(0)
    leg.SetBorderSize(0)
    #leg.AddEntry(line[0],"Expected","l")
    leg.AddEntry(gs[-1], "#mu_{category}", "pl")
    gtmp = TGraph()
    gtmp.SetLineColor(kBlue)
    gtmp.SetLineWidth(3)
    gtmp.SetFillColor(kAzure-9)
    #leg.AddEntry(cls[-1], "#mu_{comb.} = %.3f_{%+.3f}^{%+.3f}" % (t[-1][0], t[-1][1], t[-1][2]), "fl")
    leg.AddEntry(gtmp, "#mu_{comb.} = %.2f_{%+.2f}^{%+.2f}" % (t[-1][0], t[-1][1], t[-1][2]), "fl")
    #c1.RedrawAxis("g");
    leg.Draw()
    #tex = TLatex(0.1969, 0.906825, "CMS")
    tex = TLatex(0.34, 0.906825, "CMS")
    #tex = TLatex(0.7969, 0.906825, "CMS")
    tex.SetNDC()
    tex.SetTextAlign(13)
    tex.SetTextFont(61)
    tex.SetTextSize(0.07475)
    tex.SetLineWidth(2)
    tex.Draw()
    #text1 = TLatex(0.98, 0.95125, "36 fb^{-1}, #sqrt{s} = 13 TeV")
    text1 = TLatex(0.98, 0.95125, "36 fb^{-1} (13 TeV)")
    text1.SetNDC()
    text1.SetTextAlign(31)
    text1.SetTextFont(42)
    text1.SetTextSize(0.04875)
    text1.SetLineWidth(2)
    text1.Draw()
    #ctex = TLatex(0.50, 0.87, titles[ti])
    ctex = TLatex(0.87, 0.906825, "Hut" if "hut" in titles[ti] else "Hct")
    ctex.SetNDC()
    ctex.SetTextAlign(13)
    ctex.SetTextFont(61)
    ctex.SetTextSize(0.07475)
    ctex.SetLineWidth(2)
    ctex.Draw()
    cs[-1].RedrawAxis()
    cs[-1].Print(output+cs[-1].GetName()+'.png')
    cs[-1].Print(output+cs[-1].GetName()+'.pdf')
    cs[-1].Print(output+cs[-1].GetName()+'.eps')

