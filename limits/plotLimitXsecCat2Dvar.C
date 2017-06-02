TStyle* PlotStyle();
TStyle* PlotStyleCMS();
void SetPlotStyle();

#include <math.h>
#include <fstream>
#include <sstream>
#include <string>
#include <iostream>
#include "TF2.h"

Double_t g2(Double_t *x, Double_t *par) {
   Double_t r1 = Double_t((x[0]-par[1])/par[2]);
   Double_t r2 = Double_t((x[1]-par[3])/par[4]);
   return par[0]*TMath::Exp(-0.5*(r1*r1+r2*r2));
}
Double_t fun2(Double_t *x, Double_t *par) {
   Double_t *p1 = &par[0];
   Double_t *p2 = &par[5];
   Double_t *p3 = &par[10];
   Double_t result = g2(x,p1) + g2(x,p2) + g2(x,p3);
   return result;
}

#include <sstream>
#include <iomanip>

template <typename T>
std::string to_string_with_precision(const T a_value, const int n = 6)
{
    std::ostringstream out;
    out << std::setprecision(n) << a_value;
    return out.str();
}

//TF2 *f1 = new TF2("f1", 1.0, 0.0, 1.0, 0.0, 1.0);
//TF2 *f2 = new TF2("f2", "[0]+[1]*x+[2]*x**2+[3]*x**3+[4]*x**4+[5]*y+[6]*y**2+[7]*y**3+[8]*y**4", 0.0, 1.0, 0.0, 1.0);

//double finter(double *x, double *par) {
//   return TMath::Abs(f1->EvalPar(x, par) - f2->EvalPar(x, par));
//}

