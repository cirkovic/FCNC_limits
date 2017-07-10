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

gROOT.SetBatch(True)

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
  print "************ covariance matrix *************"
  fr[1].covarianceMatrix().Print()
  M = []
  for i in xrange(0, fr[1].covarianceMatrix().GetNrows()):
    #s = ""
    a = []
    for j in xrange(0, fr[1].covarianceMatrix().GetNcols()):
        #s += " %f" % (fr[1].covarianceMatrix()[i][j])
        a.append(fr[1].covarianceMatrix()[i][j])
    #print s
    M.append(a)
  #print M
  h2 = TH2F("h2", "covariance matrix", fr[1].covarianceMatrix().GetNrows(), -0.5, fr[1].covarianceMatrix().GetNrows()-0.5, fr[1].covarianceMatrix().GetNcols(), -0.5, fr[1].covarianceMatrix().GetNcols()-0.5)
  print len(M)
  for x in xrange(0, len(M)):
    for y in xrange(0, len(M[x])):
        #print x, y
        h2.SetBinContent(x+1, y+1, M[x][y])
  c1 = TCanvas()
  h2.Draw("COL")
  #raw_input("Press enter...")
  parsed = str.split(sys.argv[1], '/')
  c1.Print("covariance_matrix_"+parsed[1]+"_"+parsed[2]+".png")
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
    print fr[0], "Full, accurate covariance matrix" 
    bothGood+=1 

if bothGood==2: 
  print "Both matrices were Full, accurate covariance matrices" 
