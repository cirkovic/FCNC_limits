from ROOT import *
import sys

gROOT.SetBatch(True)

fs = []
cs = []

fn = sys.argv[1]
out = sys.argv[2]

ft = TFile.Open(fn)
if not ft: sys.exit()
fs.append(ft)
for p in ['asdf', 'nuisancs', 'post_fit_errs']:
    ct = fs[-1].Get(p)
    if not ct: continue
    cs.append(ct)
    cs[-1].Draw()
    cs[-1].Print(out+'/'+cs[-1].GetName()+'.pdf')
    cs[-1].Print(out+'/'+cs[-1].GetName()+'.png')
