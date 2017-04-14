TStyle* PlotStyle();
TStyle* PlotStyleCMS();
void SetPlotStyle();

void limitComp(std::string coup = "Hut", double ymin = 0.0, double ymax = 200.)
{
   gROOT->SetBatch(1);

   SetPlotStyle();

   const int nChan = 5;

   //std::string coup = "Hut";
   //std::string coup = "Hct";

   float xsec = 50.82;
   if( coup == "Hct" ) xsec = 38.88;
   
   float xbins[nChan];
   for(int j=0;j<=nChan;j++)
     {
	xbins[j] = j;
     }

   /*
   // Hut Max
   float med_HutMax[nChan] = {0.1177,0.0630,0.0229,0.0308,0.1313};
   float s1p_HutMax[nChan] = {0.1636,0.0888,0.0314,0.0460,0.1978};
   float s1m_HutMax[nChan] = {0.0853,0.0447,0.0171,0.0204,0.0886};
   float s2p_HutMax[nChan] = {0.2160,0.1197,0.0491,0.0664,0.2868};
   float s2m_HutMax[nChan] = {0.0639,0.0330,0.0140,0.0149,0.0634};
   
   // Hut 2D
   float med_Hut[nChan] = {0.1333,0.0649,0.0435,0.0288,0.1245};
   float s1p_Hut[nChan] = {0.1848,0.0911,0.0660,0.0421,0.1875};
   float s1m_Hut[nChan] = {0.0952,0.0469,0.0292,0.0197,0.0841};
   float s2p_Hut[nChan] = {0.2391,0.1223,0.0942,0.0588,0.2719};
   float s2m_Hut[nChan] = {0.0716,0.0353,0.0200,0.0149,0.0598};

   // HutST
   float med_HutST[nChan] = {0.1079,0.0723,0.0249,0.0308,0.1641};
   float s1p_HutST[nChan] = {0.1539,0.1048,0.0372,0.0450,0.2497};
   float s1m_HutST[nChan] = {0.0759,0.0487,0.0160,0.0210,0.1099};
   float s2p_HutST[nChan] = {0.2104,0.1421,0.0541,0.0636,0.3675};
   float s2m_HutST[nChan] = {0.0561,0.0359,0.0113,0.0159,0.0779};

   // HutTT
   float med_HutTT[nChan] = {0.1021,0.0630,0.0337,0.0337,0.1714};
   float s1p_HutTT[nChan] = {0.1631,0.0863,0.0463,0.0495,0.2527};
   float s1m_HutTT[nChan] = {0.0854,0.0431,0.0233,0.0227,0.1188};
   float s2p_HutTT[nChan] = {0.2212,0.1213,0.0704,0.0714,0.3628};
   float s2m_HutTT[nChan] = {0.0682,0.0320,0.0166,0.0166,0.0867};

   // Hct Max
   float med_HctMax[nChan] = {0.1753,0.1401,0.0347,0.0347,0.0815};
   float s1p_HctMax[nChan] = {0.2487,0.1999,0.0571,0.0504,0.1381};
   float s1m_HctMax[nChan] = {0.1241,0.0993,0.0322,0.0243,0.0553};
   float s2p_HctMax[nChan] = {0.3364,0.2715,0.0771,0.0706,0.2196};
   float s2m_HctMax[nChan] = {0.0918,0.0736,0.0171,0.0176,0.0379};
   
   // Hct 2D
   float med_Hct[nChan] = {0.1648,0.1206,0.0835,0.0366,0.0620};
   float s1p_Hct[nChan] = {0.2378,0.1807,0.1138,0.0533,0.0961};
   float s1m_Hct[nChan] = {0.1216,0.0947,0.0677,0.0256,0.0415};
   float s2p_Hct[nChan] = {0.2841,0.2308,0.1472,0.0746,0.1460};
   float s2m_Hct[nChan] = {0.0911,0.0796,0.0610,0.0186,0.0296};

   // HctST
   float med_HctST[nChan] = {0.1763,0.1304,0.0347,0.0435,0.0962};
   float s1p_HctST[nChan] = {0.2514,0.1849,0.0554,0.0632,0.1434};
   float s1m_HctST[nChan] = {0.1246,0.0928,0.0245,0.0298,0.0672};
   float s2p_HctST[nChan] = {0.3370,0.2502,0.0792,0.0888,0.2104};
   float s2m_HctST[nChan] = {0.0926,0.0695,0.0171,0.0221,0.0492};

   // HctTT
   float med_HctTT[nChan] = {0.2236,0.1353,0.0562,0.0337,0.0581};
   float s1p_HctTT[nChan] = {0.3172,0.1940,0.0575,0.0495,0.0901};
   float s1m_HctTT[nChan] = {0.1587,0.0956,0.0279,0.0239,0.0386};
   float s2p_HctTT[nChan] = {0.4349,0.2679,0.0845,0.0698,0.1395};
   float s2m_HctTT[nChan] = {0.1184,0.0705,0.0189,0.0176,0.0277};
   */

   /*
   // Hut Max
   float med_HutMax[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p_HutMax[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m_HutMax[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p_HutMax[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m_HutMax[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   */

   // Hut 2D
   float med_Hut[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p_Hut[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m_Hut[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p_Hut[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m_Hut[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};

   // HutST
   float med_HutST[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p_HutST[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m_HutST[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p_HutST[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m_HutST[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};

   // HutTT
   float med_HutTT[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p_HutTT[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m_HutTT[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p_HutTT[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m_HutTT[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};

   /*
   // Hct Max
   float med_HctMax[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p_HctMax[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m_HctMax[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p_HctMax[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m_HctMax[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   */

   // Hct 2D
   float med_Hct[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p_Hct[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m_Hct[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p_Hct[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m_Hct[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};

   // HctST
   float med_HctST[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p_HctST[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m_HctST[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p_HctST[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m_HctST[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};

   // HctTT
   float med_HctTT[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p_HctTT[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m_HctTT[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p_HctTT[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m_HctTT[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};


   /*
   // Hut Max
   float s2m_HutMax[nChan] = {0.5184, 0.3485, 0.2453, 0.0003, 0.854};
   float s1m_HutMax[nChan] = {0.6987, 0.3897, 0.3327, 0.1367, 1.1676};
   float med_HutMax[nChan] = {0.9941, 0.4395, 0.4668, 0.1489, 1.6816};
   float s1p_HutMax[nChan] = {1.434, 0.6654, 0.6361, 0.2546, 2.4525};
   float s2p_HutMax[nChan] = {1.9616, 1.2367, 0.8289, 0.3181, 3.44};

   // Hct Max
   float s2m_HctMax[nChan] = {0.0004, 0.3451, 0.2879, 0.1843, 0.3636};
   float s1m_HctMax[nChan] = {0.0008, 0.4625, 0.3912, 0.2277, 0.5075};
   float med_HctMax[nChan] = {0.8398, 0.6426, 0.5605, 0.3135, 0.7598};
   float s1p_HctMax[nChan] = {1.65, 0.8962, 0.7907, 0.3147, 1.1747};
   float s2p_HctMax[nChan] = {2.5044, 1.1482, 0.9013, 0.316, 1.8046};
   */

   // Hut Max
   float s2m_HutMax[nChan] = {0.5175, 0.3388, 0.2453, 0.0003, 0.8562};
   float s1m_HutMax[nChan] = {0.6988, 0.4613, 0.3327, 0.1367, 1.1683};
   float med_HutMax[nChan] = {0.9961, 0.5801, 0.4668, 0.1489, 1.6797};
   float s1p_HutMax[nChan] = {1.4368, 0.5824, 0.6398, 0.2546, 2.4496};
   float s2p_HutMax[nChan] = {1.953, 1.2332, 0.8317, 0.3181, 3.4568};

   // Hct Max
   float s2m_HctMax[nChan] = {0.7644, 0.3455, 0.2879, 0.1843, 0.3636};
   float s1m_HctMax[nChan] = {1.018, 0.4623, 0.3912, 0.2261, 0.5075};
   float med_HctMax[nChan] = {1.4336, 0.6387, 0.5605, 0.2666, 0.7598};
   float s1p_HctMax[nChan] = {2.0679, 0.8958, 0.7728, 0.4037, 1.1747};
   float s2p_HctMax[nChan] = {2.7213, 1.1533, 0.8856, 0.6088, 1.8046};

   TH1F *hLimitXsecMax[nChan];
   TH1F *hLimitXsecs1pMax[nChan];
   TH1F *hLimitXsecs1mMax[nChan];
   TH1F *hLimitXsecs2pMax[nChan];
   TH1F *hLimitXsecs2mMax[nChan];
   
   TH1F *hLimitXsec2D[nChan];
   TH1F *hLimitXsecs1p2D[nChan];
   TH1F *hLimitXsecs1m2D[nChan];
   TH1F *hLimitXsecs2p2D[nChan];
   TH1F *hLimitXsecs2m2D[nChan];

   TH1F *hLimitXsecST[nChan];
   TH1F *hLimitXsecs1pST[nChan];
   TH1F *hLimitXsecs1mST[nChan];
   TH1F *hLimitXsecs2pST[nChan];
   TH1F *hLimitXsecs2mST[nChan];

   TH1F *hLimitXsecTT[nChan];
   TH1F *hLimitXsecs1pTT[nChan];
   TH1F *hLimitXsecs1mTT[nChan];
   TH1F *hLimitXsecs2pTT[nChan];
   TH1F *hLimitXsecs2mTT[nChan];
   
   for(int i=0;i<nChan;i++)
     {	
	std::string nameLimitXsecMax = "hLimitXsec"+std::string(Form("Max-%d",i));
	std::string nameLimitXsecs1pMax = "hLimitXsecs1p"+std::string(Form("Max-%d",i));
	std::string nameLimitXsecs1mMax = "hLimitXsecs1m"+std::string(Form("Max-%d",i));
	std::string nameLimitXsecs2pMax = "hLimitXsecs2p"+std::string(Form("Max-%d",i));
	std::string nameLimitXsecs2mMax = "hLimitXsecs2m"+std::string(Form("Max-%d",i));

	std::string nameLimitXsec2D = "hLimitXsec"+std::string(Form("2D-%d",i));
	std::string nameLimitXsecs1p2D = "hLimitXsecs1p"+std::string(Form("2D-%d",i));
	std::string nameLimitXsecs1m2D = "hLimitXsecs1m"+std::string(Form("2D-%d",i));
	std::string nameLimitXsecs2p2D = "hLimitXsecs2p"+std::string(Form("2D-%d",i));
	std::string nameLimitXsecs2m2D = "hLimitXsecs2m"+std::string(Form("2D-%d",i));

	std::string nameLimitXsecST = "hLimitXsec"+std::string(Form("ST-%d",i));
	std::string nameLimitXsecs1pST = "hLimitXsecs1p"+std::string(Form("ST-%d",i));
	std::string nameLimitXsecs1mST = "hLimitXsecs1m"+std::string(Form("ST-%d",i));
	std::string nameLimitXsecs2pST = "hLimitXsecs2p"+std::string(Form("ST-%d",i));
	std::string nameLimitXsecs2mST = "hLimitXsecs2m"+std::string(Form("ST-%d",i));

	std::string nameLimitXsecTT = "hLimitXsec"+std::string(Form("TT-%d",i));
	std::string nameLimitXsecs1pTT = "hLimitXsecs1p"+std::string(Form("TT-%d",i));
	std::string nameLimitXsecs1mTT = "hLimitXsecs1m"+std::string(Form("TT-%d",i));
	std::string nameLimitXsecs2pTT = "hLimitXsecs2p"+std::string(Form("TT-%d",i));
	std::string nameLimitXsecs2mTT = "hLimitXsecs2m"+std::string(Form("TT-%d",i));

	hLimitXsecMax[i] = new TH1F(nameLimitXsecMax.c_str(),nameLimitXsecMax.c_str(),nChan,xbins);
	hLimitXsecs1pMax[i] = new TH1F(nameLimitXsecs1pMax.c_str(),nameLimitXsecs1pMax.c_str(),nChan,xbins);
	hLimitXsecs1mMax[i] = new TH1F(nameLimitXsecs1mMax.c_str(),nameLimitXsecs1mMax.c_str(),nChan,xbins);
	hLimitXsecs2pMax[i] = new TH1F(nameLimitXsecs2pMax.c_str(),nameLimitXsecs2pMax.c_str(),nChan,xbins);
        hLimitXsecs2mMax[i] = new TH1F(nameLimitXsecs2mMax.c_str(),nameLimitXsecs2mMax.c_str(),nChan,xbins);
	
	hLimitXsec2D[i] = new TH1F(nameLimitXsec2D.c_str(),nameLimitXsec2D.c_str(),nChan,xbins);
	hLimitXsecs1p2D[i] = new TH1F(nameLimitXsecs1p2D.c_str(),nameLimitXsecs1p2D.c_str(),nChan,xbins);
	hLimitXsecs1m2D[i] = new TH1F(nameLimitXsecs1m2D.c_str(),nameLimitXsecs1m2D.c_str(),nChan,xbins);
	hLimitXsecs2p2D[i] = new TH1F(nameLimitXsecs2p2D.c_str(),nameLimitXsecs2p2D.c_str(),nChan,xbins);
        hLimitXsecs2m2D[i] = new TH1F(nameLimitXsecs2m2D.c_str(),nameLimitXsecs2m2D.c_str(),nChan,xbins);

	hLimitXsecST[i] = new TH1F(nameLimitXsecST.c_str(),nameLimitXsecST.c_str(),nChan,xbins);
	hLimitXsecs1pST[i] = new TH1F(nameLimitXsecs1pST.c_str(),nameLimitXsecs1pST.c_str(),nChan,xbins);
	hLimitXsecs1mST[i] = new TH1F(nameLimitXsecs1mST.c_str(),nameLimitXsecs1mST.c_str(),nChan,xbins);
	hLimitXsecs2pST[i] = new TH1F(nameLimitXsecs2pST.c_str(),nameLimitXsecs2pST.c_str(),nChan,xbins);
        hLimitXsecs2mST[i] = new TH1F(nameLimitXsecs2mST.c_str(),nameLimitXsecs2mST.c_str(),nChan,xbins);

	hLimitXsecTT[i] = new TH1F(nameLimitXsecTT.c_str(),nameLimitXsecTT.c_str(),nChan,xbins);
	hLimitXsecs1pTT[i] = new TH1F(nameLimitXsecs1pTT.c_str(),nameLimitXsecs1pTT.c_str(),nChan,xbins);
	hLimitXsecs1mTT[i] = new TH1F(nameLimitXsecs1mTT.c_str(),nameLimitXsecs1mTT.c_str(),nChan,xbins);
	hLimitXsecs2pTT[i] = new TH1F(nameLimitXsecs2pTT.c_str(),nameLimitXsecs2pTT.c_str(),nChan,xbins);
        hLimitXsecs2mTT[i] = new TH1F(nameLimitXsecs2mTT.c_str(),nameLimitXsecs2mTT.c_str(),nChan,xbins);
     }
   
   for(int ib=0;ib<nChan;ib++)
     {          	
	if( coup == "Hut" )
	  {	     
	     hLimitXsecMax[ib]->SetBinContent(ib+1,med_HutMax[ib]*xsec);
	     hLimitXsecs1pMax[ib]->SetBinContent(ib+1,s1p_HutMax[ib]*xsec);
	     hLimitXsecs1mMax[ib]->SetBinContent(ib+1,s1m_HutMax[ib]*xsec);
	     hLimitXsecs2pMax[ib]->SetBinContent(ib+1,s2p_HutMax[ib]*xsec);
	     hLimitXsecs2mMax[ib]->SetBinContent(ib+1,s2m_HutMax[ib]*xsec);

	     hLimitXsec2D[ib]->SetBinContent(ib+1,med_Hut[ib]*xsec);
	     hLimitXsecs1p2D[ib]->SetBinContent(ib+1,s1p_Hut[ib]*xsec);
	     hLimitXsecs1m2D[ib]->SetBinContent(ib+1,s1m_Hut[ib]*xsec);
	     hLimitXsecs2p2D[ib]->SetBinContent(ib+1,s2p_Hut[ib]*xsec);
	     hLimitXsecs2m2D[ib]->SetBinContent(ib+1,s2m_Hut[ib]*xsec);

	     hLimitXsecST[ib]->SetBinContent(ib+1,med_HutST[ib]*xsec);
	     hLimitXsecs1pST[ib]->SetBinContent(ib+1,s1p_HutST[ib]*xsec);
	     hLimitXsecs1mST[ib]->SetBinContent(ib+1,s1m_HutST[ib]*xsec);
	     hLimitXsecs2pST[ib]->SetBinContent(ib+1,s2p_HutST[ib]*xsec);
	     hLimitXsecs2mST[ib]->SetBinContent(ib+1,s2m_HutST[ib]*xsec);

	     hLimitXsecTT[ib]->SetBinContent(ib+1,med_HutTT[ib]*xsec);
	     hLimitXsecs1pTT[ib]->SetBinContent(ib+1,s1p_HutTT[ib]*xsec);
	     hLimitXsecs1mTT[ib]->SetBinContent(ib+1,s1m_HutTT[ib]*xsec);
	     hLimitXsecs2pTT[ib]->SetBinContent(ib+1,s2p_HutTT[ib]*xsec);
	     hLimitXsecs2mTT[ib]->SetBinContent(ib+1,s2m_HutTT[ib]*xsec);
	  }
	else
	  {
	     hLimitXsecMax[ib]->SetBinContent(ib+1,med_HctMax[ib]*xsec);
	     hLimitXsecs1pMax[ib]->SetBinContent(ib+1,s1p_HctMax[ib]*xsec);
	     hLimitXsecs1mMax[ib]->SetBinContent(ib+1,s1m_HctMax[ib]*xsec);
	     hLimitXsecs2pMax[ib]->SetBinContent(ib+1,s2p_HctMax[ib]*xsec);
	     hLimitXsecs2mMax[ib]->SetBinContent(ib+1,s2m_HctMax[ib]*xsec);

	     hLimitXsec2D[ib]->SetBinContent(ib+1,med_Hct[ib]*xsec);
	     hLimitXsecs1p2D[ib]->SetBinContent(ib+1,s1p_Hct[ib]*xsec);
	     hLimitXsecs1m2D[ib]->SetBinContent(ib+1,s1m_Hct[ib]*xsec);
	     hLimitXsecs2p2D[ib]->SetBinContent(ib+1,s2p_Hct[ib]*xsec);
	     hLimitXsecs2m2D[ib]->SetBinContent(ib+1,s2m_Hct[ib]*xsec);

	     hLimitXsecST[ib]->SetBinContent(ib+1,med_HctST[ib]*xsec);
	     hLimitXsecs1pST[ib]->SetBinContent(ib+1,s1p_HctST[ib]*xsec);
	     hLimitXsecs1mST[ib]->SetBinContent(ib+1,s1m_HctST[ib]*xsec);
	     hLimitXsecs2pST[ib]->SetBinContent(ib+1,s2p_HctST[ib]*xsec);
	     hLimitXsecs2mST[ib]->SetBinContent(ib+1,s2m_HctST[ib]*xsec);

	     hLimitXsecTT[ib]->SetBinContent(ib+1,med_HctTT[ib]*xsec);
	     hLimitXsecs1pTT[ib]->SetBinContent(ib+1,s1p_HctTT[ib]*xsec);
	     hLimitXsecs1mTT[ib]->SetBinContent(ib+1,s1m_HctTT[ib]*xsec);
	     hLimitXsecs2pTT[ib]->SetBinContent(ib+1,s2p_HctTT[ib]*xsec);
	     hLimitXsecs2mTT[ib]->SetBinContent(ib+1,s2m_HctTT[ib]*xsec);	     
	  }	
     }   
   
   TCanvas *c1 = new TCanvas("c1","c1",0,0,700,500);

   TLine *lineMax[nChan], *line2D[nChan], *lineST[nChan], *lineTT[nChan];
   
   const int np = 5;

   double xp_s1_Max[nChan][np];
   double yp_s1_Max[nChan][np];
   double xp_s2_Max[nChan][np];
   double yp_s2_Max[nChan][np];
   
   double xp_s1_2D[nChan][np];
   double yp_s1_2D[nChan][np];
   double xp_s2_2D[nChan][np];
   double yp_s2_2D[nChan][np];

   double xp_s1_ST[nChan][np];
   double yp_s1_ST[nChan][np];
   double xp_s2_ST[nChan][np];
   double yp_s2_ST[nChan][np];

   double xp_s1_TT[nChan][np];
   double yp_s1_TT[nChan][np];
   double xp_s2_TT[nChan][np];
   double yp_s2_TT[nChan][np];
   
   for(int i=0;i<nChan;i++)
     {	
	xp_s1_Max[i][0] = hLimitXsecMax[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_Max[i][0] = hLimitXsecs1mMax[i]->GetBinContent(i+1);
	xp_s1_Max[i][1] = hLimitXsecMax[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s1_Max[i][1] = hLimitXsecs1mMax[i]->GetBinContent(i+1);
	xp_s1_Max[i][2] = hLimitXsecMax[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s1_Max[i][2] = hLimitXsecs1pMax[i]->GetBinContent(i+1);
	xp_s1_Max[i][3] = hLimitXsecMax[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_Max[i][3] = hLimitXsecs1pMax[i]->GetBinContent(i+1);
	xp_s1_Max[i][4] = hLimitXsecMax[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_Max[i][4] = hLimitXsecs1mMax[i]->GetBinContent(i+1);

	xp_s2_Max[i][0] = hLimitXsecMax[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_Max[i][0] = hLimitXsecs2mMax[i]->GetBinContent(i+1);
	xp_s2_Max[i][1] = hLimitXsecMax[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s2_Max[i][1] = hLimitXsecs2mMax[i]->GetBinContent(i+1);
	xp_s2_Max[i][2] = hLimitXsecMax[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s2_Max[i][2] = hLimitXsecs2pMax[i]->GetBinContent(i+1);
	xp_s2_Max[i][3] = hLimitXsecMax[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_Max[i][3] = hLimitXsecs2pMax[i]->GetBinContent(i+1);
	xp_s2_Max[i][4] = hLimitXsecMax[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_Max[i][4] = hLimitXsecs2mMax[i]->GetBinContent(i+1);
	
	lineMax[i] = new TLine(hLimitXsecMax[i]->GetXaxis()->GetBinLowEdge(i+1),
			       hLimitXsecMax[i]->GetBinContent(i+1),
			       hLimitXsecMax[i]->GetXaxis()->GetBinUpEdge(i+1),
			       hLimitXsecMax[i]->GetBinContent(i+1));
	
	lineMax[i]->SetLineStyle(2);
	lineMax[i]->SetLineWidth(2);

	xp_s1_2D[i][0] = hLimitXsec2D[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_2D[i][0] = hLimitXsecs1m2D[i]->GetBinContent(i+1);
	xp_s1_2D[i][1] = hLimitXsec2D[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s1_2D[i][1] = hLimitXsecs1m2D[i]->GetBinContent(i+1);
	xp_s1_2D[i][2] = hLimitXsec2D[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s1_2D[i][2] = hLimitXsecs1p2D[i]->GetBinContent(i+1);
	xp_s1_2D[i][3] = hLimitXsec2D[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_2D[i][3] = hLimitXsecs1p2D[i]->GetBinContent(i+1);
	xp_s1_2D[i][4] = hLimitXsec2D[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_2D[i][4] = hLimitXsecs1m2D[i]->GetBinContent(i+1);

	xp_s2_2D[i][0] = hLimitXsec2D[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_2D[i][0] = hLimitXsecs2m2D[i]->GetBinContent(i+1);
	xp_s2_2D[i][1] = hLimitXsec2D[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s2_2D[i][1] = hLimitXsecs2m2D[i]->GetBinContent(i+1);
	xp_s2_2D[i][2] = hLimitXsec2D[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s2_2D[i][2] = hLimitXsecs2p2D[i]->GetBinContent(i+1);
	xp_s2_2D[i][3] = hLimitXsec2D[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_2D[i][3] = hLimitXsecs2p2D[i]->GetBinContent(i+1);
	xp_s2_2D[i][4] = hLimitXsec2D[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_2D[i][4] = hLimitXsecs2m2D[i]->GetBinContent(i+1);
	
	line2D[i] = new TLine(hLimitXsec2D[i]->GetXaxis()->GetBinLowEdge(i+1),
			      hLimitXsec2D[i]->GetBinContent(i+1),
			      hLimitXsec2D[i]->GetXaxis()->GetBinUpEdge(i+1),
			      hLimitXsec2D[i]->GetBinContent(i+1));
	
	line2D[i]->SetLineStyle(2);
	line2D[i]->SetLineWidth(2);

	xp_s1_ST[i][0] = hLimitXsecST[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_ST[i][0] = hLimitXsecs1mST[i]->GetBinContent(i+1);
	xp_s1_ST[i][1] = hLimitXsecST[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s1_ST[i][1] = hLimitXsecs1mST[i]->GetBinContent(i+1);
	xp_s1_ST[i][2] = hLimitXsecST[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s1_ST[i][2] = hLimitXsecs1pST[i]->GetBinContent(i+1);
	xp_s1_ST[i][3] = hLimitXsecST[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_ST[i][3] = hLimitXsecs1pST[i]->GetBinContent(i+1);
	xp_s1_ST[i][4] = hLimitXsecST[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_ST[i][4] = hLimitXsecs1mST[i]->GetBinContent(i+1);

	xp_s2_ST[i][0] = hLimitXsecST[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_ST[i][0] = hLimitXsecs2mST[i]->GetBinContent(i+1);
	xp_s2_ST[i][1] = hLimitXsecST[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s2_ST[i][1] = hLimitXsecs2mST[i]->GetBinContent(i+1);
	xp_s2_ST[i][2] = hLimitXsecST[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s2_ST[i][2] = hLimitXsecs2pST[i]->GetBinContent(i+1);
	xp_s2_ST[i][3] = hLimitXsecST[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_ST[i][3] = hLimitXsecs2pST[i]->GetBinContent(i+1);
	xp_s2_ST[i][4] = hLimitXsecST[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_ST[i][4] = hLimitXsecs2mST[i]->GetBinContent(i+1);
	
	lineST[i] = new TLine(hLimitXsecST[i]->GetXaxis()->GetBinLowEdge(i+1),
			      hLimitXsecST[i]->GetBinContent(i+1),
			      hLimitXsecST[i]->GetXaxis()->GetBinUpEdge(i+1),
			      hLimitXsecST[i]->GetBinContent(i+1));
	
	lineST[i]->SetLineColor(kBlue);
	lineST[i]->SetLineStyle(1);
	lineST[i]->SetLineWidth(2);

	xp_s1_TT[i][0] = hLimitXsecTT[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_TT[i][0] = hLimitXsecs1mTT[i]->GetBinContent(i+1);
	xp_s1_TT[i][1] = hLimitXsecTT[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s1_TT[i][1] = hLimitXsecs1mTT[i]->GetBinContent(i+1);
	xp_s1_TT[i][2] = hLimitXsecTT[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s1_TT[i][2] = hLimitXsecs1pTT[i]->GetBinContent(i+1);
	xp_s1_TT[i][3] = hLimitXsecTT[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_TT[i][3] = hLimitXsecs1pTT[i]->GetBinContent(i+1);
	xp_s1_TT[i][4] = hLimitXsecTT[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s1_TT[i][4] = hLimitXsecs1mTT[i]->GetBinContent(i+1);

	xp_s2_TT[i][0] = hLimitXsecTT[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_TT[i][0] = hLimitXsecs2mTT[i]->GetBinContent(i+1);
	xp_s2_TT[i][1] = hLimitXsecTT[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s2_TT[i][1] = hLimitXsecs2mTT[i]->GetBinContent(i+1);
	xp_s2_TT[i][2] = hLimitXsecTT[i]->GetXaxis()->GetBinUpEdge(i+1);
	yp_s2_TT[i][2] = hLimitXsecs2pTT[i]->GetBinContent(i+1);
	xp_s2_TT[i][3] = hLimitXsecTT[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_TT[i][3] = hLimitXsecs2pTT[i]->GetBinContent(i+1);
	xp_s2_TT[i][4] = hLimitXsecTT[i]->GetXaxis()->GetBinLowEdge(i+1);
	yp_s2_TT[i][4] = hLimitXsecs2mTT[i]->GetBinContent(i+1);
	
	lineTT[i] = new TLine(hLimitXsecTT[i]->GetXaxis()->GetBinLowEdge(i+1),
			      hLimitXsecTT[i]->GetBinContent(i+1),
			      hLimitXsecTT[i]->GetXaxis()->GetBinUpEdge(i+1),
			      hLimitXsecTT[i]->GetBinContent(i+1));
	
	lineTT[i]->SetLineColor(kRed);
	lineTT[i]->SetLineStyle(1);
	lineTT[i]->SetLineWidth(2);
     }   

   TPolyLine *s1_Max[nChan];
   TPolyLine *s2_Max[nChan];

   TPolyLine *s1_2D[nChan];
   TPolyLine *s2_2D[nChan];

   TPolyLine *s1_ST[nChan];
   TPolyLine *s2_ST[nChan];

   TPolyLine *s1_TT[nChan];
   TPolyLine *s2_TT[nChan];
   
   hLimitXsecMax[0]->Reset();
   hLimitXsecMax[0]->Draw("");
   
   for(int i=0;i<nChan;i++)
     {	
	s1_Max[i] = new TPolyLine(np,xp_s1_Max[i],yp_s1_Max[i]);
	s1_Max[i]->SetFillColor(kGreen);
	s2_Max[i] = new TPolyLine(np,xp_s2_Max[i],yp_s2_Max[i]);
	s2_Max[i]->SetFillColor(kYellow);
	s2_Max[i]->Draw("fSAME");
	s1_Max[i]->Draw("fSAME");	
	lineMax[i]->Draw("same");
	
	s1_ST[i] = new TPolyLine(np,xp_s1_ST[i],yp_s1_ST[i]);
	s2_ST[i] = new TPolyLine(np,xp_s2_ST[i],yp_s2_ST[i]);
	s1_TT[i] = new TPolyLine(np,xp_s1_TT[i],yp_s1_TT[i]);
	s2_TT[i] = new TPolyLine(np,xp_s2_TT[i],yp_s2_TT[i]);
	//lineST[i]->Draw("same");
	//lineTT[i]->Draw("same");
     }   
	
   hLimitXsecMax[0]->GetYaxis()->SetTitle("#sigma (95\% CL) [pb]");
   hLimitXsecMax[0]->GetXaxis()->SetTitle("");
   //hLimitXsecMax[0]->GetYaxis()->SetRangeUser(0.1,200.);
   hLimitXsecMax[0]->GetYaxis()->SetRangeUser(ymin,ymax);
   
   hLimitXsecMax[0]->GetXaxis()->SetBinLabel(1,"b2j3");
   hLimitXsecMax[0]->GetXaxis()->SetBinLabel(2,"b2j4");
   hLimitXsecMax[0]->GetXaxis()->SetBinLabel(3,"b3j3");
   hLimitXsecMax[0]->GetXaxis()->SetBinLabel(4,"b3j4");
   hLimitXsecMax[0]->GetXaxis()->SetBinLabel(5,"b4j4");
   
   TLegend *leg;
   //leg = new TLegend(0.75,0.90,0.90,0.70);
   leg = new TLegend(0.75,0.90,0.90,0.80);
   leg->SetFillColor(253);
   leg->SetBorderSize(0);
   
   leg->AddEntry(lineMax[0],"Max Expected","l");
   leg->AddEntry(s1_Max[0],"Max 68\%","f");
   leg->AddEntry(s2_Max[0],"Max 95\%","f");
   //leg->AddEntry(lineST[0],"ST Expected","l");
   //leg->AddEntry(lineTT[0],"TT Expected","l");
   
   c1->RedrawAxis("g");
   //c1->SetLogy(1);
   
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

   TLatex *text1 = new TLatex(0.98,0.95125,"12.9 fb^{-1}, #sqrt{s} = 13 TeV");
   text1->SetNDC();
   text1->SetTextAlign(31);
   text1->SetTextFont(42);
   text1->SetTextSize(0.04875);
   text1->SetLineWidth(2);
   text1->Draw();
   
   std::string picname = "pics/LimitComp_"+coup+".eps";
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
