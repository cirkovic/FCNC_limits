from ROOT import *

f = TFile.Open('Hs.root')
Hus = {}
Hds = {}

for k in ['u', 'c']:
    for s in ['SfIteraviveFitLf', 'SfIteraviveFitHf', 'SfIteraviveFitLfstats1', 'SfIteraviveFitLfstats2', 'SfIteraviveFitHfstats1', 'SfIteraviveFitHfstats2', 'SfIteraviveFitCferr1', 'SfIteraviveFitCferr2', 'SfPileup', 'SfLepton', 'SfTopPt', 'Jes', 'Jer']:
        Hus['Hu_'+k+'_'+s] = f.Get('Hu_'+k+'_'+s)
        Hds['Hd_'+k+'_'+s] = f.Get('Hd_'+k+'_'+s)

for k in ['u', 'c']:
    for si, s in enumerate(['SfIteraviveFitLf', 'SfIteraviveFitHf', 'SfIteraviveFitLfstats1', 'SfIteraviveFitLfstats2', 'SfIteraviveFitHfstats1', 'SfIteraviveFitHfstats2', 'SfIteraviveFitCferr1', 'SfIteraviveFitCferr2']):
        if si == 0:
            Hus['Hu_'+k+'_btag'] = Hus['Hu_'+k+'_'+s].Clone()
            Hds['Hd_'+k+'_btag'] = Hds['Hd_'+k+'_'+s].Clone()
        else:
            Hus['Hu_'+k+'_btag'].Add(Hus['Hu_'+k+'_'+s])
            Hds['Hd_'+k+'_btag'].Add(Hds['Hd_'+k+'_'+s])

for k in ['u', 'c']:
    for s in ['btag', 'SfPileup', 'SfLepton', 'SfTopPt', 'Jes', 'Jer']:
        #print k, s, ("%.2f" % Hds['Hd_'+k+'_'+s].GetMean()), ("%.2f" % Hus['Hu_'+k+'_'+s].GetMean())
        mu = 100.0
        for xi in xrange(Hus['Hu_'+k+'_'+s].GetXaxis().GetNbins(), 0, -1):
            mu = Hus['Hu_'+k+'_'+s].GetBinCenter(xi)
            if Hus['Hu_'+k+'_'+s].GetBinContent(xi) > 0:
                break
        md = -100.0
        for xi in xrange(0, Hds['Hd_'+k+'_'+s].GetXaxis().GetNbins()):
            mu = Hds['Hd_'+k+'_'+s].GetBinCenter(xi+1)
            if Hds['Hd_'+k+'_'+s].GetBinContent(xi+1) > 0:
                break
        print k, s, ("%.0f" % md), ("%.0f" % mu)

