from ROOT import *
from array import array
import sys

output = '~/www/12-05-2017/ss/'

gROOT.SetBatch(True)

titles = []
T = []

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

titles.append("ST hut")
T.append([
[0.932504, -0.932504, +0.885454      ],
[7.31831e-06, -7.31831e-06, +0.617062],
[0.509319, -0.446479, +0.441456      ],
[1.13368, -1.13368, +0.78448         ],
[0.364736, -0.225711, +0.229069      ],
])

titles.append("ST hct")
T.append([
[1.8397e-05, -1.8397e-05, +3.25504   ],
[12.5741, -12.5741, +7.42593         ],
[0.000198343, -0.000198343, +2.93824 ],
[2, -4, +3.8147e-06                  ],
[17.2704, -17.2704, +2.72964         ],
[4.40652, -1.75097, +1.80301         ],
])


titles.append("TT hut")
T.append([
[1.61363, -1.61363, +1.67681         ],
[9.14216e-06, -9.14216e-06, +0.29449 ],
[0.26839, -0.26839, +0.429124        ],
[0.445048, -0.42469, +0.409462       ],
[0.129684, -0.129684, +0.139172      ],
])

titles.append("TT hct")
T.append([
[2.7896e-07, -2.7896e-07, +0.400246  ],
[0.301592, -0.301592, +0.767253      ],
[0.000188956, -0.000188956, +0.282054],
[0.341245, -0.975649, +0.743497      ],
[0.37259, -0.37259, +0.515831        ],
[0.23269, -0.126781, +0.126722       ],
])


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
    cs.append(TCanvas(titles[ti]))
    gs[-1].Draw("ap")
    gs[-1].SetMaximum(N[-1]-0.5)
    gs[-1].SetMinimum(-0.5)
    bxs.append(TBox(t[-1][0]+t[-1][1], Y[-1][0]+0.5, t[-1][0]+t[-1][2], Y[-1][-1]-0.5))
    bxs[-1].SetFillColor(kRed)
    bxs[-1].SetFillStyle(3004)
    bxs[-1].Draw("SAME")
    cls.append(TLine(t[-1][0], Y[-1][0]+0.5, t[-1][0], Y[-1][-1]-0.5))
    cls[-1].SetLineColor(kBlue)
    cls[-1].Draw("SAME")
    cs[-1].Print(output+cs[-1].GetName()+'.png')
    cs[-1].Print(output+cs[-1].GetName()+'.pdf')

