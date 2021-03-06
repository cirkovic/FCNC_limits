#include <iostream>
#include <sstream>
#include <fstream>

#include "TROOT.h"
#include "TCanvas.h"
#include "TGraph.h"
#include "TPolyLine.h"
#include "TLatex.h"
#include "TLegend.h"
#include "TH1D.h"
#include "TF1.h"
#include <math.h>

#include "PlotStyle.h"

int main(int argc, const char *argv[])
{
   SetPlotStyle();
   
   //std::string intL = "12.9";
   //std::string intL = "36.8";
   std::string intL = "36";
   std::string ener = "13";
   bool drawObs = 1;

   const int nMax = 1000;
   double co[nMax];
   std::string sttt = std::string(argv[4]);

   double xsecAtT = 50.82; if (sttt == "ST") xsecAtT = 13.84; else xsecAtT = 36.98;
   //double xsecAtT = 50.82*sqrt(0.1);
   //double xsecAtT = 50.82*0.1;
   //double xsecAtT = 1.0;
   //double xsecAt1 = 50.82;
   double xsecAt1 = 50.82/10; if (sttt == "ST") xsecAt1 = 13.84/10; else xsecAt1 = 36.98/10;
   //double xsecAt1 = 1.0;
   //double xsecAtT = 1.0;
   //double xsecAtT = 0.1;
//   double xsecAtT = 10.;
//   double xsecAt1 = 1.0;
   //double xsecAt1 = 0.88+2*4.892;
   /////////////////////////////////////
   /*
   double obsAt1 = 0.0437;
   double s2mAt1 = 0.2024;
   double s1mAt1 = 0.2418;
   double medAt1 = 0.2705;
   double s1pAt1 = 0.3039;
   double s2pAt1 = 0.3657;
   */
   /*
   double obsAt1 = 0.0003;
   double s2mAt1 = 0.0659;
   double s1mAt1 = 0.4623;
   double medAt1 = 0.5293;
   double s1pAt1 = 0.5314;
   double s2pAt1 = 0.5335;
   */
   #include "limitsHut.h"
   /////////////////////////////////////
   /////////////////////////////////////
   /*
   double obsAt1 = 0.0003;
   double s2mAt1 = 0.0324;
   double s1mAt1 = 0.0432;
   double medAt1 = 0.0601;
   double s1pAt1 = 0.0845;
   double s2pAt1 = 0.1117;
   */
   /////////////////////////////////////
   /*
   obsAt1 = obsAt1*(0.88+2*4.892)/(13.84+2*36.98);
   s2mAt1 = s2mAt1*(0.88+2*4.892)/(13.84+2*36.98);
   s1mAt1 = s1mAt1*(0.88+2*4.892)/(13.84+2*36.98);
   medAt1 = medAt1*(0.88+2*4.892)/(13.84+2*36.98);
   s1pAt1 = s1pAt1*(0.88+2*4.892)/(13.84+2*36.98);
   s2pAt1 = s2pAt1*(0.88+2*4.892)/(13.84+2*36.98);
   */
   /*
   double obsAt1 = 0.0232;
   double s2mAt1 = 0.0098;
   double s1mAt1 = 0.0136;
   double medAt1 = 0.0190;
   double s1pAt1 = 0.0272;
   double s2pAt1 = 0.0373;
   */

/*   double s2mAt1 = 0.0158;
   double s1mAt1 = 0.0199;
   double s1pAt1 = 0.0362;
   double s2pAt1 = 0.0478;*/

   double coupMin = 0.01;
   //double coupMax = 0.2;
   double coupMax = 1.0;
   const int nrm = 30;

   double med[nMax],s2p[nMax],s1p[nMax],s1m[nMax],s2m[nMax],obs[nMax],
     xsec[nMax];   
   
   double step = (coupMax-coupMin)/double(nrm);
   for(int i=0;i<nrm;i++)
     {
	co[i] = coupMin+step*i;
	double fac = co[i]*co[i];
	xsec[i] = xsecAtT*fac;
	med[i] = medAt1;
	s2m[i] = s2mAt1;
	s1m[i] = s1mAt1;
	s1p[i] = s1pAt1;
	s2p[i] = s2pAt1;
	//obs[i] = med[i];
	obs[i] = obsAt1;
     }   
   
   double *coup = co;
   double *theory_xsec = xsec;
   double *mel = med;
   double *sig1_p = s1p;
   double *sig1_n = s1m;
   double *sig2_p = s2p;
   double *sig2_n = s2m;
   double *data = obs;

   const int nel = nrm*2+1;
   double x[nel], y2_p[nel], y2_n[nel], y1_p[nel], y1_n[nel], mel2[nrm], data2[nrm];
   
   for(int i=0;i<nrm;i++)
     {	
	mel2[i] = mel[i] * xsecAt1;
	data2[i] = data[i] * xsecAt1;

	x[i] = coup[i];
	x[nrm+i] = coup[nrm-1-i];

	y2_p[i] = sig2_p[i] * xsecAt1;
	y2_p[nrm+i] = mel[nrm-1-i] * xsecAt1;

	y2_n[i] = sig2_n[i] * xsecAt1;
	y2_n[nrm+i] = mel[nrm-1-i] * xsecAt1;

	y1_p[i] = sig1_p[i] * xsecAt1;
	y1_p[nrm+i] = mel[nrm-1-i] * xsecAt1;
	
	y1_n[i] = sig1_n[i] * xsecAt1;
	y1_n[nrm+i] = mel[nrm-1-i] * xsecAt1;
     }
      
   x[int(nrm*2)] = coup[0];
   y2_p[int(nrm*2)] = sig2_p[0] * xsecAt1;
   y2_n[int(nrm*2)] = sig2_n[0] * xsecAt1;
   y1_p[int(nrm*2)] = sig1_p[0] * xsecAt1;
   y1_n[int(nrm*2)] = sig1_n[0] * xsecAt1;
   
   TCanvas *c1 = new TCanvas();
   c1->SetTopMargin(c1->GetTopMargin()*1.2);

   TGraph *g_mel = new TGraph(nrm,coup,mel2);
   g_mel->SetTitle("");
   g_mel->SetLineColor(kBlack);
   g_mel->SetLineWidth(2);
   g_mel->Draw("AL");
   //g_mel->SetMaximum(500);
   //g_mel->SetMaximum(1);
   g_mel->SetMaximum(std::stof(std::string(argv[1])));
   //g_mel->SetMinimum(0.001);
   g_mel->SetMinimum(std::stof(std::string(argv[2])));

   TGraph *g_data = new TGraph(nrm,coup,data2);
   g_data->SetTitle("");
   g_data->SetLineColor(kRed);
   g_data->SetLineWidth(2);

   for (int k = 0; k < nrm; k++)
       std::cout << "CIRKOVIC: " << k << " " << coup[k] << " " << theory_xsec[k] << std::endl;

   TGraph *g_theory = new TGraph(nrm,coup,theory_xsec);
   g_theory->SetTitle("");
   g_theory->SetLineColor(kBlack);
   g_theory->SetLineStyle(2);
   g_theory->SetLineWidth(2);
   
   TPolyLine *pl2_p = new TPolyLine(nel,x,y2_p);
   pl2_p->SetFillColor(kYellow);
   pl2_p->Draw("fSAME");

   TPolyLine *pl2_n = new TPolyLine(nel,x,y2_n);
   pl2_n->SetFillColor(kYellow);
   pl2_n->Draw("fSAME");

   TPolyLine *pl1_p = new TPolyLine(nel,x,y1_p);
   pl1_p->SetFillColor(kGreen);
   pl1_p->Draw("fSAME");

   TPolyLine *pl1_n = new TPolyLine(nel,x,y1_n);
   pl1_n->SetFillColor(kGreen);
   pl1_n->Draw("fSAME");
   
   g_mel->Draw("L");
   g_mel->GetXaxis()->SetTitle("#font[52]{#kappa_{Hut}}");
//   g_mel->GetXaxis()->SetTitle("#font[52]{#kappa_{Hct}}");
   //g_mel->GetYaxis()->SetTitle("#sigma [pb]");
   g_mel->GetYaxis()->SetTitle("#sigma (95\% CL) [pb]");

   if( drawObs )
     g_data->Draw("L");
   
   g_theory->Draw("L");
   
   TLegend *l1 = new TLegend(0.68,0.64,0.87,0.83);
   l1->SetLineColor(0);
   l1->SetFillStyle(0);
   l1->AddEntry(g_mel,"Expected","l");
   l1->AddEntry(g_theory,"Theory","l");
   l1->AddEntry(pl1_p,"68%","f");
   l1->AddEntry(pl2_p,"95%","f");
   
   if( drawObs )
     l1->AddEntry(g_data,"Observed","l");
   
   l1->SetFillColor(0);
   //std::string intLLab = "#intLdt = "+intL+" fb^{-1}";
   //l1->SetHeader(intLLab.c_str());
   l1->Draw("SAME");

   /*
   TLatex lEner;
   lEner.SetTextSize(0.044);
   lEner.SetNDC();
   lEner.SetTextColor(kBlack);
   std::string enerLab = "#font[42]{#sqrt[]{s} = "+ener+" TeV}";
   lEner.DrawLatex(0.45,0.75,enerLab.c_str());
   */

   //lEner.DrawLatex(0.50,0.83, "Hut");
   TLatex *ctex = new TLatex(0.50, 0.87, "Hut");
   ctex->SetNDC();
   ctex->SetTextAlign(13);
   ctex->SetTextFont(61);
   ctex->SetTextSize(0.07475);
   ctex->SetLineWidth(2);
   ctex->Draw();

   TLatex *tex = new TLatex(0.1969,0.906825,"CMS");
   tex->SetNDC();
   tex->SetTextAlign(13);
   tex->SetTextFont(61);
   tex->SetTextSize(0.07475);
   tex->SetLineWidth(2);
   tex->Draw();

   TLatex *text1 = new TLatex(0.98,0.95125,"36 fb^{-1} (13 TeV)");
   text1->SetNDC();
   text1->SetTextAlign(31);
   text1->SetTextFont(42);
   text1->SetTextSize(0.04875);
   text1->SetLineWidth(2);
   text1->Draw();

   ////////////////////////////////////////////////////////////////////

   TF1 *fa1 = new TF1("fa1", (std::to_string(xsecAtT)+"*x*x").c_str(), 0, coupMax);
   double intersect1 = fa1->GetX(mel2[0]);
   double intersect2 = fa1->GetX(data2[0]);

   if (true) {
   bool DRAW_NUMS = false;
   DRAW_NUMS = std::stoi(std::string(argv[3]));

   std::ofstream myfile;
   myfile.open((std::string("../limitNums_Hut")+std::string(".txt")).c_str(), std::ofstream::out | std::ofstream::app);
   std::string limLine;
   limLine = std::string(" \\\\");

   std::stringstream limLab;
   limLab.precision(4);

   TLatex limLabp2;
   limLabp2.SetTextSize(0.044);
   limLabp2.SetNDC();
   limLabp2.SetTextColor(kBlack);
   limLab.str("");
   limLab << y2_p[0];
   if (DRAW_NUMS) limLabp2.DrawLatex(0.45,0.70,limLab.str().c_str());

   limLine = limLab.str()+limLine;

   TLatex limLabp1;
   limLabp1.SetTextSize(0.044);
   limLabp1.SetNDC();
   limLabp1.SetTextColor(kBlack);
   limLab.str("");
   limLab << y1_p[0];
   if (DRAW_NUMS) limLabp1.DrawLatex(0.45,0.65,limLab.str().c_str());

   limLine = limLab.str()+std::string(" & ")+limLine;

   TLatex lLimit;
   lLimit.SetTextSize(0.044);
   lLimit.SetNDC();
   lLimit.SetTextColor(kBlack);
   limLab.str("");
   limLab << mel2[0];
   limLab << " (" << data2[0] << ")";
   if (DRAW_NUMS) lLimit.DrawLatex(0.45,0.60,limLab.str().c_str());

   limLine = limLab.str()+std::string(" & ")+limLine;

   TLatex limLabm1;
   limLabm1.SetTextSize(0.044);
   limLabm1.SetNDC();
   limLabm1.SetTextColor(kBlack);
   limLab.str("");
   limLab << y1_n[0];
   if (DRAW_NUMS) limLabm1.DrawLatex(0.45,0.55,limLab.str().c_str());

   limLine = limLab.str()+std::string(" & ")+limLine;

   TLatex limLabm2;
   limLabm2.SetTextSize(0.044);
   limLabm2.SetNDC();
   limLabm2.SetTextColor(kBlack);
   limLab.str("");
   limLab << y2_n[0];
   if (DRAW_NUMS) limLabm2.DrawLatex(0.45,0.50,limLab.str().c_str());

   TLatex lCLimit;
   lCLimit.SetTextSize(0.044);
   lCLimit.SetNDC();
   lCLimit.SetTextColor(kBlack);
   limLab.str("");
   limLab << (intersect1);
   limLab << " (" << intersect2 << ")";
   if (DRAW_NUMS) lLimit.DrawLatex(0.45,0.30,limLab.str().c_str());

   TLatex lBRLimit;
   lBRLimit.SetTextSize(0.044);
   lBRLimit.SetNDC();
   lBRLimit.SetTextColor(kBlack);
   limLab.str("");
   limLab << (0.1836*intersect1*intersect1/1.4);
   limLab << " (" << (0.1836*intersect2*intersect2/1.4) << ")";
   if (DRAW_NUMS) lLimit.DrawLatex(0.45,0.25,limLab.str().c_str());

   limLine = limLab.str()+std::string(" & ")+limLine;
   limLine = "        comb"+std::string(" & ")+limLine;

   myfile << limLine << std::endl;
   myfile.close();

   }

   ////////////////////////////////////////////////////////////////////

   c1->SetLogy(1);
   c1->Update();
   c1->Draw();   
   c1->Print("limit_Hut.eps");
   c1->Print("limit_Hut.pdf");
   c1->Print("limit_Hut.png");
}
