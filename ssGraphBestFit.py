from ROOT import *
from array import array
import sys

output = '~/www/12-05-2017/ss/'
output = '~/www/12-05-2017/ss1/'
output = '~/www/13-05-2017/best_fit/'
output = '~/www/15-05-2017/best_fit/'
output = '~/www/22-05-2017/best_fit/'
output = '~/www/25-05-2017/best_fit/'

gROOT.SetBatch(True)

gROOT.ProcessLine(".L plotStyle.C")

SetPlotStyle()

gStyle.SetPalette(1)


titles = []
T = []

'''
titles.append("hut")
T.append([
[0.621095, -0.621095, +0.605227      ],
[0.0007152, -0.0007152, +0.199816    ],
[0.194068, -0.194068, +0.217601      ],
[0.308442, -0.308442, +0.307779      ],
[0.0601244, -0.0601244, +0.103599    ],
])

titles.append("hct")
T.append([
[4.89504e-06, -4.89504e-06, +0.357025],
[0.347723, -0.347723, +0.68298       ],
[0.000114605, -0.000114605, +0.257203],
[0.395406, -0.946429, +0.595137      ],
[0.392753, -0.392753, +0.141013      ],
[0.234508, -0.125425, +0.12367       ],
])

titles.append("ST_hut")
T.append([
[0.932504, -0.932504, +0.885454      ],
[7.31831e-06, -7.31831e-06, +0.617062],
[0.509319, -0.446479, +0.441456      ],
[1.13368, -1.13368, +0.78448         ],
[0.364736, -0.225711, +0.229069      ],
])

titles.append("ST_hct")
T.append([
[1.8397e-05, -1.8397e-05, +3.25504   ],
[12.5741, -12.5741, +7.42593         ],
[0.000198343, -0.000198343, +2.93824 ],
[2, -4, +3.8147e-06                  ],
[17.2704, -17.2704, +2.72964         ],
[4.40652, -1.75097, +1.80301         ],
])


titles.append("TT_hut")
T.append([
[1.61363, -1.61363, +1.67681         ],
[9.14216e-06, -9.14216e-06, +0.29449 ],
[0.26839, -0.26839, +0.429124        ],
[0.445048, -0.42469, +0.409462       ],
[0.129684, -0.129684, +0.139172      ],
])

titles.append("TT_hct")
T.append([
[2.7896e-07, -2.7896e-07, +0.400246  ],
[0.301592, -0.301592, +0.767253      ],
[0.000188956, -0.000188956, +0.282054],
[0.341245, -0.975649, +0.743497      ],
[0.37259, -0.37259, +0.515831        ],
[0.23269, -0.126781, +0.126722       ],
])
'''

'''
titles.append("hut")
T.append([
[0.491356, -1.04202, +0.603399],
[2.16481e-05, -2.16481e-05, +0.68948],
[0.147973, -0.147973, +0.13538],
[0.000156326, -0.000156326, +0.146056],
[0.121879, -0.000124563, +0.0371801],
])

titles.append("hct")
T.append([
[0.141116, -0.141116, +0.430019],
[4.78862e-07, -4.78862e-07, +0.0153265],
[0.114833, -0.114833, +0.208702],
[2.76909e-05, -2.76909e-05, +0.136544],
[0.00672207, -0.00672207, +0.0131338],
[0.0713777, -0.0713777, +0.0521756],
])

titles.append("ST_hut")
T.append([
[0.946111, -0.946111, +0.0169086],
[0.934155, -0.934155, +0.879131],
[0.474512, -0.474512, +0.399762],
[1.07522e-08, -1.07522e-08, +0.413992],
[0.352957, -3.35296, +0.061136],
])

titles.append("ST_hct")
T.append([
[0.612195, -0.612195, +1.38287],
[1.90586e-05, -1.90586e-05, +20],
[0.462682, -0.462682, +0.79343],
[1.61235e-06, -1.61235e-06, +1.10433],
[0.89705, -0.89705, +1.34225],
[0.65458, -0.65458, +0.24141],
])


titles.append("TT_hut")
T.append([
[0.21002, -0.21002, +0.00664608],
[3.10111e-06, -3.10111e-06, +0.422599],
[0.212659, -0.212659, +0.204789],
[0.00154178, -0.00154178, +0.183424],
[0.119995, -0.0756147, +0.0755312],
])

titles.append("TT_hct")
T.append([
[0.189068, -0.189068, +0.695242],
[8.79555e-07, -8.79555e-07, +0.256304],
[0.15353, -0.15353, +0.284388],
[0.000875601, -0.000875601, +0.154591],
[0.023152, -0.023152, +0.13728],
[0.0459253, -0.0459253, +0.0892644],
])
'''