//void limitXsecCat()
void plotLimitXsecCat2Dvar(std::string coup = "2D", std::string name = "combSTandTT", std::string type = "all", float max = 0.2, int nChan = 50, float limit = 1.0)
{
   gROOT->SetBatch(1);

   SetPlotStyle();

   gStyle->SetPalette(1);

   //const int nChan = 5;
   //const int nChan = 6;
   //const int nChan = 11;
   //const int nChan = 5;
   //int nChan = 10;
   //int nChan = 100;
   //int nChan = 50;
   //float step = 1.0 / nChan;
   //float max = 0.2;
   float step = max / nChan;
   nChan = nChan + 1;

   //std::string coup = "Hct";
   //float xsec = 50.82;
   //if( coup == "Hct" ) xsec = 38.88;
   //else if (coup == "2D") xsec = (50.82+38.88)/2;

   //float hutXsec = 50.82;
   //float hctXsec = 38.88;

   //float xsec = 0.88+2*4.892;
   //if( coup == "Hct" ) xsec = 0.11+2*4.892;
   
   float xbins[nChan];
   for(int j=0;j<=nChan;j++)
     {
	xbins[j] = j;
     }

   /*
   float med[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
   */

   float **obs = new float*[nChan];
   float **med = new float*[nChan];
   float **s1p = new float*[nChan];
   float **s1m = new float*[nChan];
   float **s2p = new float*[nChan];
   float **s2m = new float*[nChan];

   for (int i = 0; i < nChan; i++) {
        obs[i] = new float[nChan];
        med[i] = new float[nChan];
        s1p[i] = new float[nChan];
        s1m[i] = new float[nChan];
        s2p[i] = new float[nChan];
        s2m[i] = new float[nChan];
   }

   #include "limits.h"

   //TH2F* h2 = new TH2F("h2", "h2", nChan, -step/2, 1.0+step/2, nChan, -step/2, 1.0+step/2);
   TH2F* h2 = new TH2F("h2", "h2", nChan, -step/2, max+step/2, nChan, -step/2, max+step/2);
   for (int y = 0; y < nChan; y++) {
      for (int x = 0; x < nChan; x++) {
         float X = x*step;
         float Y = y*step;
         //h2->SetBinContent(x+1, y+1, med[x][y]*(hutXsec*pow(X, 2)+hctXsec*pow(Y, 2)));
         //h2->SetBinContent(x+1, y+1, med[x][y]*xsec);
         /*
         if (type == "med")
             h2->SetBinContent(x+1, y+1, med[y][x]);
         else if (type == "s1p")
             h2->SetBinContent(x+1, y+1, s1p[y][x]);
         else if (type == "s1m")
             h2->SetBinContent(x+1, y+1, s1m[y][x]);
         else if (type == "obs")
             h2->SetBinContent(x+1, y+1, obs[y][x]);
         else if (type == "all")
             h2->SetBinContent(x+1, y+1, 0.0);
         */
         if (name == "ST") {
             if (type == "med")
                 h2->SetBinContent(x+1, y+1, med[y][x]*(50.82/10+38.88/10));
             else if (type == "s1p")
                 h2->SetBinContent(x+1, y+1, s1p[y][x]*(50.82/10+38.88/10));
             else if (type == "s1m")
                 h2->SetBinContent(x+1, y+1, s1m[y][x]*(50.82/10+38.88/10));
             else if (type == "obs")
                 h2->SetBinContent(x+1, y+1, obs[y][x]*(50.82/10+38.88/10));
             else if (type == "all")
                 h2->SetBinContent(x+1, y+1, 0.0);
         }
         else if (name == "TT") {
             if (type == "med")
                 h2->SetBinContent(x+1, y+1, med[y][x]*(50.82/10+38.88/10));
             else if (type == "s1p")
                 h2->SetBinContent(x+1, y+1, s1p[y][x]*(50.82/10+38.88/10));
             else if (type == "s1m")
                 h2->SetBinContent(x+1, y+1, s1m[y][x]*(50.82/10+38.88/10));
             else if (type == "obs")
                 h2->SetBinContent(x+1, y+1, obs[y][x]*(50.82/10+38.88/10));
             else if (type == "all")
                 h2->SetBinContent(x+1, y+1, 0.0);
         }
         else {
             if (type == "med")
                 h2->SetBinContent(x+1, y+1, med[y][x]*(50.82/10+38.88/10));
             else if (type == "s1p")
                 h2->SetBinContent(x+1, y+1, s1p[y][x]*(50.82/10+38.88/10));
             else if (type == "s1m")
                 h2->SetBinContent(x+1, y+1, s1m[y][x]*(50.82/10+38.88/10));
             else if (type == "obs")
                 h2->SetBinContent(x+1, y+1, obs[y][x]*(50.82/10+38.88/10));
             else if (type == "all")
                 h2->SetBinContent(x+1, y+1, 0.0);
         }
      }
   }
   TCanvas *c1 = new TCanvas("c1", "c1");
   //h2->Draw("COLZ TEXT");
   //h2->Draw("COLZ");
   h2->Draw("COL");
   h2->GetXaxis()->SetTitle("kHut");
   h2->GetYaxis()->SetTitle("kHct");
   //h2->Draw("CONT1 TEXT");
   //TF2 *f2 = new TF2("f2", "[0]+[1]*x+[2]*x**2+[3]*y+[4]*y**2", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]*x+[2]*x**2+[3]*x**3+[4]*y+[5]*y**2+[6]*y**3", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]*x+[2]*x**2+[3]*x**3+[4]*x**4+[5]*y+[6]*y**2+[7]*y**3+[8]*y**4", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]*x+[2]*x**2+[3]*x**3+[4]*x**4+[5]*x**5+[6]*x**6+[7]*y+[8]*y**2+[9]*y**3+[10]*y**4+[11]*x**5+[12]*x**6", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]*x**(-1)+[2]*x**(-2)+[3]*x**(-3)+[4]*x**(-4)+[5]*x**(-5)+[6]*x**(-6)+[7]*y**(-1)+[8]*y**(-2)+[9]*y**(-3)+[10]*y**(-4)+[11]*x**(-5)+[12]*x**(-6)", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]*x**(-1)+[2]*y**(-1)", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]*(x+1)**(-1)+[2]*(x+1)**(-2)+[3]*(y+1)**(-1)+[4]*(y+1)**(-2)", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]*(x)**(-2)+[2]*(y)**(-2)+[3]*(x)**(-4)+[4]*(y)**(-4)", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]/(x**2)+[2]/(y**2)", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]/(x)+[2]/(y)+[3]/(x**2)+[4]/(y**2)+[5]/(x**3)+[6]/(y**3)", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]/(x)+[2]/(y)", 0.0, 0.2, 0.0, 0.2);
   //TF2 *f2 = new TF2("f2", "1/(1 + (x/[0])**[1]) + 1/(1 + (y/[2])**[3])", 0.0, 0.2, 0.0, 0.2);
   //TF2 *f2 = new TF2("f2", "[0]+[1]*(x**2)+[2]*(y**2)", 0.0, 0.2, 0.0, 0.2);
//   TF2 *f2 = new TF2("f2", "[0]+[1]*(x**2)+[2]*(y**2) + [3]+[4]*(x**2)+[5]*(y**2)", 0.0, 0.2, 0.0, 0.2);
   //TF2 *f2 = new TF2("f2", "[0]*TMath::Gaus(x,[1],[2])*TMath::Gaus(y,[3],[4])", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]*(x+1)**(-1)+[2]*(x+1)**(-2)+[3]*(x+1)**(-3)+[4]*(x+1)**(-4)+[5]*(y+1)**(-1)+[6]*(y+1)**(-2)+[7]*(y+1)**(-3)+[8]*(y+1)**(-4)", 0.0, 1.0, 0.0, 1.0);
   //TF2 *fint = new TF2("fint", finter, 0.0, 1.0, 0);
   //double xint = fint->GetMinimumX();
   //double limit = 0.5;
   //double limit = 1.2;
   //double limit = 1.0;
   //double limit = 1.0;
   //double limit = 0.1;
   //f2->SetContour(1, &limit);
   //h2->Fit("f2");
   double *cx, *cx1, *cx2, *cx3, *cx4;
   double *cy, *cy1, *cy2, *cy3, *cy4;
   cx = new double[h2->GetXaxis()->GetNbins()];
   cy = new double[h2->GetYaxis()->GetNbins()];
   cx1 = new double[h2->GetXaxis()->GetNbins()];
   cy1 = new double[h2->GetYaxis()->GetNbins()];
   cx2 = new double[h2->GetXaxis()->GetNbins()];
   cy2 = new double[h2->GetYaxis()->GetNbins()];
   cx3 = new double[h2->GetXaxis()->GetNbins()];
   cy3 = new double[h2->GetYaxis()->GetNbins()];
   cx4 = new double[h2->GetXaxis()->GetNbins()];
   cy4 = new double[h2->GetYaxis()->GetNbins()];
   int ic = 0, nc = 0;
   int ic1 = 0, nc1 = 0;
   int ic2 = 0, nc2 = 0;
   int ic3 = 0, nc3 = 0;
   int ic4 = 0, nc4 = 0;
   char cline[1024];
   fstream myfile;
   if (type == std::string("all")) {
       myfile.open((std::string("CS_")+name+"_"+std::to_string(max)+"_"+std::to_string(nChan)+"_"+std::to_string(limit)+"_"+std::string(".txt")).c_str(), std::ofstream::in);
       std::string line;
       float number;
       std::stringstream iss;

       myfile.getline(cline, 1024);
       iss.str(""); iss.clear(); iss << cline;
       std::cout << iss.str() << std::endl;
       while (iss >> number) cx1[ic1++] = number;

       myfile.getline(cline, 1024);
       iss.str(""); iss.clear(); iss << cline;
       std::cout << iss.str() << std::endl;
       while (iss >> number) cy1[nc1++] = number;

       myfile.getline(cline, 1024);

       myfile.getline(cline, 1024);
       iss.str(""); iss.clear(); iss << cline;
       std::cout << iss.str() << std::endl;
       while (iss >> number) cx2[ic2++] = number;

       myfile.getline(cline, 1024);
       iss.str(""); iss.clear(); iss << cline;
       std::cout << iss.str() << std::endl;
       while (iss >> number) cy2[nc2++] = number;

       myfile.getline(cline, 1024);

       myfile.getline(cline, 1024);
       iss.str(""); iss.clear(); iss << cline;
       std::cout << iss.str() << std::endl;
       while (iss >> number) cx3[ic3++] = number;

       myfile.getline(cline, 1024);
       iss.str(""); iss.clear(); iss << cline;
       std::cout << iss.str() << std::endl;
       while (iss >> number) cy3[nc3++] = number;

       myfile.getline(cline, 1024);

       myfile.getline(cline, 1024);
       iss.str(""); iss.clear(); iss << cline;
       std::cout << iss.str() << std::endl;
       while (iss >> number) cx4[ic4++] = number;

       myfile.getline(cline, 1024);
       iss.str(""); iss.clear(); iss << cline;
       std::cout << iss.str() << std::endl;
       while (iss >> number) cy4[nc4++] = number;

       myfile.close();
   }
   else {
       int *XI = new int[h2->GetXaxis()->GetNbins()];
       int *YI = new int[h2->GetYaxis()->GetNbins()];
       for (int xi = 0; xi < h2->GetXaxis()->GetNbins(); xi++) {
          XI[xi] = 0;
          YI[xi] = 0;
       }
       //cx = new double[h2->GetXaxis()->GetNbins()];
       //cy = new double[h2->GetYaxis()->GetNbins()];
       for (int xi = 0; xi < h2->GetXaxis()->GetNbins(); xi++){
           XI[xi] = xi;
           YI[xi] = xi;
           for (int yi = 0; yi < h2->GetYaxis()->GetNbins(); yi++){
    //          //std::cout << "(" << xi << ", " << yi << "): " << h2->GetBinContent(xi+1, yi+1) << std::endl;
              if (fabs(h2->GetBinContent(xi+1, yi+1) - limit) < fabs(h2->GetBinContent(XI[xi]+1, YI[xi]+1) - limit)) {
                XI[xi] = xi;
                YI[xi] = yi;
              }
           }
           cx[xi] = h2->GetXaxis()->GetBinCenter(XI[xi]+1);
           cy[xi] = h2->GetYaxis()->GetBinCenter(YI[xi]+1);
       }
   }
   //TGraph* gr = new TGraph(h2->GetXaxis()->GetNbins(), cx, cy);
   //TGraph* gr = new TGraph(8, cx, cy);
   //TGraph* gr = new TGraph(67, cx, cy);
   //TGraph* gr = new TGraph(27, cx, cy);
   TGraph *gr, *gr1, *gr2, *gr3, *gr4;
   if (type == std::string("all")) {

       for (ic = 0; ic < h2->GetXaxis()->GetNbins(); ic++)
        if (cy[ic] == h2->GetYaxis()->GetBinCenter(1)) break;
       nc = ic+1;
       //nc = ic;
       gr1 = new TGraph(nc1, cx1, cy1);
       gr2 = new TGraph(nc2, cx2, cy2);
       gr3 = new TGraph(nc3, cx3, cy3);
       gr4 = new TGraph(nc4, cx4, cy4);

   }
   else {
       for (ic = 0; ic < h2->GetXaxis()->GetNbins(); ic++)
        if (cy[ic] == h2->GetYaxis()->GetBinCenter(1)) break;
       nc = ic+1;
       //nc = ic;
       gr = new TGraph(nc, cx, cy);
   }

   if (type != std::string("all")) {
       if (type == std::string("s1m")) {
           myfile.open((std::string("CS_")+name+"_"+std::to_string(max)+"_"+std::to_string(nChan)+"_"+std::to_string(limit)+"_"+std::string(".txt")).c_str(), std::ofstream::out | std::ofstream::trunc);
           myfile.close();
       }
       myfile.open((std::string("CS_")+name+"_"+std::to_string(max)+"_"+std::to_string(nChan)+"_"+std::to_string(limit)+"_"+std::string(".txt")).c_str(), std::fstream::in | std::fstream::out | std::fstream::app);
       for (ic = 0; ic < nc; ic++)
        myfile << cx[ic] << "\t";
       myfile << std::endl;
       for (ic = 0; ic < nc; ic++)
        myfile << cy[ic] << "\t";
       myfile << std::endl << std::endl;
       myfile.close();
   }

   if (type == std::string("all")) {
      gr1->SetLineWidth(3);
      gr1->SetLineStyle(2);
      gr1->Draw("SAME L");
      gr2->SetLineWidth(3);
      gr2->Draw("SAME L");
      gr3->SetLineWidth(3);
      gr3->SetLineStyle(2);
      gr3->Draw("SAME L");
      gr4->SetLineWidth(3);
      gr4->SetLineColor(kRed);
      gr4->Draw("SAME L");
   }
   else {
       gr->SetLineWidth(3);
       //gr->Draw("SAME C");
       gr->Draw("SAME L");
   }
/*
   Double_t contours[3];
   contours[0] = 0.9;
   contours[1] = 1.0;
   contours[2] = 1.1;

   f2->SetContour(3, contours);
   h2->Fit("f2");
*/

   /*
   TObjArray *conts = (TObjArray*)gROOT->GetListOfSpecials()->FindObject("contours");
   if (!conts) {
        std::cout << "No conts" << std::endl;
        return;
    }
   TList *lcontour1 = (TList*)conts->At(0);
   if (!lcontour1) {
        std::cout << "No lcontour" << std::endl;
        return;
    }
   TGraph *gc1 = (TGraph*)lcontour1->First();
   if (!gc1) {
        std::cout << "No gc1" << std::endl;
        return;
    }
   if (gc1->GetN() < 10) {
        std::cout << "gc1->GetN() < 10" << std::endl;
        return;
    }
   gc1->SetMarkerStyle(21);
   gc1->Draw("alp");
   */

   TText *xlabel = new TText();
   xlabel-> SetNDC();
   xlabel -> SetTextFont(1);
   xlabel -> SetTextColor(1);
   xlabel -> SetTextSize(0.03);
   xlabel -> SetTextAlign(22);
   xlabel -> SetTextAngle(0);
   xlabel -> DrawText(0.5, 0.04, ("limit = "+to_string_with_precision(limit, 2)+" (should be 1.0)").c_str());

   
   if (type == std::string("all")) {
       //TLegend *leg = new TLegend(0.5, 0.8, 0.5, 0.8);
       //leg->AddEntry(gr1, "exp", "l");
       //leg->AddEntry(gr2, "exp", "l");
       //leg->AddEntry(gr3, "exp+1#sigma", "l");
       //leg->AddEntry(gr4, "obs", "l");
       //leg->Draw();
   }

   //fint->Draw();
   /*
   const Int_t npar = 15;
   Double_t f2params[npar] = {100,-3,3,-3,3,160,0,0.8,0,0.9,40,4,0.7,4,0.7};
   TF2 *f2 = new TF2("f2",fun2,-10,10,-10,10, npar);
   f2->SetParameters(f2params);
   h2->Fit("f2","N");
   h2->FillRandom("f2", 10000);
   h2->Draw("COLZ TEXT");
   */
   /*
   int X1 = 1;
   int Y1 = 1;
   for (int x = 0; x < nChan; x++) {
      for (int y = 0; y < nChan; y++) {
         if (fabs(1.0-h2->GetBinContent(x+1, y+1)) < fabs(1.0-h2->GetBinContent(X1, Y1))) {
            X1 = x+1;
            Y1 = y+1;
         }
      }
   }
   h2->SetBinContent(X1, Y1, 0.0);
   */
   c1->Print(("pics/LimitComb"+coup+".png").c_str());
   c1->Print(("pics/LimitComb"+coup+".pdf").c_str());
   /*
   //std::cout << s1m[1] << std::endl;

   //exit(0);
   
   TH1F *hLimitXsec[nChan];
   TH1F *hLimitXsecs1p[nChan];
   TH1F *hLimitXsecs1m[nChan];
   TH1F *hLimitXsecs2p[nChan];
   TH1F *hLimitXsecs2m[nChan];

   TH1F *hLimitXsec_bkp[nChan];
   TH1F *hLimitXsecs1p_bkp[nChan];
   TH1F *hLimitXsecs1m_bkp[nChan];
   TH1F *hLimitXsecs2p_bkp[nChan];
   TH1F *hLimitXsecs2m_bkp[nChan];
   
   for(int i=0;i<nChan;i++)
     {	
	std::string nameLimitXsec = "hLimitXsec"+std::string(Form("%d",i));
	std::string nameLimitXsecs1p = "hLimitXsecs1p"+std::string(Form("%d",i));
	std::string nameLimitXsecs1m = "hLimitXsecs1m"+std::string(Form("%d",i));
	std::string nameLimitXsecs2p = "hLimitXsecs2p"+std::string(Form("%d",i));
	std::string nameLimitXsecs2m = "hLimitXsecs2m"+std::string(Form("%d",i));
	
	hLimitXsec[i] = new TH1F(nameLimitXsec.c_str(),nameLimitXsec.c_str(),nChan,xbins);
	hLimitXsecs1p[i] = new TH1F(nameLimitXsecs1p.c_str(),nameLimitXsecs1p.c_str(),nChan,xbins);
	hLimitXsecs1m[i] = new TH1F(nameLimitXsecs1m.c_str(),nameLimitXsecs1m.c_str(),nChan,xbins);
	hLimitXsecs2p[i] = new TH1F(nameLimitXsecs2p.c_str(),nameLimitXsecs2p.c_str(),nChan,xbins);
        hLimitXsecs2m[i] = new TH1F(nameLimitXsecs2m.c_str(),nameLimitXsecs2m.c_str(),nChan,xbins);
     }   
   
   for(int ib=0;ib<nChan;ib++)
     {          
	hLimitXsec[ib]->SetBinContent(ib+1,med[ib]*xsec);
	hLimitXsecs1p[ib]->SetBinContent(ib+1,s1p[ib]*xsec);
	hLimitXsecs1m[ib]->SetBinContent(ib+1,s1m[ib]*xsec);
	hLimitXsecs2p[ib]->SetBinContent(ib+1,s2p[ib]*xsec);
	hLimitXsecs2m[ib]->SetBinContent(ib+1,s2m[ib]*xsec);
     }   
   
   for(int i=0;i<nChan;i++) {
    hLimitXsec_bkp[i]    = (TH1F*)hLimitXsec[i]->Clone();
    hLimitXsecs1p_bkp[i] = (TH1F*)hLimitXsecs1p[i]->Clone();
    hLimitXsecs1m_bkp[i] = (TH1F*)hLimitXsecs1m[i]->Clone();
    hLimitXsecs2p_bkp[i] = (TH1F*)hLimitXsecs2p[i]->Clone();
    hLimitXsecs2m_bkp[i] = (TH1F*)hLimitXsecs2m[i]->Clone();
   }

   TCanvas *c1 = new TCanvas("c1","c1",0,0,700,500);

   TLine *line[nChan];
   
   const int np = 5;
   double xp_s1[nChan][np];
   double yp_s1[nChan][np];
   double xp_s2[nChan][np];
   double yp_s2[nChan][np];

   for(int i=0;i<nChan;i++)
     {	
	float wid = hLimitXsec[i]->GetBinWidth(i+1)/2.0;
	
	xp_s1[i][0] = hLimitXsec[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1[i][0] = hLimitXsecs1m[i]->GetBinContent(i+1);
	xp_s1[i][1] = hLimitXsec[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s1[i][1] = hLimitXsecs1m[i]->GetBinContent(i+1);
	xp_s1[i][2] = hLimitXsec[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s1[i][2] = hLimitXsecs1p[i]->GetBinContent(i+1);
	xp_s1[i][3] = hLimitXsec[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1[i][3] = hLimitXsecs1p[i]->GetBinContent(i+1);
	xp_s1[i][4] = hLimitXsec[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1[i][4] = hLimitXsecs1m[i]->GetBinContent(i+1);

	xp_s2[i][0] = hLimitXsec[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2[i][0] = hLimitXsecs2m[i]->GetBinContent(i+1);
	xp_s2[i][1] = hLimitXsec[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s2[i][1] = hLimitXsecs2m[i]->GetBinContent(i+1);
	xp_s2[i][2] = hLimitXsec[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s2[i][2] = hLimitXsecs2p[i]->GetBinContent(i+1);
	xp_s2[i][3] = hLimitXsec[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2[i][3] = hLimitXsecs2p[i]->GetBinContent(i+1);
	xp_s2[i][4] = hLimitXsec[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2[i][4] = hLimitXsecs2m[i]->GetBinContent(i+1);
	
	line[i] = new TLine(hLimitXsec[i]->GetXaxis()->GetBinLowEdge(i+1),
			    hLimitXsec[i]->GetBinContent(i+1),
			    hLimitXsec[i]->GetXaxis()->GetBinUpEdge(i+1),
			    hLimitXsec[i]->GetBinContent(i+1));
	
	line[i]->SetLineStyle(2);
	line[i]->SetLineWidth(2);
     }   

   TPolyLine *s1[nChan];
   TPolyLine *s2[nChan];
   
   hLimitXsec[0]->Reset();
   hLimitXsec[0]->Draw("");
   
   for(int i=0;i<nChan;i++)
     {	
	s1[i] = new TPolyLine(np,xp_s1[i],yp_s1[i]);
	s1[i]->SetFillColor(kGreen);

	s2[i] = new TPolyLine(np,xp_s2[i],yp_s2[i]);
	s2[i]->SetFillColor(kYellow);

	s2[i]->Draw("fSAME");
	s1[i]->Draw("fSAME");
	
	line[i]->Draw("same");
     }   
	
   hLimitXsec[0]->GetYaxis()->SetTitle("#sigma (95\% CL) [pb]");
   hLimitXsec[0]->GetXaxis()->SetTitle("");
   //hLimitXsec[0]->GetYaxis()->SetRangeUser(0.,25.);
   hLimitXsec[0]->GetYaxis()->SetRangeUser(ymin,ymax);

//   hLimitXsec[0]->GetXaxis()->SetBinLabel(1,"0.0");
//   hLimitXsec[0]->GetXaxis()->SetBinLabel(2,"0.1");
//   //hLimitXsec[0]->GetXaxis()->SetBinLabel(2,"b3j3");
//   hLimitXsec[0]->GetXaxis()->SetBinLabel(3,"0.2");
//   //hLimitXsec[0]->GetXaxis()->SetBinLabel(3,"b2j4");
//   hLimitXsec[0]->GetXaxis()->SetBinLabel(4,"0.3");
//   hLimitXsec[0]->GetXaxis()->SetBinLabel(5,"0.4");
//   hLimitXsec[0]->GetXaxis()->SetBinLabel(6,"0.5");
//   hLimitXsec[0]->GetXaxis()->SetBinLabel(7,"0.6");
//   hLimitXsec[0]->GetXaxis()->SetBinLabel(8,"0.7");
//   hLimitXsec[0]->GetXaxis()->SetBinLabel(9,"0.8");
//   hLimitXsec[0]->GetXaxis()->SetBinLabel(10,"0.9");
//   hLimitXsec[0]->GetXaxis()->SetBinLabel(11,"1.0");

   for (int x = 0; x < nChan; x++)
      hLimitXsec[0]->GetXaxis()->SetBinLabel(x+1,to_string(x*step));
   
   TLegend *leg;
   leg = new TLegend(0.75,0.90,0.90,0.70);
   //leg->SetFillColor(253);
   //leg->SetFillColor(0);
   //leg->SetFillColor(-1);
   leg->SetFillStyle(0);
   leg->SetBorderSize(0);
   
   leg->AddEntry(line[0],"Expected","l");
   leg->AddEntry(s1[0],"68\%","f");
   leg->AddEntry(s2[0],"95\%","f");
   
   c1->RedrawAxis("g");
   
   leg->Draw();
   
   TLatex *tex = new TLatex(0.1969,0.906825,"CMS");
   tex->SetNDC();
   tex->SetTextAlign(13);
   tex->SetTextFont(61);
   tex->SetTextSize(0.07475);
   tex->SetLineWidth(2);
   tex->Draw();

   TLatex *tex2 = new TLatex(0.1969,0.817125,"Preliminary");
   tex2->SetNDC();
   tex2->SetTextAlign(13);
   tex2->SetTextFont(52);
   tex2->SetTextSize(0.05681);
   tex2->SetLineWidth(2);
   tex2->Draw();

   //TLatex *text1 = new TLatex(0.98,0.95125,"12.9 fb^{-1}, #sqrt{s} = 13 TeV");
   //TLatex *text1 = new TLatex(0.98,0.95125,"36.8 fb^{-1}, #sqrt{s} = 13 TeV");
   TLatex *text1 = new TLatex(0.98,0.95125,"36 fb^{-1}, #sqrt{s} = 13 TeV");
   text1->SetNDC();
   text1->SetTextAlign(31);
   text1->SetTextFont(42);
   text1->SetTextSize(0.04875);
   text1->SetLineWidth(2);
   text1->Draw();

   ////////////////////////////////////////////////////////////////////
   if (false) {

   std::stringstream limLab;
   limLab.precision(4);

   double xshift = 0.16;

   for (int i = 0; i < nChan; i++) {

       TLatex limLabp2;
       limLabp2.SetTextSize(0.044);
       limLabp2.SetNDC();
       limLabp2.SetTextColor(kBlack);
       limLab.str("");
       limLab << hLimitXsecs2p_bkp[i]->GetBinContent(i+1);
       limLabp2.DrawLatex(0.20+xshift*i,0.60,limLab.str().c_str());

       TLatex limLabp1;
       limLabp1.SetTextSize(0.044);
       limLabp1.SetNDC();
       limLabp1.SetTextColor(kBlack);
       limLab.str("");
       limLab << hLimitXsecs1p_bkp[i]->GetBinContent(i+1);
       limLabp1.DrawLatex(0.20+xshift*i,0.55,limLab.str().c_str());

       TLatex lLimit;
       lLimit.SetTextSize(0.044);
       lLimit.SetNDC();
       lLimit.SetTextColor(kBlack);
       limLab.str("");
       limLab << hLimitXsec_bkp[i]->GetBinContent(i+1);
       //limLab << " (" << data2[0] << ")";
       lLimit.DrawLatex(0.20+xshift*i,0.50,limLab.str().c_str());

       TLatex limLabm1;
       limLabm1.SetTextSize(0.044);
       limLabm1.SetNDC();
       limLabm1.SetTextColor(kBlack);
       limLab.str("");
       limLab << hLimitXsecs1m_bkp[i]->GetBinContent(i+1);
       limLabm1.DrawLatex(0.20+xshift*i,0.45,limLab.str().c_str());

       TLatex limLabm2;
       limLabm2.SetTextSize(0.044);
       limLabm2.SetNDC();
       limLabm2.SetTextColor(kBlack);
       limLab.str("");
       limLab << hLimitXsecs2m_bkp[i]->GetBinContent(i+1);
       limLabm2.DrawLatex(0.20+xshift*i,0.40,limLab.str().c_str());
   
   }
   }

   TLatex *ctex = new TLatex(0.50, 0.87, coup.c_str());
   ctex->SetNDC();
   ctex->SetTextAlign(13);
   ctex->SetTextFont(61);
   ctex->SetTextSize(0.07475);
   ctex->SetLineWidth(2);
   ctex->Draw();

   ////////////////////////////////////////////////////////////////////


   
   //std::string picname = "pics/LimitXsec.eps";
   //c1->Print(picname.c_str());
   std::string picname = "pics/LimitComb"+coup+".eps";
   c1->Print(picname.c_str());
   picname = "pics/LimitComb"+coup+".png";
   c1->Print(picname.c_str());
   picname = "pics/LimitComb"+coup+".pdf";
   c1->Print(picname.c_str());
   c1->Clear();
   
   delete c1;
   delete leg;
     
   gApplication->Terminate();
   */
}

