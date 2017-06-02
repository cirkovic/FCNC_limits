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
//void plotLimitXsecCat2Dvar_kevin(std::string coup = "2D", std::string name = "combSTandTT", std::string type = "all", float max = 0.2, int nChan = 50, float limit = 1.0)
void plotLimitXsecCat2Dvar_kevin_ALL_3(std::string coup = "2D", std::string name = "combSTandTT", std::string type = "ALL", float max = 0.2, int nChan = 50, float limit = 1.0)
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

   #include "limits_2D.h"

   //TH2F* h2 = new TH2F("h2", "h2", nChan, -step/2, 1.0+step/2, nChan, -step/2, 1.0+step/2);
   //TH2F* h2 = new TH2F("h2", "h2", nChan, -step/2, max+step/2, nChan, -step/2, max+step/2);
   /*
   double *xybins = new double[nChan+1];
   xybins[0] = -0.025;
   xybins[1] = 0.025;
   xybins[2] = 0.075;
   xybins[3] = 0.125;
   xybins[4] = 0.475;
   TH2F* h2 = new TH2F("h2", "h2", nChan, xybins, nChan, xybins);
   TH2F* h2_s1m = new TH2F("h2_s1m", "h2_s1m", nChan, xybins, nChan, xybins);
   TH2F* h2_s1p = new TH2F("h2_s1p", "h2_s1p", nChan, xybins, nChan, xybins);
   TH2F* h2_obs = new TH2F("h2_obs", "h2_obs", nChan, xybins, nChan, xybins);
   TF2 *f2 = new TF2("f2", "[0]+[1]*x+[2]*x**2+[3]*y+[4]*y**2", -0.025, 0.475, -0.025, 0.475);
   TF2 *f2_s1m = new TF2("f2_s1m", "[0]+[1]*x+[2]*x**2+[3]*y+[4]*y**2", -0.025, 0.475, -0.025, 0.475);
   TF2 *f2_s1p = new TF2("f2_s1p", "[0]+[1]*x+[2]*x**2+[3]*y+[4]*y**2", -0.025, 0.475, -0.025, 0.475);
   TF2 *f2_obs = new TF2("f2_obs", "[0]+[1]*x+[2]*x**2+[3]*y+[4]*y**2", -0.025, 0.475, -0.025, 0.475);
   */
   TH2F* h2 = new TH2F("h2", "h2", nChan, -step/2, max+step/2, nChan, -step/2, max+step/2);
   TH2F* h2_s1m = new TH2F("h2_s1m", "h2_s1m", nChan, -step/2, max+step/2, nChan, -step/2, max+step/2);
   TH2F* h2_s1p = new TH2F("h2_s1p", "h2_s1p", nChan, -step/2, max+step/2, nChan, -step/2, max+step/2);
   TH2F* h2_s2m = new TH2F("h2_s2m", "h2_s2m", nChan, -step/2, max+step/2, nChan, -step/2, max+step/2);
   TH2F* h2_s2p = new TH2F("h2_s2p", "h2_s2p", nChan, -step/2, max+step/2, nChan, -step/2, max+step/2);
   TH2F* h2_obs = new TH2F("h2_obs", "h2_obs", nChan, -step/2, max+step/2, nChan, -step/2, max+step/2);
   /*
   TF2 *f2 = new TF2("f2", "[0]+[1]*x+[2]*y+[3]*x*x+[4]*x*y+[5]*y*y", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_s1m = new TF2("f2_s1m", "[0]+[1]*x+[2]*y+[3]*x*x+[4]*x*y+[5]*y*y", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_s1p = new TF2("f2_s1p", "[0]+[1]*x+[2]*y+[3]*x*x+[4]*x*y+[5]*y*y", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_obs = new TF2("f2_obs", "[0]+[1]*x+[2]*y+[3]*x*x+[4]*x*y+[5]*y*y", -step/2, max+step/2, -step/2, max+step/2);
   */
   /*
   TF2 *f2 = new TF2("f2", "[0]+[1]*x+[2]*y+[3]*x*x+[4]*x*y+[5]*y*y+[6]*x*x*x+[7]*x*x*y+[8]*x*y*y+[9]*y*y*y", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_s1m = new TF2("f2_s1m", "[0]+[1]*x+[2]*y+[3]*x*x+[4]*x*y+[5]*y*y+[6]*x*x*x+[7]*x*x*y+[8]*x*y*y+[9]*y*y*y", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_s1p = new TF2("f2_s1p", "[0]+[1]*x+[2]*y+[3]*x*x+[4]*x*y+[5]*y*y+[6]*x*x*x+[7]*x*x*y+[8]*x*y*y+[9]*y*y*y", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_obs = new TF2("f2_obs", "[0]+[1]*x+[2]*y+[3]*x*x+[4]*x*y+[5]*y*y+[6]*x*x*x+[7]*x*x*y+[8]*x*y*y+[9]*y*y*y", -step/2, max+step/2, -step/2, max+step/2);
   */
   /*
   TF2 *f2 = new TF2("f2", "[0]*exp(-(([1]*x-[2])**2+([3]*y-[4])**2)/(2*[5]**2))", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_s1m = new TF2("f2_s1m", "[0]*exp(-(([1]*x-[2])**2+([3]*y-[4])**2)/(2*[5]**2))", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_s1p = new TF2("f2_s1p", "[0]*exp(-(([1]*x-[2])**2+([3]*y-[4])**2)/(2*[5]**2))", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_obs = new TF2("f2_obs", "[0]*exp(-(([1]*x-[2])**2+([3]*y-[4])**2)/(2*[5]**2))", -step/2, max+step/2, -step/2, max+step/2);
   */
   TF2 *f2 = new TF2("f2", "[0]/(2*TMath::Pi()*(([1]*x-[2])**2+([3]*y-[4])**2+([0]/2)**2))", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_s1m = new TF2("f2_s1m", "[0]/(2*TMath::Pi()*(([1]*x-[2])**2+([3]*y-[4])**2+([0]/2)**2))", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_s1p = new TF2("f2_s1p", "[0]/(2*TMath::Pi()*(([1]*x-[2])**2+([3]*y-[4])**2+([0]/2)**2))", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_s2m = new TF2("f2_s2m", "[0]/(2*TMath::Pi()*(([1]*x-[2])**2+([3]*y-[4])**2+([0]/2)**2))", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_s2p = new TF2("f2_s2p", "[0]/(2*TMath::Pi()*(([1]*x-[2])**2+([3]*y-[4])**2+([0]/2)**2))", -step/2, max+step/2, -step/2, max+step/2);
   TF2 *f2_obs = new TF2("f2_obs", "[0]/(2*TMath::Pi()*(([1]*x-[2])**2+([3]*y-[4])**2+([0]/2)**2))", -step/2, max+step/2, -step/2, max+step/2);
   /*
   f2->SetParameters(h2->GetBinContent(1, 2)+h2->GetBinContent(2, 1), 1.1, 0.0, 0.9, 0.0, 0.03);
   f2_s1m->SetParameters(h2_s1m->GetBinContent(1, 2)+h2_s1m->GetBinContent(2, 1), 1.1, 0.0, 0.9, 0.0, 0.03);
   f2_s1p->SetParameters(h2_s1p->GetBinContent(1, 2)+h2_s1p->GetBinContent(2, 1), 1.1, 0.0, 0.9, 0.0, 0.03);
   f2_obs->SetParameters(h2_obs->GetBinContent(1, 2)+h2_obs->GetBinContent(2, 1), 1.1, 0.0, 0.9, 0.0, 0.03);
   */

   f2->SetLineStyle(1);
   f2_s1m->SetLineStyle(2);
   f2_s1p->SetLineStyle(2);
   f2_s2m->SetLineStyle(3);
   f2_s2p->SetLineStyle(3);
   f2_obs->SetLineStyle(2);
   //std::cout << "STYLES: " << f2->GetLineStyle() << " " << f2_s1m->GetLineStyle() << " " << f2_s1p->GetLineStyle() << " " << f2_obs->GetLineStyle() << std::endl;
   f2_obs->SetLineColor(kRed);
   for (int y = 0; y < nChan; y++) {
      for (int x = 0; x < nChan; x++) {
         float X = x*step;
         float Y = y*step;
         //h2->SetBinContent(x+1, y+1, med[x][y]*(hutXsec*pow(X, 2)+hctXsec*pow(Y, 2)));
         //h2->SetBinContent(x+1, y+1, med[x][y]*xsec);
         /*
         if (type == "med")
             h2->SetBinContent(x+1, y+1, med[y][x]);
         else if (type == "s1m")
             h2->SetBinContent(x+1, y+1, s1m[y][x]);
        else if (type == "s1p")
             h2->SetBinContent(x+1, y+1, s1p[y][x]);
         else if (type == "obs")
             h2->SetBinContent(x+1, y+1, obs[y][x]);
         else if (type == "all")
             h2->SetBinContent(x+1, y+1, 0.0);
         else if (type == "ALL") {
             h2->SetBinContent(x+1, y+1, med[y][x]);
             h2_s1m->SetBinContent(x+1, y+1, s1m[y][x]);
             h2_s1p->SetBinContent(x+1, y+1, s1p[y][x]);
             h2_obs->SetBinContent(x+1, y+1, obs[y][x]);
         }
         */
         /*
         double kx, ky;
         if (x == 0) kx = 0.0;
         else if (x == 1) kx = 0.05;
         else if (x == 2) kx = 0.1;
         else if (x == 3) kx = 0.3;
         if (y == 0) ky = 0.0;
         else if (y == 1) ky = 0.05;
         else if (y == 2) ky = 0.1;
         else if (y == 3) ky = 0.3;
         */
         //kx = 1/sqrt(10);
         //ky = 1/sqrt(10);
         //kx *= 0.31622776601;
         //ky *= 0.31622776601;
         /*
         if (type == "med")
             h2->SetBinContent(x+1, y+1, med[y][x]*(50.82*pow(kx, 2)+38.88*pow(ky, 2)));
         else if (type == "s1m")
             h2->SetBinContent(x+1, y+1, s1m[y][x]*(50.82*pow(kx, 2)+38.88*pow(ky, 2)));
         else if (type == "s1p")
             h2->SetBinContent(x+1, y+1, s1p[y][x]*(50.82*pow(kx, 2)+38.88*pow(ky, 2)));
         else if (type == "obs")
             h2->SetBinContent(x+1, y+1, obs[y][x]*(50.82*pow(kx, 2)+38.88*pow(ky, 2)));
         else if (type == "all")
             h2->SetBinContent(x+1, y+1, 0.0);
         else if (type == "ALL") {
             h2->SetBinContent(x+1, y+1, med[y][x]*(50.82*pow(kx, 2)+38.88*pow(ky, 2)));
             h2_s1m->SetBinContent(x+1, y+1, s1m[y][x]*(50.82*pow(kx, 2)+38.88*pow(ky, 2)));
             h2_s1p->SetBinContent(x+1, y+1, s1p[y][x]*(50.82*pow(kx, 2)+38.88*pow(ky, 2)));
             h2_obs->SetBinContent(x+1, y+1, obs[y][x]*(50.82*pow(kx, 2)+38.88*pow(ky, 2)));
         }
         */
         if (type == "med")
             h2->SetBinContent(x+1, y+1, med[y][x]);
         else if (type == "s1m")
             h2->SetBinContent(x+1, y+1, s1m[y][x]);
         else if (type == "s1p")
             h2->SetBinContent(x+1, y+1, s1p[y][x]);
         else if (type == "s2m")
             h2->SetBinContent(x+1, y+1, s2m[y][x]);
         else if (type == "s2p")
             h2->SetBinContent(x+1, y+1, s2p[y][x]);
         else if (type == "obs")
             h2->SetBinContent(x+1, y+1, obs[y][x]);
         else if (type == "all")
             h2->SetBinContent(x+1, y+1, 0.0);
         else if (type == "ALL") {
             h2->SetBinContent(x+1, y+1, med[y][x]);
             h2_s1m->SetBinContent(x+1, y+1, s1m[y][x]);
             h2_s1p->SetBinContent(x+1, y+1, s1p[y][x]);
             h2_s2m->SetBinContent(x+1, y+1, s2m[y][x]);
             h2_s2p->SetBinContent(x+1, y+1, s2p[y][x]);
             h2_obs->SetBinContent(x+1, y+1, obs[y][x]);
         }
         /*
         if (type == "med")
             h2->SetBinContent(x+1, y+1, med[y][x]*(50.82/10+38.88/10));
         else if (type == "s1m")
             h2->SetBinContent(x+1, y+1, s1m[y][x]*(50.82/10+38.88/10));
         else if (type == "s1p")
             h2->SetBinContent(x+1, y+1, s1p[y][x]*(50.82/10+38.88/10));
         else if (type == "obs")
             h2->SetBinContent(x+1, y+1, obs[y][x]*(50.82/10+38.88/10));
         else if (type == "all")
             h2->SetBinContent(x+1, y+1, 0.0);
         else if (type == "ALL") {
             h2->SetBinContent(x+1, y+1, med[y][x]*(50.82/10+38.88/10));
             h2_s1m->SetBinContent(x+1, y+1, s1m[y][x]*(50.82/10+38.88/10));
             h2_s1p->SetBinContent(x+1, y+1, s1p[y][x]*(50.82/10+38.88/10));
             h2_obs->SetBinContent(x+1, y+1, obs[y][x]*(50.82/10+38.88/10));
         }
         */
         /*
         if (name == "ST") {
             if (type == "med")
                 h2->SetBinContent(x+1, y+1, med[y][x]*(13.84/10));
             else if (type == "s1p")
                 h2->SetBinContent(x+1, y+1, s1p[y][x]*(13.84/10));
             else if (type == "s1m")
                 h2->SetBinContent(x+1, y+1, s1m[y][x]*(13.84/10));
             else if (type == "obs")
                 h2->SetBinContent(x+1, y+1, obs[y][x]*(13.84/10));
             else if (type == "all")
                 h2->SetBinContent(x+1, y+1, 0.0);
         }
         else if (name == "TT") {
             if (type == "med")
                 h2->SetBinContent(x+1, y+1, med[y][x]*(36.98/10));
             else if (type == "s1p")
                 h2->SetBinContent(x+1, y+1, s1p[y][x]*(36.98/10));
             else if (type == "s1m")
                 h2->SetBinContent(x+1, y+1, s1m[y][x]*(36.98/10));
             else if (type == "obs")
                 h2->SetBinContent(x+1, y+1, obs[y][x]*(36.98/10));
             else if (type == "all")
                 h2->SetBinContent(x+1, y+1, 0.0);
         }
         else {
             if (type == "med")
                 h2->SetBinContent(x+1, y+1, med[y][x]*(13.84/10+36.98/10));
             else if (type == "s1p")
                 h2->SetBinContent(x+1, y+1, s1p[y][x]*(13.84/10+36.98/10));
             else if (type == "s1m")
                 h2->SetBinContent(x+1, y+1, s1m[y][x]*(13.84/10+36.98/10));
             else if (type == "obs")
                 h2->SetBinContent(x+1, y+1, obs[y][x]*(13.84/10+36.98/10));
             else if (type == "all")
                 h2->SetBinContent(x+1, y+1, 0.0);
         }
         */
      }
   }

   if (false) {
   for (int xi = 0; xi < h2->GetXaxis()->GetNbins(); xi++) {
       for (int yi = 0; yi < h2->GetXaxis()->GetNbins(); yi++) {
            if (h2->GetBinContent(xi+1, yi+1) == 0) {
                int nm = 0;
                double dm = 0;
                if (h2->GetBinContent(xi+1+1, yi+1) != 0 && xi+1+1 < h2->GetXaxis()->GetNbins()) {
                    dm += h2->GetBinContent(xi+1+1, yi+1);
                    nm += 1;
                }
                if (h2->GetBinContent(xi+1-1, yi+1) != 0 && xi+1-1 > 0) {
                    dm += h2->GetBinContent(xi+1-1, yi+1);
                    nm += 1;
                }
                if (h2->GetBinContent(xi+1, yi+1+1) != 0 && yi+1+1 < h2->GetYaxis()->GetNbins()) {
                    dm += h2->GetBinContent(xi+1, yi+1+1);
                    nm += 1;
                }
                if (h2->GetBinContent(xi+1, yi+1-1) != 0 && yi+1-1 > 0) {
                    dm += h2->GetBinContent(xi+1, yi+1-1);
                    nm += 1;
                }
                //h2->SetBinContent(xi+1, yi+1, mean);
                h2->SetBinContent(xi+1, yi+1, dm/nm);
            }
       }
   }
   h2->SetBinContent(1, 1, h2->GetBinContent(1, 2)+h2->GetBinContent(2, 1));
   for (int xi = 0; xi < h2_s1m->GetXaxis()->GetNbins(); xi++) {
       for (int yi = 0; yi < h2_s1m->GetXaxis()->GetNbins(); yi++) {
            if (h2_s1m->GetBinContent(xi+1, yi+1) == 0) {
                int nm = 0;
                double dm = 0;
                if (h2_s1m->GetBinContent(xi+1+1, yi+1) != 0 && xi+1+1 < h2_s1m->GetXaxis()->GetNbins()) {
                    dm += h2_s1m->GetBinContent(xi+1+1, yi+1);
                    nm += 1;
                }
                if (h2_s1m->GetBinContent(xi+1-1, yi+1) != 0 && xi+1-1 > 0) {
                    dm += h2_s1m->GetBinContent(xi+1-1, yi+1);
                    nm += 1;
                }
                if (h2_s1m->GetBinContent(xi+1, yi+1+1) != 0 && yi+1+1 < h2_s1m->GetYaxis()->GetNbins()) {
                    dm += h2_s1m->GetBinContent(xi+1, yi+1+1);
                    nm += 1;
                }
                if (h2_s1m->GetBinContent(xi+1, yi+1-1) != 0 && yi+1-1 > 0) {
                    dm += h2_s1m->GetBinContent(xi+1, yi+1-1);
                    nm += 1;
                }
                //h2_s1m->SetBinContent(xi+1, yi+1, mean);
                h2_s1m->SetBinContent(xi+1, yi+1, dm/nm);
            }
       }
   }
   h2_s1m->SetBinContent(1, 1, h2_s1m->GetBinContent(1, 2)+h2_s1m->GetBinContent(2, 1));
   for (int xi = 0; xi < h2_s1p->GetXaxis()->GetNbins(); xi++) {
       for (int yi = 0; yi < h2_s1p->GetXaxis()->GetNbins(); yi++) {
            if (h2_s1p->GetBinContent(xi+1, yi+1) == 0) {
                int nm = 0;
                double dm = 0;
                if (h2_s1p->GetBinContent(xi+1+1, yi+1) != 0 && xi+1+1 < h2_s1p->GetXaxis()->GetNbins()) {
                    dm += h2_s1p->GetBinContent(xi+1+1, yi+1);
                    nm += 1;
                }
                if (h2_s1p->GetBinContent(xi+1-1, yi+1) != 0 && xi+1-1 > 0) {
                    dm += h2_s1p->GetBinContent(xi+1-1, yi+1);
                    nm += 1;
                }
                if (h2_s1p->GetBinContent(xi+1, yi+1+1) != 0 && yi+1+1 < h2_s1p->GetYaxis()->GetNbins()) {
                    dm += h2_s1p->GetBinContent(xi+1, yi+1+1);
                    nm += 1;
                }
                if (h2_s1p->GetBinContent(xi+1, yi+1-1) != 0 && yi+1-1 > 0) {
                    dm += h2_s1p->GetBinContent(xi+1, yi+1-1);
                    nm += 1;
                }
                //h2_s1p->SetBinContent(xi+1, yi+1, mean);
                h2_s1p->SetBinContent(xi+1, yi+1, dm/nm);
            }
       }
   }
   h2_s1p->SetBinContent(1, 1, h2_s1p->GetBinContent(1, 2)+h2_s1p->GetBinContent(2, 1));
   for (int xi = 0; xi < h2_obs->GetXaxis()->GetNbins(); xi++) {
       for (int yi = 0; yi < h2_obs->GetXaxis()->GetNbins(); yi++) {
            if (h2_obs->GetBinContent(xi+1, yi+1) == 0) {
                int nm = 0;
                double dm = 0;
                if (h2_obs->GetBinContent(xi+1+1, yi+1) != 0 && xi+1+1 < h2_obs->GetXaxis()->GetNbins()) {
                    dm += h2_obs->GetBinContent(xi+1+1, yi+1);
                    nm += 1;
                }
                if (h2_obs->GetBinContent(xi+1-1, yi+1) != 0 && xi+1-1 > 0) {
                    dm += h2_obs->GetBinContent(xi+1-1, yi+1);
                    nm += 1;
                }
                if (h2_obs->GetBinContent(xi+1, yi+1+1) != 0 && yi+1+1 < h2_obs->GetYaxis()->GetNbins()) {
                    dm += h2_obs->GetBinContent(xi+1, yi+1+1);
                    nm += 1;
                }
                if (h2_obs->GetBinContent(xi+1, yi+1-1) != 0 && yi+1-1 > 0) {
                    dm += h2_obs->GetBinContent(xi+1, yi+1-1);
                    nm += 1;
                }
                //h2_obs->SetBinContent(xi+1, yi+1, mean);
                h2_obs->SetBinContent(xi+1, yi+1, dm/nm);
            }
       }
   }
   h2_obs->SetBinContent(1, 1, h2_obs->GetBinContent(1, 2)+h2_obs->GetBinContent(2, 1));
   }

   if (false) {
   for (int xi = 0; xi < h2->GetXaxis()->GetNbins(); xi++) {
       for (int yi = 0; yi < h2->GetXaxis()->GetNbins(); yi++) {
            if (h2->GetBinContent(xi+1, yi+1) < 0.1) {
                int nm = 0;
                double dm = 0;
                if (h2->GetBinContent(xi+1+1, yi+1) > 0.1 && xi+1+1 < h2->GetXaxis()->GetNbins()) {
                    dm += h2->GetBinContent(xi+1+1, yi+1);
                    nm += 1;
                }
                if (h2->GetBinContent(xi+1-1, yi+1) > 0.1 && xi+1-1 > 0) {
                    dm += h2->GetBinContent(xi+1-1, yi+1);
                    nm += 1;
                }
                if (h2->GetBinContent(xi+1, yi+1+1) > 0.1 && yi+1+1 < h2->GetYaxis()->GetNbins()) {
                    dm += h2->GetBinContent(xi+1, yi+1+1);
                    nm += 1;
                }
                if (h2->GetBinContent(xi+1, yi+1-1) > 0.1 && yi+1-1 > 0) {
                    dm += h2->GetBinContent(xi+1, yi+1-1);
                    nm += 1;
                }
                //h2->SetBinContent(xi+1, yi+1, mean);
                h2->SetBinContent(xi+1, yi+1, dm/nm);
            }
       }
   }
   //h2->SetBinContent(1, 1, h2->GetBinContent(1, 2)+h2->GetBinContent(2, 1));
   h2->SetBinContent(1, 1, 0.0);
   for (int xi = 0; xi < h2_s1m->GetXaxis()->GetNbins(); xi++) {
       for (int yi = 0; yi < h2_s1m->GetXaxis()->GetNbins(); yi++) {
            if (h2_s1m->GetBinContent(xi+1, yi+1) < 0.1) {
                int nm = 0;
                double dm = 0;
                if (h2_s1m->GetBinContent(xi+1+1, yi+1) > 0.1 && xi+1+1 < h2_s1m->GetXaxis()->GetNbins()) {
                    dm += h2_s1m->GetBinContent(xi+1+1, yi+1);
                    nm += 1;
                }
                if (h2_s1m->GetBinContent(xi+1-1, yi+1) > 0.1 && xi+1-1 > 0) {
                    dm += h2_s1m->GetBinContent(xi+1-1, yi+1);
                    nm += 1;
                }
                if (h2_s1m->GetBinContent(xi+1, yi+1+1) > 0.1 && yi+1+1 < h2_s1m->GetYaxis()->GetNbins()) {
                    dm += h2_s1m->GetBinContent(xi+1, yi+1+1);
                    nm += 1;
                }
                if (h2_s1m->GetBinContent(xi+1, yi+1-1) > 0.1 && yi+1-1 > 0) {
                    dm += h2_s1m->GetBinContent(xi+1, yi+1-1);
                    nm += 1;
                }
                //h2_s1m->SetBinContent(xi+1, yi+1, mean);
                h2_s1m->SetBinContent(xi+1, yi+1, dm/nm);
            }
       }
   }
   //h2_s1m->SetBinContent(1, 1, h2_s1m->GetBinContent(1, 2)+h2_s1m->GetBinContent(2, 1));
   h2_s1m->SetBinContent(1, 1, 0.0);
   for (int xi = 0; xi < h2_s1p->GetXaxis()->GetNbins(); xi++) {
       for (int yi = 0; yi < h2_s1p->GetXaxis()->GetNbins(); yi++) {
            if (h2_s1p->GetBinContent(xi+1, yi+1) < 0.1) {
                int nm = 0;
                double dm = 0;
                if (h2_s1p->GetBinContent(xi+1+1, yi+1) > 0.1 && xi+1+1 < h2_s1p->GetXaxis()->GetNbins()) {
                    dm += h2_s1p->GetBinContent(xi+1+1, yi+1);
                    nm += 1;
                }
                if (h2_s1p->GetBinContent(xi+1-1, yi+1) > 0.1 && xi+1-1 > 0) {
                    dm += h2_s1p->GetBinContent(xi+1-1, yi+1);
                    nm += 1;
                }
                if (h2_s1p->GetBinContent(xi+1, yi+1+1) > 0.1 && yi+1+1 < h2_s1p->GetYaxis()->GetNbins()) {
                    dm += h2_s1p->GetBinContent(xi+1, yi+1+1);
                    nm += 1;
                }
                if (h2_s1p->GetBinContent(xi+1, yi+1-1) > 0.1 && yi+1-1 > 0) {
                    dm += h2_s1p->GetBinContent(xi+1, yi+1-1);
                    nm += 1;
                }
                //h2_s1p->SetBinContent(xi+1, yi+1, mean);
                h2_s1p->SetBinContent(xi+1, yi+1, dm/nm);
            }
       }
   }
   //h2_s1p->SetBinContent(1, 1, h2_s1p->GetBinContent(1, 2)+h2_s1p->GetBinContent(2, 1));
   h2_s1p->SetBinContent(1, 1, 0.0);
   for (int xi = 0; xi < h2_obs->GetXaxis()->GetNbins(); xi++) {
       for (int yi = 0; yi < h2_obs->GetXaxis()->GetNbins(); yi++) {
            if (h2_obs->GetBinContent(xi+1, yi+1) < 0.1) {
                int nm = 0;
                double dm = 0;
                if (h2_obs->GetBinContent(xi+1+1, yi+1) > 0.1 && xi+1+1 < h2_obs->GetXaxis()->GetNbins()) {
                    dm += h2_obs->GetBinContent(xi+1+1, yi+1);
                    nm += 1;
                }
                if (h2_obs->GetBinContent(xi+1-1, yi+1) > 0.1 && xi+1-1 > 0) {
                    dm += h2_obs->GetBinContent(xi+1-1, yi+1);
                    nm += 1;
                }
                if (h2_obs->GetBinContent(xi+1, yi+1+1) > 0.1 && yi+1+1 < h2_obs->GetYaxis()->GetNbins()) {
                    dm += h2_obs->GetBinContent(xi+1, yi+1+1);
                    nm += 1;
                }
                if (h2_obs->GetBinContent(xi+1, yi+1-1) > 0.1 && yi+1-1 > 0) {
                    dm += h2_obs->GetBinContent(xi+1, yi+1-1);
                    nm += 1;
                }
                //h2_obs->SetBinContent(xi+1, yi+1, mean);
                h2_obs->SetBinContent(xi+1, yi+1, dm/nm);
            }
       }
   }
   //h2_obs->SetBinContent(1, 1, h2_obs->GetBinContent(1, 2)+h2_obs->GetBinContent(2, 1));
   h2_obs->SetBinContent(1, 1, 0.0);
   }

   double params[] = {h2->GetBinContent(2, 2), 1.1, 0.0, 0.9, 0.0, 0.03};
   double params_s1m[] = {h2_s1m->GetBinContent(2, 2), 1.1, 0.0, 0.9, 0.0, 0.03};
   double params_s1p[] = {h2_s1p->GetBinContent(2, 2), 1.1, 0.0, 0.9, 0.0, 0.03};
   double params_s2m[] = {h2_s2m->GetBinContent(2, 2), 1.1, 0.0, 0.9, 0.0, 0.03};
   double params_s2p[] = {h2_s2p->GetBinContent(2, 2), 1.1, 0.0, 0.9, 0.0, 0.03};
   double params_obs[] = {h2_obs->GetBinContent(2, 2), 1.1, 0.0, 0.9, 0.0, 0.03};
   double *paramsa[] = {params, params_s1m, params_s1p, params_s1m, params_s1p, params_obs};
   //double params[] = {1,0, 1.1, 0.0, 0.9, 0.0};
   TF2 *fta[] = {f2, f2_s1m, f2_s1p, f2_s2m, f2_s2p, f2_obs}, *f2t;
   TH2F *hta[] = {h2, h2_s1m, h2_s1p, h2_s2m, h2_s2p, h2_obs}, *h2t;
   for (int tfi = 0; tfi < 6; tfi++) {
       f2t = fta[tfi];
       h2t = hta[tfi];
       f2t->SetParameters(paramsa[tfi]);
       f2t->FixParameter(2, 0.0);
       f2t->FixParameter(4, 0.0);
       //f2t->SetParLimits(1, 0.0, 4.0);
       //f2t->SetParLimits(3, 0.0, 4.0);
   }

   double Limit = limit;
   f2->SetContour(1, &Limit);
   f2_s1m->SetContour(1, &Limit);
   f2_s1p->SetContour(1, &Limit);
   f2_s2m->SetContour(1, &Limit);
   f2_s2p->SetContour(1, &Limit);
   f2_obs->SetContour(1, &Limit);
   if (type == "ALL") {
       //h2->Fit("f2");
       //h2_s1m->Fit("f2_s1m");
       //h2_s1p->Fit("f2_s1p");
       //h2_s2m->Fit("f2_s2m");
       //h2_s2p->Fit("f2_s2p");
       //h2_obs->Fit("f2_obs");
//       for (int pi = 0; pi < f2->GetNpar(); pi++) {
//           f2_obs->SetParameter(pi, f2->GetParameter(pi));
//           if (pi == 1 || pi == 3) f2_obs->SetParLimits(pi, 0, 0.01);
//           //double dapar = fabs(f2->GetParameter(pi))/4;
//           //f2_obs->SetParLimits(pi, f2_obs->GetParameter(pi)-dapar, f2_obs->GetParameter(pi)+dapar);
//       }
//       h2_obs->Fit("f2_obs");
       std::cout << "PARAMETERS" << std::endl;
       for (int pi = 0; pi < f2->GetNpar(); pi++) std::cout << f2->GetParameter(pi) << " "; std::cout << std::endl;
       for (int pi = 0; pi < f2->GetNpar(); pi++) std::cout << f2_s1m->GetParameter(pi) << " "; std::cout << std::endl;
       for (int pi = 0; pi < f2->GetNpar(); pi++) std::cout << f2_s1p->GetParameter(pi) << " "; std::cout << std::endl;
       for (int pi = 0; pi < f2->GetNpar(); pi++) std::cout << f2_s2m->GetParameter(pi) << " "; std::cout << std::endl;
       for (int pi = 0; pi < f2->GetNpar(); pi++) std::cout << f2_s2p->GetParameter(pi) << " "; std::cout << std::endl;
       for (int pi = 0; pi < f2->GetNpar(); pi++) std::cout << f2_obs->GetParameter(pi) << " "; std::cout << std::endl;
       std::cout << std::endl;
       std::cout << std::endl;
   }
   else
       //h2->Fit("f2");
       ;

   /*
   h2->GetXaxis()->SetRangeUser(-0.0, 0.28);
   h2->GetYaxis()->SetRangeUser(-0.0, 0.28);
   h2_s1m->GetXaxis()->SetRangeUser(-0.0, 0.28);
   h2_s1m->GetYaxis()->SetRangeUser(-0.0, 0.28);
   h2_s1p->GetXaxis()->SetRangeUser(-0.0, 0.28);
   h2_s1p->GetYaxis()->SetRangeUser(-0.0, 0.28);
   h2_obs->GetXaxis()->SetRangeUser(-0.0, 0.28);
   h2_obs->GetYaxis()->SetRangeUser(-0.0, 0.28);

   f2->GetXaxis()->SetRangeUser(-0.0, 0.28);
   f2->GetYaxis()->SetRangeUser(-0.0, 0.28);
   f2_s1m->GetXaxis()->SetRangeUser(-0.0, 0.28);
   f2_s1m->GetYaxis()->SetRangeUser(-0.0, 0.28);
   f2_s1p->GetXaxis()->SetRangeUser(-0.0, 0.28);
   f2_s1p->GetYaxis()->SetRangeUser(-0.0, 0.28);
   f2_obs->GetXaxis()->SetRangeUser(-0.0, 0.28);
   f2_obs->GetYaxis()->SetRangeUser(-0.0, 0.28);
   */

   TCanvas *c1 = new TCanvas("c1", "c1");
   //h2->Draw("COLZ TEXT");
   //h2->Draw("COLZ");
   //h2->Draw("COL");
   //h2->Draw("COL TEXT");
   if (type == "ALL") {
       h2->SetMarkerSize(0);
       h2_s1m->SetMarkerSize(0);
       h2_s1p->SetMarkerSize(0);
       h2_s2m->SetMarkerSize(0);
       h2_s2p->SetMarkerSize(0);
       h2_obs->SetMarkerSize(0);
       h2->Draw("TEXT");
       h2_s1p->Draw("TEXT SAME");
       h2_s1m->Draw("TEXT SAME");
       h2_s2p->Draw("TEXT SAME");
       h2_s2m->Draw("TEXT SAME");
       h2_obs->Draw("TEXT SAME");
   }
   else
       h2->Draw();


   h2->GetXaxis()->SetTitle("#kappa_{Hut}");
   h2->GetYaxis()->SetTitle("#kappa_{Hct}");

   /*
   h2->GetYaxis()->SetLabelOffset(10);
   h2->GetXaxis()->SetLabelOffset(10);
   TText *txy = new TText();
   txy->SetTextAlign(32);
   txy->SetTextSize(h2->GetXaxis()->GetLabelSize());
   txy->SetTextFont(h2->GetXaxis()->GetLabelFont());
   TText *txx = new TText();
   txx->SetTextAlign(22);
   txx->SetTextSize(h2->GetXaxis()->GetLabelSize());
   txx->SetTextFont(h2->GetXaxis()->GetLabelFont());
   const char *xylabels[] = {"0","0.05","0.1","0.3"};
   double xposition = h2->GetXaxis()->GetXmin()-(h2->GetXaxis()->GetXmax()+h2->GetXaxis()->GetXmax())/50;
   for (int i = 0; i < h2->GetXaxis()->GetNbins(); i++)
       txy->DrawText(xposition, h2->GetYaxis()->GetBinCenter(i+1), xylabels[i]);
   double yposition = 1.2*h2->GetYaxis()->GetXmin()-(h2->GetYaxis()->GetXmax()+h2->GetYaxis()->GetXmax())/50;
   for (int i = 0; i < h2->GetYaxis()->GetNbins(); i++)
       txx->DrawText(h2->GetXaxis()->GetBinCenter(i+1), yposition, xylabels[i]);
   */
   TCanvas *c2 = new TCanvas("c2", "c2");
   if (type == "ALL") {
       f2->Draw();
       f2_s1m->Draw("SAME");
       f2_s1p->Draw("SAME");
       f2_s2m->Draw("SAME");
       f2_s2p->Draw("SAME");
       f2_obs->Draw("SAME");
   }
   else
       f2->Draw();

   f2->GetXaxis()->SetTitle("#kappa_{Hut}");
   f2->GetYaxis()->SetTitle("#kappa_{Hct}");

   TLegend *leg;
   //leg = new TLegend(0.50,0.90,0.90,0.60);
   leg = new TLegend(0.60,0.90,0.95,0.60);
   leg->SetFillStyle(0);
   leg->SetBorderSize(0);

   //leg->AddEntry(f2,"Median expected limit = 1.0","l");
   //leg->AddEntry(f2_s1m,"#pm 1#sigma expected limit = 1.0","l");
   //leg->AddEntry(f2_obs,"Observed limit = 1.0","l");
   leg->AddEntry(f2,"Expected","l");
   leg->AddEntry(f2_s1m,"Expected #pm 1#sigma","l");
   leg->AddEntry(f2_s2m,"Expected #pm 2#sigma","l");
   leg->AddEntry(f2_obs,"Observed","l");
   leg->Draw();

   TLatex *tex = new TLatex(0.1969,0.906825,"CMS");
   tex->SetNDC();
   tex->SetTextAlign(13);
   tex->SetTextFont(61);
   tex->SetTextSize(0.07475);
   tex->SetLineWidth(2);
   tex->Draw();

   //TLatex *text1 = new TLatex(0.98,0.95125,"36 fb^{-1}, #sqrt{s} = 13 TeV");
   TLatex *text1 = new TLatex(0.98,0.95125,"36 fb^{-1} (13 TeV)");
   text1->SetNDC();
   text1->SetTextAlign(31);
   text1->SetTextFont(42);
   text1->SetTextSize(0.04875);
   text1->SetLineWidth(2);
   text1->Draw();

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
   //TF2 *f2 = new TF2("f2", "[0]+[1]*(x+1)**(-1)+[2]*(x+1)**(-2)+[3]*(x+1)**(-3)+[4]*(x+1)**(-4)+[5]*(y+1)**(-1)+[6]*(y+1)**(-2)+[7]*(y+1)**(-3)+[8]*(y+1)**(-4)", 0.0, 1.0, 0.0, 1.0);
   //TF2 *f2 = new TF2("f2", "[0]+[1]*x+[2]*x**2+[3]*x**3+[4]*x**4+[5]*x**5+[6]*y+[7]*y**2+[8]*y**3+[9]*y**4+[10]*y**5", -0.025, 0.475, -0.025, 0.475);
   //TF2 *f2 = new TF2("f2", "[0]+[1]*x+[2]*x**2+[3]*x**3+[4]*x**4+[5]*y+[6]*y**2+[7]*y**3+[8]*y**4", -0.025, 0.475, -0.025, 0.475);
   //TF2 *fint = new TF2("fint", finter, 0.0, 1.0, 0);
   //double xint = fint->GetMinimumX();
   //double limit = 0.5;
   //double limit = 1.2;
   //double limit = 1.0;
   //double limit = 1.0;
   //double limit = 0.1;

   /*
   TText *xlabel = new TText();
   xlabel-> SetNDC();
   xlabel -> SetTextFont(1);
   xlabel -> SetTextColor(1);
   xlabel -> SetTextSize(0.03);
   xlabel -> SetTextAlign(22);
   xlabel -> SetTextAngle(0);
   xlabel -> DrawText(0.5, 0.04, ("limit = "+to_string_with_precision(limit, 2)).c_str());
   */
   
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

   c1->SetLogz();
   c1->Print(("pics/LimitComb"+coup+".png").c_str());
   c1->Print(("pics/LimitComb"+coup+".pdf").c_str());

   c2->SetLogz();
   c2->Print(("pics/fLimitComb"+coup+".png").c_str());
   c2->Print(("pics/fLimitComb"+coup+".pdf").c_str());

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