'''
titles.append("hut")
T.append([
[0.298429, -3.29843, +0.272102],
[2.16481e-05, -2.16481e-05, +0.68948],
[0.147973, -0.147973, +0.13538],
[0.000156326, -0.000156326, +0.146056],
[0.121879, -0.000124563, +0.0371801],
])

titles.append("hct")
T.append([
[0.141116, -0.141116, +0.430019],
[4.78862e-07, -4.78862e-07, +0.0153265],
[0.114833, -0.114833, +0.208702],
[2.76909e-05, -2.76909e-05, +0.136544],
[0.00672207, -0.00672207, +0.0131338],
[0.0713777, -0.0713777, +0.0521756],
])

titles.append("ST_hut")
T.append([
[0.946111, -0.946111, +0.0169086],
[0.934155, -0.934155, +0.879131],
[0.474512, -0.474512, +0.399762],
[1.07522e-08, -1.07522e-08, +0.413992],
[0.352957, -3.35296, +0.061136],
])

titles.append("ST_hct")
T.append([
[0.612195, -0.612195, +1.38287],
[1.90586e-05, -1.90586e-05, +20],
[0.462682, -0.462682, +0.79343],
[1.61235e-06, -1.61235e-06, +1.10433],
[0.89705, -0.89705, +1.34225],
[0.65458, -0.65458, +0.24141],
])


titles.append("TT_hut")
T.append([
[0.21002, -0.21002, +0.00664608],
[3.10111e-06, -3.10111e-06, +0.422599],
[0.212659, -0.212659, +0.204789],
[0.00154178, -0.00154178, +0.183424],
[0.119995, -0.0756147, +0.0755312],
])

titles.append("TT_hct")
T.append([
[0.189068, -0.189068, +0.695242],
[8.79555e-07, -8.79555e-07, +0.256304],
[0.15353, -0.15353, +0.284388],
[0.000875601, -0.000875601, +0.154591],
[0.023152, -0.023152, +0.13728],
[0.0459253, -0.0459253, +0.0892644],
])
'''

'''
titles.append("hut")
T.append([
[0.519978, -1.60198, +1.00119],
[0.24591, -1.21301, +0.629765],
[0.272497, -0.433188, +0.345196],
[-0.0152247, -0.885817, +0.301613],
[0.0755492, -0.272558, +0.352376],
])

titles.append("hct")
T.append([
[-0.173522, -2.36742, +1.96323],
[-0.115923, -2.11771, +1.34549],
[0.403973, -0.983032, +0.267193],
[0.226243, -0.849514, +0.39423],
[0.133502, -1.06539, +0.854688],
[0.129052, -0.54477, +0.444285],
])
'''

titles.append("hut")
T.append([
[0.519978, -1.60198, 1.00119],
[0.24591, -1.21301, 0.629765],
[0.272497, -0.433188, 0.345196],
[-0.0152247, -0.885817, 0.301613],
[0.0755492, -0.272558, 0.352376],
])

titles.append("hct")
T.append([
[-0.173522, -2.36742, 1.96323],
[-0.115923, -2.11771, 1.34549],
[0.403973, -0.983032, 0.267193],
[0.226243, -0.849514, 0.39423],
[0.133502, -1.06539, 0.854688],
[0.129052, -0.54477, 0.444285],
])

titles.append("ST_hut")
T.append([
[0.283242, -1.34375, 2.06876],
[0.506985, -1.17491, 1.58832],
[0.486692, -0.517403, 0.65506],
[0.00785986, -3.65614, 0.796197],
[0.312284, -0.823517, 0.895791],
])

titles.append("ST_hct")
T.append([
[-4.87519, -0.124806, 9.87519],
[-4.99999, -9.54E-06, 9.99999],
[3.14507, -7.05549, 1.85493],
[4.99999, -9.99999, 9.54E-06],
[-4.99999, -9.54E-06, 9.99999],
[3.90893, -5.9329, 1.09107],
])


titles.append("TT_hut")
T.append([
[0.256797, -4.92656, 2.85529],
[0.192244, -1.6308, 0.624733],
[0.43642, -0.438029, 0.538282],
[0.206754, -1.4879, 0.617235],
[0.0634507, -0.482294, 0.462936],
])

titles.append("TT_hct")
T.append([
[-0.00456192, -2.78449, 1.93941],
[-0.0480284, -2.17544, 1.19289],
[0.419286, -0.998339, 0.269921],
[0.333882, -1.03036, 0.397821],
[0.128609, -0.708997, 0.481199],
[0.0671541, -0.570615, 0.544706],
])

#xminshift = [3, 1, 3, 2, 3, 0]
#xmaxshift = [1, 2, 2, 2, 1, 2]

#xminshift = [1, 1, 1, 1, 1, 1]
#xmaxshift = [1, 1, 1, 1, 1, 1]

#xminshift = [-6, 1, 1, 1, 1, 1]
#xmaxshift = [ 1, 1, 1, 1, 1, 1]

xminshift = [ 2, 3, 1, 4, 1, 1]
xmaxshift = [ 2, 6, 4, 9, 4, 3]


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