void SetPlotStyle()
{
   TStyle *styleCurrent = gROOT->GetStyle("PLOT");
   if( !styleCurrent )
     {
	static TStyle* plotStyle = 0;
	if( plotStyle == 0 ) plotStyle = PlotStyleCMS();
	gROOT->SetStyle("PLOT");
	gROOT->ForceStyle();
     }
}

TStyle* PlotStyleCMS()
{
   TStyle *plotStyle = new TStyle("PLOT","Plot style CMS");

   plotStyle->SetOptTitle(0);
   plotStyle->SetOptStat(0);
   plotStyle->SetOptFit(0);
   
   plotStyle->SetPaperSize(20.,26.);

   plotStyle->SetEndErrorSize(2);
//   plotStyle->SetErrorX(0.);
   
   plotStyle->SetFrameBorderMode(0);
   plotStyle->SetFrameFillColor(0);
   plotStyle->SetFrameFillStyle(0);
   plotStyle->SetCanvasBorderMode(0);
   plotStyle->SetFillColor(0);
   plotStyle->SetCanvasColor(0);
   plotStyle->SetCanvasBorderSize(2);
   
   plotStyle->SetPadBorderMode(0);
   plotStyle->SetPadColor(0);
   plotStyle->SetPadGridX(false);
   plotStyle->SetPadGridY(false);
   plotStyle->SetGridColor(0);
   plotStyle->SetGridStyle(3);
   plotStyle->SetGridWidth(1);
   
//   plotStyle->SetCanvasDefH(600);
//   plotStyle->SetCanvasDefW(600);
   plotStyle->SetCanvasDefX(0);
   plotStyle->SetCanvasDefY(0);
     
   plotStyle->SetHistLineColor(1);
   plotStyle->SetHistLineStyle(0);
   plotStyle->SetHistLineWidth(1);
   
   plotStyle->SetPadTickX(1);
   plotStyle->SetPadTickY(1);
   
   plotStyle->SetPadLeftMargin(0.16);
   plotStyle->SetPadRightMargin(0.02);
   plotStyle->SetPadTopMargin(0.06);
   plotStyle->SetPadBottomMargin(0.13);

   plotStyle->SetLabelFont(42,"x");
   plotStyle->SetTitleFont(42,"x");
   plotStyle->SetLabelFont(42,"y");
   plotStyle->SetTitleFont(42,"y");
   plotStyle->SetLabelFont(42,"z");
   plotStyle->SetTitleFont(42,"z");

   plotStyle->SetLabelSize(0.05,"x");
   plotStyle->SetTitleSize(0.06,"x");
   plotStyle->SetLabelSize(0.05,"y");
   plotStyle->SetTitleSize(0.06,"y");
   plotStyle->SetLabelSize(0.035,"z");
   plotStyle->SetTitleSize(0.035,"z");

   plotStyle->SetLabelOffset(0.007,"XYZ");
   
   plotStyle->SetNdivisions(510,"XYZ");
   plotStyle->SetStripDecimals(kTRUE);
   plotStyle->SetTickLength(0.03, "XYZ");
   
   plotStyle->SetTitleXOffset(0.9);
   plotStyle->SetTitleYOffset(1.25);

   plotStyle->SetMarkerStyle(20);
   plotStyle->SetMarkerSize(1.2);
   
   return plotStyle;
}

