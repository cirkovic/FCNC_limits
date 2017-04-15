//
//  plotter_skim.C
//  
//
//
//
//

#include <vector>
#include "TCanvas.h"
#include "TAxis.h"
#include "TH1.h"
#include <iomanip>
#include <iostream>
#include <fstream>

void plotter_skim() {
//
//    TH1 *h1 = 0;
//    
//    f = new TFile("RootFiles/ABCD/ABCD_ElEl_BGMC/hist-user.mahsan.20140429044210.task.id_158.mc12_8TeV.159122.Pythia8_AU2CTEQ6L1_gammajet_binned80.April13.v01.0.root");
//    f->GetObject("h_nevents1", h1);
//    
//    cout << h1->GetBinContent(2) << endl;
//    
//    double entries = h1->GetBinContent(1);

   THStack *hs = new THStack("hs","Stacked 1D histograms");
    TH1 *hfinal;
    hfinal = 0;
    
    TH1F *h1st = new TH1F("h1st","test hstack",100,-4,4);
    h1st->FillRandom("gaus",20000);
    h1st->SetFillColor(kRed);
    h1st->SetMarkerStyle(21);
    h1st->SetMarkerColor(kRed);
    hs->Add(h1st);
    TH1F *h2st = new TH1F("h2st","test hstack",100,-4,4);
    h2st->FillRandom("gaus",15000);
    h2st->SetFillColor(kBlue);
    h2st->SetMarkerStyle(21);
    h2st->SetMarkerColor(kBlue);
    hs->Add(h2st);
    TH1F *h3st = new TH1F("h3st","test hstack",100,-4,4);
    h3st->FillRandom("gaus",10000);
    h3st->SetFillColor(kGreen);
    h3st->SetMarkerStyle(21);
    h3st->SetMarkerColor(kGreen);
    hs->Add(h3st);
    
//    hs->GetBinError(3);

    
    TCanvas *cst = new TCanvas("cst","stacked hists",10,10,700,700);
    cst->SetFillColor(41);
    cst->Divide(2,2);
    // in top left pad, draw the stack with defaults
    cst->cd(1);
    hs->Draw();
//    h3st->SetFillColor(kBlue);
//    h3st->SetFillStyle(3018);
//    h3st->Draw("e2same");
    
    // in top right pad, draw the stack in non-stack mode
    // and errors option
    cst->cd(2);
    gPad->SetGrid();
    hs->Draw("nostack,e1p");
    

    
    //in bottom left, draw in stack mode with "lego1" option
    cst->cd(3);
    hfinal = h1st;
    hfinal->Add(h2st,1);
    hfinal->Add(h3st);
    
    gPad->SetFrameFillColor(17);
    gPad->SetTheta(3.77);
    gPad->SetPhi(2.9);
    hfinal->Draw();

}

