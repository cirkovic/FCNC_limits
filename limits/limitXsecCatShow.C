TStyle* PlotStyle();
TStyle* PlotStyleCMS();
void SetPlotStyle();

//void limitXsecCat()
void limitXsecCatShow(std::string coup = "Hut", double ymin = 0.0, double ymax = 200.)
{
   gROOT->SetBatch(1);

   SetPlotStyle();

   //const int nChan = 5;
   const int nChan = 6;

   //std::string coup = "Hct";
   float xsec = 50.82;
   if( coup == "Hct" ) xsec = 38.88;
   //float xsec = 0.88+2*4.892;
   //if( coup == "Hct" ) xsec = 0.11+2*4.892;
   
   float xbins[nChan];
   for(int j=0;j<=nChan;j++)
     {
	xbins[j] = j;
     }

   // Hut Max
/*   float med[nChan] = {0.1177,0.0630,0.0229,0.0308,0.1313};
   float s1p[nChan] = {0.1636,0.0888,0.0314,0.0460,0.1978};
   float s1m[nChan] = {0.0853,0.0447,0.0171,0.0204,0.0886};
   float s2p[nChan] = {0.2160,0.1197,0.0491,0.0664,0.2868};
   float s2m[nChan] = {0.0639,0.0330,0.0140,0.0149,0.0634};*/
   
   // Hut 2D
/*   float med[nChan] = {0.1333,0.0649,0.0435,0.0288,0.1245};
   float s1p[nChan] = {0.1848,0.0911,0.0660,0.0421,0.1875};
   float s1m[nChan] = {0.0952,0.0469,0.0292,0.0197,0.0841};
   float s2p[nChan] = {0.2391,0.1223,0.0942,0.0588,0.2719};
   float s2m[nChan] = {0.0716,0.0353,0.0200,0.0149,0.0598};*/

   // HutST
/*   float med[nChan] = {0.1079,0.0723,0.0249,0.0308,0.1641};
   float s1p[nChan] = {0.1539,0.1048,0.0372,0.0450,0.2497};
   float s1m[nChan] = {0.0759,0.0487,0.0160,0.0210,0.1099};
   float s2p[nChan] = {0.2104,0.1421,0.0541,0.0636,0.3675};
   float s2m[nChan] = {0.0561,0.0359,0.0113,0.0159,0.0779};*/

   // HutTT
/*   float med[nChan] = {0.1021,0.0630,0.0337,0.0337,0.1714};
   float s1p[nChan] = {0.1631,0.0863,0.0463,0.0495,0.2527};
   float s1m[nChan] = {0.0854,0.0431,0.0233,0.0227,0.1188};
   float s2p[nChan] = {0.2212,0.1213,0.0704,0.0714,0.3628};
   float s2m[nChan] = {0.0682,0.0320,0.0166,0.0166,0.0867};*/

   /*
   // Hct Max
   float med[nChan] = {0.1753,0.1401,0.0347,0.0347,0.0815};
   float s1p[nChan] = {0.2487,0.1999,0.0571,0.0504,0.1381};
   float s1m[nChan] = {0.1241,0.0993,0.0322,0.0243,0.0553};
   float s2p[nChan] = {0.3364,0.2715,0.0771,0.0706,0.2196};
   float s2m[nChan] = {0.0918,0.0736,0.0171,0.0176,0.0379};
   */

   // Hct 2D
/*   float med[nChan] = {0.1648,0.1206,0.0835,0.0366,0.0620};
   float s1p[nChan] = {0.2378,0.1807,0.1138,0.0533,0.0961};
   float s1m[nChan] = {0.1216,0.0947,0.0677,0.0256,0.0415};
   float s2p[nChan] = {0.2841,0.2308,0.1472,0.0746,0.1460};
   float s2m[nChan] = {0.0911,0.0796,0.0610,0.0186,0.0296};*/

   // HctST
/*   float med[nChan] = {0.1763,0.1304,0.0347,0.0435,0.0962};
   float s1p[nChan] = {0.2514,0.1849,0.0554,0.0632,0.1434};
   float s1m[nChan] = {0.1246,0.0928,0.0245,0.0298,0.0672};
   float s2p[nChan] = {0.3370,0.2502,0.0792,0.0888,0.2104};
   float s2m[nChan] = {0.0926,0.0695,0.0171,0.0221,0.0492};*/

   // HctTT
/*   float med[nChan] = {0.2236,0.1353,0.0562,0.0337,0.0581};
   float s1p[nChan] = {0.3172,0.1940,0.0575,0.0495,0.0901};
   float s1m[nChan] = {0.1587,0.0956,0.0279,0.0239,0.0386};
   float s2p[nChan] = {0.4349,0.2679,0.0845,0.0698,0.1395};
   float s2m[nChan] = {0.1184,0.0705,0.0189,0.0176,0.0277};*/
   /*
   float med[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0};
   */
   float med[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
   float s1p[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
   float s1m[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
   float s2p[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
   float s2m[nChan] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
   /*
   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.7644;
       s1m[0] = 1.0180;
       med[0] = 1.4336;
       s1p[0] = 2.0679;
       s2p[0] = 2.7213;
              
       s2m[1] = 0.3455;
       s1m[1] = 0.4623;
       med[1] = 0.6387;
       s1p[1] = 0.8958;
       s2p[1] = 1.1533;
              
       s2m[2] = 0.2879;
       s1m[2] = 0.3912;
       med[2] = 0.5605;
       s1p[2] = 0.7728;
       s2p[2] = 0.8856;
              
       s2m[3] = 0.1843;
       s1m[3] = 0.2261;
       med[3] = 0.2666;
       s1p[3] = 0.4037;
       s2p[3] = 0.6088;
              
       s2m[4] = 0.3636;
       s1m[4] = 0.5075;
       med[4] = 0.7598;
       s1p[4] = 1.1747;
       s2p[4] = 1.8046;
   }
   else {
       // Hut Max
       s2m[0] = 0.5175;
       s1m[0] = 0.6988;
       med[0] = 0.9961;
       s1p[0] = 1.4368;
       s2p[0] = 1.9530;
              
       s2m[1] = 0.3388;
       s1m[1] = 0.4613;
       med[1] = 0.5801;
       s1p[1] = 0.5824;
       s2p[1] = 1.2332;
              
       s2m[2] = 0.2453;
       s1m[2] = 0.3327;
       med[2] = 0.4668;
       s1p[2] = 0.6398;
       s2p[2] = 0.8317;
              
       s2m[3] = 0.0003;
       s1m[3] = 0.1367;
       med[3] = 0.1489;
       s1p[3] = 0.2546;
       s2p[3] = 0.3181;
              
       s2m[4] = 0.8562;
       s1m[4] = 1.1683;
       med[4] = 1.6797;
       s1p[4] = 2.4496;
       s2p[4] = 3.4568;
   }
   */
   /*
   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.1012;
       s1m[0] = 0.1344;
       med[0] = 0.1870;
       s1p[0] = 0.2593;
       s2p[0] = 0.3451;
                
       s2m[1] = 0.0711;
       s1m[1] = 0.0951;
       med[1] = 0.1313;
       s1p[1] = 0.1832;
       s2p[1] = 0.2431;
                
       s2m[2] = 0.0869;
       s1m[2] = 0.1154;
       med[2] = 0.1606;
       s1p[2] = 0.2240;
       s2p[2] = 0.2994;
                
       s2m[3] = 0.0522;
       s1m[3] = 0.0694;
       med[3] = 0.0962;
       s1p[3] = 0.1342;
       s2p[3] = 0.1781;
                
       s2m[4] = 0.1233;
       s1m[4] = 0.1643;
       med[4] = 0.2295;
       s1p[4] = 0.3201;
       s2p[4] = 0.4278;
   }            
   else {       
       // Hut Max
       s2m[0] = 0.0906;
       s1m[0] = 0.1203;
       med[0] = 0.1675;
       s1p[0] = 0.2322;
       s2p[0] = 0.3091;
                
       s2m[1] = 0.0644;
       s1m[1] = 0.0852;
       med[1] = 0.1187;
       s1p[1] = 0.1645;
       s2p[1] = 0.2190;
                
       s2m[2] = 0.0837;
       s1m[2] = 0.1112;
       med[2] = 0.1548;
       s1p[2] = 0.2159;
       s2p[2] = 0.2885;
                
       s2m[3] = 0.0496;
       s1m[3] = 0.0656;
       med[3] = 0.0913;
       s1p[3] = 0.1273;
       s2p[3] = 0.1690;
                
       s2m[4] = 0.2822;
       s1m[4] = 0.3762;
       med[4] = 0.5254;
       s1p[4] = 0.7327;
       s2p[4] = 0.9794;
   }
   */
   /*
   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.0918;
       s1m[0] = 0.1241;
       med[0] = 0.1753;
       s1p[0] = 0.2487;
       s2p[0] = 0.3364;
                
       s2m[1] = 0.0003;
       s1m[1] = 0.0007;
       med[1] = 0.0220;
       s1p[1] = 0.0440;
       s2p[1] = 0.0665;
                
       s2m[2] = 0.0171;
       s1m[2] = 0.0316;
       med[2] = 0.0347;
       s1p[2] = 0.0526;
       s2p[2] = 0.0803;
                
       s2m[3] = 0.0176;
       s1m[3] = 0.0243;
       med[3] = 0.0347;
       s1p[3] = 0.0504;
       s2p[3] = 0.0706;
                
       s2m[4] = 0.0379;
       s1m[4] = 0.0553;
       med[4] = 0.0815;
       s1p[4] = 0.1381;
       s2p[4] = 0.2196;
   }            
   else {       
       // Hut Max
       s2m[0] = 0.0639;
       s1m[0] = 0.0853;
       med[0] = 0.1177;
       s1p[0] = 0.1636;
       s2p[0] = 0.2160;
                
       s2m[1] = 0.0330;
       s1m[1] = 0.0447;
       med[1] = 0.0630;
       s1p[1] = 0.0888;
       s2p[1] = 0.1197;
                
       s2m[2] = 0.0141;
       s1m[2] = 0.0175;
       med[2] = 0.0220;
       s1p[2] = 0.0314;
       s2p[2] = 0.0488;
                
       s2m[3] = 0.0149;
       s1m[3] = 0.0204;
       med[3] = 0.0308;
       s1p[3] = 0.0460;
       s2p[3] = 0.0664;
                
       s2m[4] = 0.0634;
       s1m[4] = 0.0886;
       med[4] = 0.1313;
       s1p[4] = 0.1978;
       s2p[4] = 0.2868;
   }
   */
   /*
   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.7644;
       s1m[0] = 1.0180;
       med[0] = 1.4336;
       s1p[0] = 2.0679;
       s2p[0] = 2.7213;
                
       s2m[1] = 0.3455;
       s1m[1] = 0.4623;
       med[1] = 0.6387;
       s1p[1] = 0.8958;
       s2p[1] = 1.1533;
                
       s2m[2] = 0.2879;
       s1m[2] = 0.3912;
       med[2] = 0.5605;
       s1p[2] = 0.7728;
       s2p[2] = 0.8856;
                
       s2m[3] = 0.1843;
       s1m[3] = 0.2261;
       med[3] = 0.2666;
       s1p[3] = 0.4037;
       s2p[3] = 0.6088;
                
       s2m[4] = 0.3636;
       s1m[4] = 0.5075;
       med[4] = 0.7598;
       s1p[4] = 1.1747;
       s2p[4] = 1.8046;
   }
   else {
       // Hut Max
       s2m[0] = 0.5175;
       s1m[0] = 0.6988;
       med[0] = 0.9961;
       s1p[0] = 1.4368;
       s2p[0] = 1.9530;
                
       s2m[1] = 0.3388;
       s1m[1] = 0.4613;
       med[1] = 0.5801;
       s1p[1] = 0.5824;
       s2p[1] = 1.2332;
                
       s2m[2] = 0.2453;
       s1m[2] = 0.3327;
       med[2] = 0.4668;
       s1p[2] = 0.6398;
       s2p[2] = 0.8317;
                
       s2m[3] = 0.0003;
       s1m[3] = 0.1367;
       med[3] = 0.1489;
       s1p[3] = 0.2546;
       s2p[3] = 0.3181;
                
       s2m[4] = 0.8562;
       s1m[4] = 1.1683;
       med[4] = 1.6797;
       s1p[4] = 2.4496;
       s2p[4] = 3.4568;
   }
   */
   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.0004;
       s1m[0] = 0.0009;
       med[0] = 0.2256;
       s1p[0] = 0.2265;
       s2p[0] = 0.2274;
                
       s2m[1] = 0.4156;
       s1m[1] = 0.5444;
       med[1] = 0.7520;
       s1p[1] = 1.0487;
       s2p[1] = 1.4017;
                
       s2m[2] = 0.7502;
       s1m[2] = 0.8077;
       med[2] = 0.9102;
       s1p[2] = 0.9138;
       s2p[2] = 0.9174;
                
       s2m[3] = 1.0925;
       s1m[3] = 1.0958;
       med[3] = 1.1055;
       s1p[3] = 1.1187;
       s2p[3] = 1.1318;
                
       s2m[4] = 1.2372;
       s1m[4] = 1.2832;
       med[4] = 1.3711;
       s1p[4] = 1.5187;
       s2p[4] = 1.7309;
   }            
   else {       
       // Hut Max
       s2m[0] = 1.8144;
       s1m[0] = 1.8306;
       med[0] = 1.8359;
       s1p[0] = 2.6043;
       s2p[0] = 2.6160;
                
       s2m[1] = 0.4102;
       s1m[1] = 1.2506;
       med[1] = 1.2539;
       s1p[1] = 1.7087;
       s2p[1] = 1.7170;
                
       s2m[2] = 0.2111;
       s1m[2] = 0.7656;
       med[2] = 0.8477;
       s1p[2] = 0.9456;
       s2p[2] = 0.9488;
                
       s2m[3] = 0.1324;
       s1m[3] = 0.1757;
       med[3] = 0.2412;
       s1p[3] = 0.3354;
       s2p[3] = 0.4458;
                
       s2m[4] = 1.8170;
       s1m[4] = 2.4618;
       med[4] = 3.4844;
       s1p[4] = 4.9844;
       s2p[4] = 7.3296;
   }

   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.6457;
       s1m[0] = 0.8703;
       med[0] = 1.2383;
       s1p[0] = 1.7960;
       s2p[0] = 2.5115;
                
       s2m[1] = 0.3380;
       s1m[1] = 0.4509;
       med[1] = 0.6270;
       s1p[1] = 0.8744;
       s2p[1] = 1.1687;
                
       s2m[2] = 0.1771;
       s1m[2] = 0.2406;
       med[2] = 0.3447;
       s1p[2] = 0.5000;
       s2p[2] = 0.7035;
                
       s2m[3] = 0.1139;
       s1m[3] = 0.1530;
       med[3] = 0.2217;
       s1p[3] = 0.3321;
       s2p[3] = 0.4644;
                
       s2m[4] = 0.2243;
       s1m[4] = 0.3073;
       med[4] = 0.4434;
       s1p[4] = 0.6643;
       s2p[4] = 0.9715;
   }            
   else {       
       // Hut Max
       s2m[0] = 0.4380;
       s1m[0] = 0.5918;
       med[0] = 0.8398;
       s1p[0] = 1.2047;
       s2p[0] = 1.6632;
                
       s2m[1] = 0.3663;
       s1m[1] = 0.4943;
       med[1] = 0.6973;
       s1p[1] = 0.9947;
       s2p[1] = 1.2805;
                
       s2m[2] = 0.1649;
       s1m[2] = 0.2180;
       med[2] = 0.3037;
       s1p[2] = 0.4308;
       s2p[2] = 0.5944;
                
       s2m[3] = 0.1354;
       s1m[3] = 0.1844;
       med[3] = 0.2646;
       s1p[3] = 0.3860;
       s2p[3] = 0.5479;
                
       s2m[4] = 0.7490;
       s1m[4] = 1.0292;
       med[4] = 1.5039;
       s1p[4] = 2.2412;
       s2p[4] = 3.1613;
   }

   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.4575;
       s1m[0] = 0.4588;
       med[0] = 0.4629;
       s1p[0] = 0.4647;
       s2p[0] = 0.4666;
                
       s2m[1] = 0.0284;
       s1m[1] = 0.0304;
       med[1] = 0.0347;
       s1p[1] = 0.0410;
       s2p[1] = 0.0498;
                
       s2m[2] = 0.0422;
       s1m[2] = 0.0514;
       med[2] = 0.0679;
       s1p[2] = 0.0909;
       s2p[2] = 0.0913;
                
       s2m[3] = 0.4403;
       s1m[3] = 0.4443;
       med[3] = 0.4456;
       s1p[3] = 0.4473;
       s2p[3] = 0.4491;
                
       s2m[4] = 0.3209;
       s1m[4] = 0.3318;
       med[4] = 0.3525;
       s1p[4] = 0.3624;
       s2p[4] = 0.4469;
   }            
   else {       
       // Hut Ma
       s2m[0] = 0.0308;
       s1m[0] = 0.0330;
       med[0] = 0.0376;
       s1p[0] = 0.0457;
       s2p[0] = 0.0556;
                
       s2m[1] = 0.0273;
       s1m[1] = 0.0287;
       med[1] = 0.0317;
       s1p[1] = 0.0371;
       s2p[1] = 0.0440;
                
       s2m[2] = 0.1879;
       s1m[2] = 0.1905;
       med[2] = 0.1963;
       s1p[2] = 0.2049;
       s2p[2] = 0.2194;
                
       s2m[3] = 0.0308;
       s1m[3] = 0.0352;
       med[3] = 0.0415;
       s1p[3] = 0.0531;
       s2p[3] = 0.0671;
                
       s2m[4] = 0.3891;
       s1m[4] = 0.6801;
       med[4] = 0.7812;
       s1p[4] = 0.7844;
       s2p[4] = 1.2412;
   }
   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.0005;
       s1m[0] = 0.3920;
       med[0] = 0.5054;
       s1p[0] = 0.5074;
       s2p[0] = 0.5094;
                
       s2m[1] = 0.2815;
       s1m[1] = 0.2853;
       med[1] = 0.2917;
       s1p[1] = 0.3045;
       s2p[1] = 0.3239;
                
       s2m[2] = 0.6366;
       s1m[2] = 0.6391;
       med[2] = 0.6763;
       s1p[2] = 0.6790;
       s2p[2] = 0.6817;
                
       s2m[3] = 0.0089;
       s1m[3] = 0.4299;
       med[3] = 0.4349;
       s1p[3] = 0.4401;
       s2p[3] = 0.4418;
                
       s2m[4] = 0.3007;
       s1m[4] = 0.3119;
       med[4] = 0.3333;
       s1p[4] = 0.3718;
       s2p[4] = 0.4257;
   }            
   else {       
       // Hut Ma
       s2m[0] = 0.0096;
       s1m[0] = 0.0184;
       med[0] = 0.0187;
       s1p[0] = 0.0375;
       s2p[0] = 0.0565;
                
       s2m[1] = 0.1914;
       s1m[1] = 0.1940;
       med[1] = 0.1984;
       s1p[1] = 0.2071;
       s2p[1] = 0.2078;
                
       s2m[2] = 0.0106;
       s1m[2] = 0.0142;
       med[2] = 0.0195;
       s1p[2] = 0.0272;
       s2p[2] = 0.0357;
                
       s2m[3] = 0.2085;
       s1m[3] = 0.2107;
       med[3] = 0.2144;
       s1p[3] = 0.2204;
       s2p[3] = 0.2296;
                
       s2m[4] = 0.4089;
       s1m[4] = 0.6889;
       med[4] = 0.8209;
       s1p[4] = 0.8242;
       s2p[4] = 0.8732;
   }
   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.0004;
       s1m[0] = 0.0007;
       med[0] = 0.0122;
       s1p[0] = 0.0126;
       s2p[0] = 0.0367;
                
       s2m[1] = 0.0125;
       s1m[1] = 0.0167;
       med[1] = 0.0228;
       s1p[1] = 0.0319;
       s2p[1] = 0.0427;
                
       s2m[2] = 0.0339;
       s1m[2] = 0.0452;
       med[2] = 0.0628;
       s1p[2] = 0.0871;
       s2p[2] = 0.0875;
                
       s2m[3] = 0.0089;
       s1m[3] = 0.4299;
       med[3] = 0.4349;
       s1p[3] = 0.4401;
       s2p[3] = 0.4418;
                
       s2m[4] = 0.2970;
       s1m[4] = 0.3091;
       med[4] = 0.3320;
       s1p[4] = 0.3731;
       s2p[4] = 0.4265;
   }            
   else {       
       // Hut Ma
       s2m[0] = 0.0145;
       s1m[0] = 0.0194;
       med[0] = 0.0266;
       s1p[0] = 0.0363;
       s2p[0] = 0.0485;
                
       s2m[1] = 0.0107;
       s1m[1] = 0.0143;
       med[1] = 0.0195;
       s1p[1] = 0.0273;
       s2p[1] = 0.0361;
                
       s2m[2] = 0.2012;
       s1m[2] = 0.2033;
       med[2] = 0.2069;
       s1p[2] = 0.2143;
       s2p[2] = 0.2151;
                
       s2m[3] = 0.0185;
       s1m[3] = 0.0246;
       med[3] = 0.0334;
       s1p[3] = 0.0470;
       s2p[3] = 0.0620;
                
       s2m[4] = 0.3841;
       s1m[4] = 0.6775;
       med[4] = 0.7713;
       s1p[4] = 0.7743;
       s2p[4] = 0.8572;
   }
   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.0005;
       s1m[0] = 0.3920;
       med[0] = 0.5054;
       s1p[0] = 0.5074;
       s2p[0] = 0.5094;
                
       s2m[1] = 0.0125;
       s1m[1] = 0.0167;
       med[1] = 0.0228;
       s1p[1] = 0.0319;
       s2p[1] = 0.0427;
                
       s2m[2] = 0.0339;
       s1m[2] = 0.0452;
       med[2] = 0.0628;
       s1p[2] = 0.0869;
       s2p[2] = 0.0996;
                
       s2m[3] = 0.0996;
       s1m[3] = 0.0998;
       med[3] = 0.1000;
       s1p[3] = 0.1000;
       s2p[3] = 0.1000;
                
       s2m[4] = 0.3007;
       s1m[4] = 0.3119;
       med[4] = 0.3333;
       s1p[4] = 0.3718;
       s2p[4] = 0.4257;
   }            
   else {       
       // Hut Ma
       s2m[0] = 0.0145;
       s1m[0] = 0.0194;
       med[0] = 0.0266;
       s1p[0] = 0.0363;
       s2p[0] = 0.0485;
                
       s2m[1] = 0.0107;
       s1m[1] = 0.0143;
       med[1] = 0.0195;
       s1p[1] = 0.0273;
       s2p[1] = 0.0361;
                
       s2m[2] = 0.0996;
       s1m[2] = 0.0998;
       med[2] = 0.1000;
       s1p[2] = 0.1000;
       s2p[2] = 0.1000;
                
       s2m[3] = 0.0185;
       s1m[3] = 0.0246;
       med[3] = 0.0334;
       s1p[3] = 0.0470;
       s2p[3] = 0.0623;
                
       s2m[4] = 0.0996;
       s1m[4] = 0.0998;
       med[4] = 0.1000;
       s1p[4] = 0.1000;
       s2p[4] = 0.1000;
   }
   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.0002;
       s1m[0] = 0.0002;
       med[0] = 0.0003;
       s1p[0] = 0.0005;
       s2p[0] = 0.0007;
                        
       s2m[1] = 0.0128;
       s1m[1] = 0.0165;
       med[1] = 0.0234;
       s1p[1] = 0.0320;
       s2p[1] = 0.0428;
                        
       s2m[2] = 0.0339;
       s1m[2] = 0.0452;
       med[2] = 0.0628;
       s1p[2] = 0.0871;
       s2p[2] = 0.1386;
                        
       s2m[3] = 0.0815;
       s1m[3] = 0.0845;
       med[3] = 0.0903;
       s1p[3] = 0.1000;
       s2p[3] = 0.1129;
                        
       s2m[4] = 0.1867;
       s1m[4] = 0.1992;
       med[4] = 0.2000;
       s1p[4] = 0.2000;
       s2p[4] = 0.2000;
   }            
   else {       
       // Hut Ma        
       s2m[0] = 0.1331;
       s1m[0] = 0.1345;
       med[0] = 0.1369;
       s1p[0] = 0.1990;
       s2p[0] = 0.1995;
                        
       s2m[1] = 0.1992;
       s1m[1] = 0.1996;
       med[1] = 0.2000;
       s1p[1] = 0.2000;
       s2p[1] = 0.2000;
                        
       s2m[2] = 0.1977;
       s1m[2] = 0.1994;
       med[2] = 0.2000;
       s1p[2] = 0.2000;
       s2p[2] = 0.2000;
                        
       s2m[3] = 0.0182;
       s1m[3] = 0.0245;
       med[3] = 0.0338;
       s1p[3] = 0.0469;
       s2p[3] = 0.0622;
                        
       s2m[4] = 0.1992;
       s1m[4] = 0.1996;
       med[4] = 0.2000;
       s1p[4] = 0.2000;
       s2p[4] = 0.2000;
   }
   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.0004;
       s1m[0] = 0.0007;
       med[0] = 0.0122;
       s1p[0] = 0.0126;
       s2p[0] = 0.0367;
                        
       s2m[1] = 0.0125;
       s1m[1] = 0.0167;
       med[1] = 0.0228;
       s1p[1] = 0.0319;
       s2p[1] = 0.0427;
                        
       s2m[2] = 0.0339;
       s1m[2] = 0.0452;
       med[2] = 0.0628;
       s1p[2] = 0.0869;
       s2p[2] = 0.0996;
                        
       s2m[3] = 0.0815;
       s1m[3] = 0.0845;
       med[3] = 0.0903;
       s1p[3] = 0.0997;
       s2p[3] = 0.0998;
                        
       s2m[4] = 0.0996;
       s1m[4] = 0.0998;
       med[4] = 0.1000;
       s1p[4] = 0.1000;
       s2p[4] = 0.1000;
   }            
   else {       
       // Hut Ma        
       s2m[0] = 0.0996;
       s1m[0] = 0.0998;
       med[0] = 0.1000;
       s1p[0] = 0.1000;
       s2p[0] = 0.1000;
                        
       s2m[1] = 0.0996;
       s1m[1] = 0.0998;
       med[1] = 0.1000;
       s1p[1] = 0.1000;
       s2p[1] = 0.1000;
                        
       s2m[2] = 0.0996;
       s1m[2] = 0.0998;
       med[2] = 0.1000;
       s1p[2] = 0.1000;
       s2p[2] = 0.1000;
                        
       s2m[3] = 0.0185;
       s1m[3] = 0.0246;
       med[3] = 0.0334;
       s1p[3] = 0.0470;
       s2p[3] = 0.0623;
                        
       s2m[4] = 0.1992;
       s1m[4] = 0.1996;
       med[4] = 0.2000;
       s1p[4] = 0.2000;
       s2p[4] = 0.2000;
   }
   if (coup == "Hct") {
       // Hct Max
       s2m[0] = 0.0005;
       s1m[0] = 0.0009;
       med[0] = 0.0078;
       s1p[0] = 0.0083;
       s2p[0] = 0.0156;
                        
       s2m[1] = 0.0125;
       s1m[1] = 0.0167;
       med[1] = 0.0228;
       s1p[1] = 0.0319;
       s2p[1] = 0.0427;
                        
       s2m[2] = 0.0339;
       s1m[2] = 0.0452;
       med[2] = 0.0628;
       s1p[2] = 0.0871;
       s2p[2] = 0.1386;
                        
       s2m[3] = 0.0815;
       s1m[3] = 0.0845;
       med[3] = 0.0903;
       s1p[3] = 0.1000;
       s2p[3] = 0.1004;
                        
       s2m[4] = 0.2741;
       s1m[4] = 0.2861;
       med[4] = 0.3091;
       s1p[4] = 0.3473;
       s2p[4] = 0.4225;
   }            
   else {       
       // Hut Ma        
       s2m[0] = 0.1304;
       s1m[0] = 0.1318;
       med[0] = 0.1341;
       s1p[0] = 0.2206;
       s2p[0] = 0.2287;
                        
       s2m[1] = 0.2396;
       s1m[1] = 0.4791;
       med[1] = 0.4810;
       s1p[1] = 0.4829;
       s2p[1] = 0.4848;
                        
       s2m[2] = 0.1985;
       s1m[2] = 0.2006;
       med[2] = 0.2041;
       s1p[2] = 0.2049;
       s2p[2] = 0.2057;
                        
       s2m[3] = 0.0180;
       s1m[3] = 0.0243;
       med[3] = 0.0334;
       s1p[3] = 0.0470;
       s2p[3] = 0.0620;
                        
       s2m[4] = 0.2618;
       s1m[4] = 0.5539;
       med[4] = 0.5563;
       s1p[4] = 0.6959;
       s2p[4] = 0.9409;
   }
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
   hLimitXsec[0]->GetXaxis()->SetBinLabel(6,"comb");
   
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

   TLatex *ctex = new TLatex(0.50, 0.87, coup.c_str());
   ctex->SetNDC();
   ctex->SetTextAlign(13);
   ctex->SetTextFont(61);
   ctex->SetTextSize(0.07475);
   ctex->SetLineWidth(2);
   ctex->Draw();
   //tex->DrawLatex(0.50,0.83, coup.c_str());

   ////////////////////////////////////////////////////////////////////
   if (true) {
   bool DRAW_NUMS = true;

   std::ofstream myfile;
   myfile.open((std::string("limitNums_")+coup+std::string(".txt")).c_str());
   std::string limLine;

   std::stringstream limLab;
   limLab.precision(4);

   double xshift = 0.16;

   for (int i = 0; i < nChan; i++) {

       limLine = std::string(" \\\\");

       TLatex limLabp2;
       limLabp2.SetTextSize(0.044);
       limLabp2.SetNDC();
       limLabp2.SetTextColor(kBlack);
       limLab.str("");
       limLab << hLimitXsecs2p_bkp[i]->GetBinContent(i+1);
       if (DRAW_NUMS) limLabp2.DrawLatex(0.20+xshift*i,0.60,limLab.str().c_str());

       limLine = limLab.str()+limLine;

       TLatex limLabp1;
       limLabp1.SetTextSize(0.044);
       limLabp1.SetNDC();
       limLabp1.SetTextColor(kBlack);
       limLab.str("");
       limLab << hLimitXsecs1p_bkp[i]->GetBinContent(i+1);
       if (DRAW_NUMS) limLabp1.DrawLatex(0.20+xshift*i,0.55,limLab.str().c_str());

       limLine = limLab.str()+std::string(" & ")+limLine;

       TLatex lLimit;
       lLimit.SetTextSize(0.044);
       lLimit.SetNDC();
       lLimit.SetTextColor(kBlack);
       limLab.str("");
       limLab << hLimitXsec_bkp[i]->GetBinContent(i+1);
       //limLab << " (" << data2[0] << ")";
       if (DRAW_NUMS) lLimit.DrawLatex(0.20+xshift*i,0.50,limLab.str().c_str());

       limLine = limLab.str()+std::string(" & ")+limLine;

       TLatex limLabm1;
       limLabm1.SetTextSize(0.044);
       limLabm1.SetNDC();
       limLabm1.SetTextColor(kBlack);
       limLab.str("");
       limLab << hLimitXsecs1m_bkp[i]->GetBinContent(i+1);
       if (DRAW_NUMS) limLabm1.DrawLatex(0.20+xshift*i,0.45,limLab.str().c_str());

       limLine = limLab.str()+std::string(" & ")+limLine;

       TLatex limLabm2;
       limLabm2.SetTextSize(0.044);
       limLabm2.SetNDC();
       limLabm2.SetTextColor(kBlack);
       limLab.str("");
       limLab << hLimitXsecs2m_bkp[i]->GetBinContent(i+1);
       if (DRAW_NUMS) limLabm2.DrawLatex(0.20+xshift*i,0.40,limLab.str().c_str());

       limLine = limLab.str()+std::string(" & ")+limLine;

       limLine = std::string("        ")+std::string(hLimitXsec[0]->GetXaxis()->GetBinLabel(i+1))+std::string(" & ")+limLine;
       myfile << limLine << std::endl;


   }
   myfile << "       \\hline" << std::endl;
   myfile.close();
   }

   ////////////////////////////////////////////////////////////////////


   
   //std::string picname = "pics/LimitXsec.eps";
   //c1->Print(picname.c_str());
   //c1->SetLogy();
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