TStyle* PlotStyle()
{
   TStyle *plotStyle = new TStyle("PLOT","Plot style");
   
   // use plain black on white colors
   Int_t icol=0; // WHITE
   plotStyle->SetFrameBorderMode(icol);
   plotStyle->SetFrameFillColor(icol);
   plotStyle->SetCanvasBorderMode(icol);
   plotStyle->SetCanvasColor(icol);
   plotStyle->SetPadBorderMode(icol);
   plotStyle->SetPadColor(icol);
   plotStyle->SetStatColor(icol);
   
   // set the paper & margin sizes
   plotStyle->SetPaperSize(20,26);
   
   // set margin sizes
   plotStyle->SetPadTopMargin(0.05);
   plotStyle->SetPadRightMargin(0.05);
   plotStyle->SetPadBottomMargin(0.16);
   plotStyle->SetPadLeftMargin(0.16);
   
   // set title offsets (for axis label)
   plotStyle->SetTitleXOffset(1.4);
   plotStyle->SetTitleYOffset(1.4);
   
   // use large fonts
   Int_t font=42;
   Double_t tsize=0.05;
   plotStyle->SetTextFont(font);
   
   plotStyle->SetTextSize(tsize);
   plotStyle->SetLabelFont(font,"x");
   plotStyle->SetTitleFont(font,"x");
   plotStyle->SetLabelFont(font,"y");
   plotStyle->SetTitleFont(font,"y");
   plotStyle->SetLabelFont(font,"z");
   plotStyle->SetTitleFont(font,"z");
   
   plotStyle->SetLabelSize(tsize,"x");
   plotStyle->SetTitleSize(tsize,"x");
   plotStyle->SetLabelSize(tsize,"y");
   plotStyle->SetTitleSize(tsize,"y");
   plotStyle->SetLabelSize(tsize,"z");
   plotStyle->SetTitleSize(tsize,"z");
   
   // use bold lines and markers
   plotStyle->SetMarkerStyle(20);
   plotStyle->SetMarkerSize(1.2);
   plotStyle->SetHistLineWidth(2.);
   plotStyle->SetLineStyleString(2,"[12 12]"); // postscript dashes
   
   // get rid of X error bars
   // plotStyle->SetErrorX(0.001);
   // get rid of error bar caps
   plotStyle->SetEndErrorSize(0.);
   
   // do not display any of the standard histogram decorations
   plotStyle->SetOptTitle(0);
   //plotStyle->SetOptStat(1111);
   plotStyle->SetOptStat(0);
   //plotStyle->SetOptFit(1111);
   plotStyle->SetOptFit(0);
   
   // put tick marks on top and RHS of plots
   plotStyle->SetPadTickX(1);
   plotStyle->SetPadTickY(1);
   
   return plotStyle;
}
