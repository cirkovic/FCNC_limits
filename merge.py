from ROOT import *

input = "/afs/cern.ch/user/k/kderoove/public/inputs_HLTEle32_ReducedVars_AcceptanceScale_Merge5Systs/"
#output = "~/probe/"
output = "~/probe1/"

gROOT.SetBatch(True)

def GetKeyNames( self, dir = "" ):
        self.cd(dir)
        return [key.GetName() for key in gDirectory.GetListOfKeys()]

TFile.GetKeyNames = GetKeyNames

#cases = ["UE", "hdamp_UE", "hdamp_UE_Jes", "hdamp_UE_Jes_SfIterativeFit"]
#cases = ["hdamp_UE", "hdamp_UE_Jes", "hdamp_UE_SfIterativeFit", "hdamp_UE_Jes_SfIterativeFit"]
cases = ["hdamp_UE", "hdamp_UE_SfIterativeFit"]
hypotheses = ["hut", "hct"]
Hypotheses = ["Hut", "Hct"]
categories = ["b2j3", "b2j4", "b3j3", "b3j4", "b4j4"]

fsi = []
fso = []

for c in cases:
    for hi, hyp in enumerate(hypotheses):
        for cat in categories:
            print input+"input_MVA"+Hypotheses[hi]+"Comb_"+cat+"_"+hyp+"_Mergedbackgrounds.root", output+c+"/"+"input_MVA"+Hypotheses[hi]+"Comb_"+cat+"_"+hyp+"_Mergedbackgrounds.root"
            fsi.append(TFile.Open(input+"input_MVA"+Hypotheses[hi]+"Comb_"+cat+"_"+hyp+"_Mergedbackgrounds.root"))
            #fso.append(TFile.Open(output+c+"/"+"input_MVA"+Hypotheses[hi]+"Comb_"+cat+"_"+hyp+"_Mergedbackgrounds.root", "RECREATE"))
            #fsi[-1].ls()
            keyList = fsi[-1].GetKeyNames()
            hs = {}
            hs1 = {}
            for key in keyList:
                print key
                #fsi[-1].cd()
                hs[key] = fsi[-1].Get(key)
                #fso[-1].cd()
                #hs[key].Write()
                if c == "hdamp_UE":
                    for fi in ["hdamp", "UE"]:
                        if fi in key:
                            newkey = key
                            for nk in ["hdamp", "UE"]:
                                if nk in key:
                                    newkey = key.replace(nk, "SystMerge1")
                                    break
                            print "\t", c, newkey
                            thereIsNoNewKey = True
                            for k in hs1:
                                if newkey == k:
                                    thereIsNoNewKey = False
                                    break
                            if thereIsNoNewKey:
                                hs1[newkey] = TH1F(hs[key])
                                hs1[newkey].SetName(newkey)
                            else:
                                hs1[newkey].Add(hs[key])
                elif c == "hdamp_UE_Jes":
                    for fi in ["hdamp", "UE", "Jes"]:
                        if fi in key:
                            newkey = key
                            for nk in ["hdamp", "UE", "Jes"]:
                                if nk in key:
                                    newkey = key.replace(nk, "SystMerge1")
                                    break
                            print "\t", c, newkey
                            thereIsNoNewKey = True
                            for k in hs1:
                                if newkey == k:
                                    thereIsNoNewKey = False
                                    break
                            if thereIsNoNewKey:
                                hs1[newkey] = TH1F(hs[key])
                                hs1[newkey].SetName(newkey)
                            else:
                                hs1[newkey].Add(hs[key])
                elif c == "hdamp_UE_SfIterativeFit":
                    for fi in ["hdamp", "UE"]:
                        if fi in key:
                            newkey = key
                            for nk in ["hdamp", "UE"]:
                                if nk in key:
                                    newkey = key.replace(nk, "SystMerge1")
                                    break
                            print "\t", c, newkey
                            thereIsNoNewKey = True
                            for k in hs1:
                                if newkey == k:
                                    thereIsNoNewKey = False
                                    break
                            if thereIsNoNewKey:
                                hs1[newkey] = TH1F(hs[key])
                                hs1[newkey].SetName(newkey)
                            else:
                                hs1[newkey].Add(hs[key])
                    for fi in ["SfIteraviveFitLf", "SfIteraviveFitHf", "SfIteraviveFitLfstats1", "SfIteraviveFitLfstats2", "SfIteraviveFitHfstats1", "SfIteraviveFitHfstats2", "SfIteraviveFitCferr1", "SfIteraviveFitCferr2"]:
                        for ud in ["Up", "Down"]:
                            if fi+ud in key:
                                newkey = key.replace(fi+ud, "SfIterativeFitMerge"+ud)
                                print "\t", c, newkey
                                thereIsNoNewKey = True
                                for k in hs1:
                                    if newkey == k:
                                        thereIsNoNewKey = False
                                        break
                                if thereIsNoNewKey:
                                    hs1[newkey] = TH1F(hs[key])
                                    hs1[newkey].SetName(newkey)
                                else:
                                    hs1[newkey].Add(hs[key])
                elif c == "hdamp_UE_Jes_SfIterativeFit":
                    for fi in ["hdamp", "UE", "Jes"]:
                        if fi in key:
                            newkey = key
                            for nk in ["hdamp", "UE", "Jes"]:
                                if nk in key:
                                    newkey = key.replace(nk, "SystMerge1")
                                    break
                            print "\t", c, newkey
                            thereIsNoNewKey = True
                            for k in hs1:
                                if newkey == k:
                                    thereIsNoNewKey = False
                                    break
                            if thereIsNoNewKey:
                                hs1[newkey] = TH1F(hs[key])
                                hs1[newkey].SetName(newkey)
                            else:
                                hs1[newkey].Add(hs[key])
                    for fi in ["SfIteraviveFitLf", "SfIteraviveFitHf", "SfIteraviveFitLfstats1", "SfIteraviveFitLfstats2", "SfIteraviveFitHfstats1", "SfIteraviveFitHfstats2", "SfIteraviveFitCferr1", "SfIteraviveFitCferr2"]:
                        for ud in ["Up", "Down"]:
                            if fi+ud in key:
                                newkey = key.replace(fi+ud, "SfIterativeFitMerge"+ud)
                                print "\t", c, newkey
                                thereIsNoNewKey = True
                                for k in hs1:
                                    if newkey == k:
                                        thereIsNoNewKey = False
                                        break
                                if thereIsNoNewKey:
                                    hs1[newkey] = TH1F(hs[key])
                                    hs1[newkey].SetName(newkey)
                                else:
                                    hs1[newkey].Add(hs[key])
            #print hs1
            fso.append(TFile.Open(output+c+"/"+"input_MVA"+Hypotheses[hi]+"Comb_"+cat+"_"+hyp+"_Mergedbackgrounds.root", "RECREATE"))
            for key in hs:
                hs[key].Write(key)
            for key in hs1:
                hs1[key].Write(key)
            fso[-1].Close()

