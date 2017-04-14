TStyle* PlotStyle();
TStyle* PlotStyleCMS();
void SetPlotStyle();

//void limitXsecCat()
void limitXsecCat2D(std::string coup = "2D", double ymin = 0.0, double ymax = 200.)
{
   gROOT->SetBatch(1);

   SetPlotStyle();

   const int nChan = 5;

   float xsec = (50.82+38.88)/2;
   
   float xbins[nChan];
   for(int j=0;j<=nChan;j++)
     {
	xbins[j] = j;
     }

   float med[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
  
 
   #include "limits.h"


   for (int i = 0; i < 5; i++) {
       /*
       if (coup == "Hct") {
           s2m[i] = s2m[i]/(0.11+2*4.892)*(13.84+2*36.98);
           s1m[i] = s1m[i]/(0.11+2*4.892)*(13.84+2*36.98);
           med[i] = med[i]/(0.11+2*4.892)*(13.84+2*36.98);
           s1p[i] = s1p[i]/(0.11+2*4.892)*(13.84+2*36.98);
           s2p[i] = s2p[i]/(0.11+2*4.892)*(13.84+2*36.98);
       }
       else {
           s2m[i] = s2m[i]/(0.88+2*4.892)*(13.84+2*36.98);
           s1m[i] = s1m[i]/(0.88+2*4.892)*(13.84+2*36.98);
           med[i] = med[i]/(0.88+2*4.892)*(13.84+2*36.98);
           s1p[i] = s1p[i]/(0.88+2*4.892)*(13.84+2*36.98);
           s2p[i] = s2p[i]/(0.88+2*4.892)*(13.84+2*36.98);
       }
       */
       /*
       if (coup == "Hct") {
           s2m[i] = s2m[i]*(0.11+2*4.892)/(13.84+2*36.98);
           s1m[i] = s1m[i]*(0.11+2*4.892)/(13.84+2*36.98);
           med[i] = med[i]*(0.11+2*4.892)/(13.84+2*36.98);
           s1p[i] = s1p[i]*(0.11+2*4.892)/(13.84+2*36.98);
           s2p[i] = s2p[i]*(0.11+2*4.892)/(13.84+2*36.98);
       }
       else {
           s2m[i] = s2m[i]*(0.88+2*4.892)/(13.84+2*36.98);
           s1m[i] = s1m[i]*(0.88+2*4.892)/(13.84+2*36.98);
           med[i] = med[i]*(0.88+2*4.892)/(13.84+2*36.98);
           s1p[i] = s1p[i]*(0.88+2*4.892)/(13.84+2*36.98);
           s2p[i] = s2p[i]*(0.88+2*4.892)/(13.84+2*36.98);
       }
       */
   }

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
   
   hLimitXsec[0]->GetXaxis()->SetBinLabel(1,"b2j3");
   hLimitXsec[0]->GetXaxis()->SetBinLabel(2,"b2j4");
   //hLimitXsec[0]->GetXaxis()->SetBinLabel(2,"b3j3");
   hLimitXsec[0]->GetXaxis()->SetBinLabel(3,"b3j3");
   //hLimitXsec[0]->GetXaxis()->SetBinLabel(3,"b2j4");
   hLimitXsec[0]->GetXaxis()->SetBinLabel(4,"b3j4");
   hLimitXsec[0]->GetXaxis()->SetBinLabel(5,"b4j4");
   
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

   ////////////////////////////////////////////////////////////////////


   
   //std::string picname = "pics/LimitXsec.eps";
   //c1->Print(picname.c_str());
   std::string picname = "pics/LimitComp_"+coup+"_1.eps";
   c1->Print(picname.c_str());
   picname = "pics/LimitComp_"+coup+"_1.png";
   c1->Print(picname.c_str());
   picname = "pics/LimitComp_"+coup+"_1.pdf";
   c1->Print(picname.c_str());
   c1->Clear();
   
   delete c1;
   delete leg;
     
   gApplication->Terminate();
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
