################################################
#                                              #
#   Written by: Karim Morabit                  #
#                                              #
################################################

# Description: At fits do not converge leading forced non-positive-defintie Hessian matrix and resulting inaccurate pull plots.
# One check the status of the fit with this script.

import ROOT 
import sys 
from random import randint
from ROOT import *
from RooFitResultInh import *
import sys

gROOT.SetBatch(True)
gStyle.SetPaintTextFormat("4.1f")
gStyle.SetOptStat(0)

infile=sys.argv[1] 

f=ROOT.TFile(infile,"READ") 

frs=[] 
frB=f.Get("fit_b") 
frS=f.Get("fit_s") 
frlist=[["s+b",frS],["b-only",frB]] 

print frlist 
bothGood=0 
for fr in frlist: 
  quality=-1 
  quality=fr[1].covQual()
  print "********************************************"
  print "************ correlation matrix *************"
  fr[1].correlationMatrix().Print()
  M = []
  for i in xrange(0, fr[1].correlationMatrix().GetNrows()):
    #s = ""
    a = []
    for j in xrange(0, fr[1].correlationMatrix().GetNcols()):
        #s += " %f" % (fr[1].correlationMatrix()[i][j])
        a.append(fr[1].correlationMatrix()[i][j])
    #print s
    M.append(a)
  #print M
#  h2 = TH2F("h2", "correlation matrix", fr[1].correlationMatrix().GetNrows(), -0.5, fr[1].correlationMatrix().GetNrows()-0.5, fr[1].correlationMatrix().GetNcols(), -0.5, fr[1].correlationMatrix().GetNcols()-0.5)
  h2 = fr[1].correlationHist()
  xnew = []
  for i in xrange(0, h2.GetXaxis().GetNbins()):
    if "StatBin" in h2.GetXaxis().GetBinLabel(i+1):
      continue
    else:
      xnew.append(h2.GetXaxis().GetBinLabel(i+1))
  print xnew
  ynew = []
  for j in xrange(0, h2.GetYaxis().GetNbins()):
    if "StatBin" in h2.GetYaxis().GetBinLabel(j+1):
      continue
    else:
      ynew.append(h2.GetYaxis().GetBinLabel(j+1))
  print ynew
  h2r = TH2F("h2", "reduced correlation matrix", len(xnew), -0.5, len(xnew)-0.5, len(ynew), -0.5, len(ynew)-0.5)
  for i in xrange(0, h2r.GetXaxis().GetNbins()):
    h2r.GetXaxis().SetBinLabel(i+1, xnew[i])
  for j in xrange(0, h2r.GetYaxis().GetNbins()):
    h2r.GetYaxis().SetBinLabel(j+1, ynew[j])
  h2r.GetXaxis().SetNdivisions(2, 0, 0, False)
  h2r.GetXaxis().SetTickLength(0)
  h2r.GetYaxis().SetNdivisions(2, 0, 0, False)
  h2r.GetYaxis().SetTickLength(0)
  ir = 0
  jr = 0
  for i in xrange(0, h2.GetXaxis().GetNbins()):
    if h2.GetXaxis().GetBinLabel(i+1) == h2r.GetXaxis().GetBinLabel(ir+1):
      for j in xrange(0, h2.GetYaxis().GetNbins()):
        if h2.GetYaxis().GetBinLabel(j+1) == h2r.GetYaxis().GetBinLabel(jr+1):
          h2r.SetBinContent(i+1, j+1, h2.GetBinContent(ir+1, jr+1))
          jr += 1
        else:
          continue
      ir += 1
    else:
      continue
  #fr[1].floatParsInit().Print()
  #allParList = fr[1].floatParsFinal()
#  allParList = fr[1].floatParsInit()
#  parns = ["Jer", "Jes", "PDFEnvelope", "SfIteraviveFitCferr1", "SfIteraviveFitCferr2", "SfIteraviveFitHf", "SfIteraviveFitHfstats1", "SfIteraviveFitHfstats2", "SfIteraviveFitLf", "SfIteraviveFitLfstats1", "SfIteraviveFitLfstats2", "SfLepton", "SfPileup", "SfTopPt", "UE", "hdamp", "lumi", "other_norm", "scaleEnvelope", "tt_add_bb", "tt_add_cc", "tt_norm"]
#  floatParList = RooArgList()
#  constParList = RooArgList()
#  for i in xrange(0, allParList.getSize()):
#    parn = allParList[i].GetName()
#    for p in parns:
#        if p in parn:
#            print parn
#            floatParList.add(allParList[i])
#        else:
#            constParList.add(allParList[i])
#  rfrt = RooFitResultInh(fr[1])
#  rfrt.setInitParListInh(floatParList)
  #fr[1]._RooFitResult__setInitParList(floatParList)
  print len(M)
  for x in xrange(0, len(M)):
    for y in xrange(0, len(M[x])):
        #print x, y
        #h2.SetBinContent(x+1, y+1, M[x][y])
        h2r.SetBinContent(x+1, y+1, M[x][y])
  c1 = TCanvas()
  c1.SetLeftMargin(c1.GetLeftMargin()*1.6)
  h2r.Draw("COLZ TEXT")
  parsed = str.split(sys.argv[1], '/')
  c1.Print("reduced_correlation_matrix_"+parsed[1]+"_"+parsed[2]+".png")
  c1.Print("reduced_correlation_matrix_"+parsed[1]+"_"+parsed[2]+".pdf")
  print "********************************************"
  print "********************************************"
  print quality 
  if quality==-1: 
    print fr[0], "Unknown, matrix was externally provided" 
  elif quality==0: 
    print fr[0], "Not calculated at all" 
  elif quality==1: 
    print fr[0], "Approximation only, not accurate" 
  elif quality==2: 
    print fr[0], "Full matrix, but forced positive-definite" 
  elif quality==3: 
    print fr[0], "Full, accurate correlation matrix" 
    bothGood+=1 

if bothGood==2: 
  print "Both matrices were Full, accurate correlation matrices" 
