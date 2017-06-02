/*
bool inSystArr(std::string arg, std::vector<std::string> &array) {
    for (std::vector<std::string>::iterator it = array.begin() ; it != array.end(); ++it)
        if (arg == *it) return false;
    return true;
}
*/

void produceCards()
{
   gROOT->SetBatch(1);

   const int nc = 5;
   std::string cat[nc] = {"b2j3","b2j4","b3j3","b3j4","b4j4"};
   const int nd = 2;
   std::string dist[nd] = {"MVAHutComb","MVAHctComb"};
   std::string coup[nd] = {"hut","hct"};

   std::vector<std::string> exclude; 
   
   for(int id=0;id<nd;id++)
     {	
	for(int ic=0;ic<nc;ic++)
	  {
        /*
        if (string(coup[id]) == "hct" && cat[ic] == string("b2j3")) {
                exclude.push_back("SfIteraviveFitHf");
                exclude.push_back("SfIteraviveFitCferr1");
                exclude.push_back("SfPileup");
                exclude.push_back("SfLepton");
        }
        if (string(coup[id]) == "hct" && cat[ic] == string("b2j4")) {
                exclude.push_back("SfIteraviveFitLf");
                exclude.push_back("SfIteraviveFitHf");
                exclude.push_back("SfIteraviveFitHfstats1");
                exclude.push_back("SfIteraviveFitHfstats2");
                exclude.push_back("SfIteraviveFitCferr1");
                exclude.push_back("SfIteraviveFitCferr2");
                exclude.push_back("SfPileup");
                exclude.push_back("SfLepton");
                exclude.push_back("Jes");
        }
        if (string(coup[id]) == "hct" && cat[ic] == string("b3j3")) {
                exclude.push_back("SfIteraviveFitLf");
                exclude.push_back("SfIteraviveFitHfstats1");
                exclude.push_back("SfIteraviveFitHfstats2");
                exclude.push_back("SfIteraviveFitCferr1");
                exclude.push_back("SfIteraviveFitCferr2");
                exclude.push_back("SfPileup");
                exclude.push_back("SfLepton");
        }
        if (string(coup[id]) == "hct" && cat[ic] == string("b3j4")) {
                exclude.push_back("SfIteraviveFitLf");
                exclude.push_back("SfIteraviveFitHf");
                exclude.push_back("SfIteraviveFitLfstats1");
                exclude.push_back("SfIteraviveFitLfstats2");
                exclude.push_back("SfIteraviveFitHfstats1");
                exclude.push_back("SfIteraviveFitHfstats2");
                exclude.push_back("SfIteraviveFitCferr1");
                exclude.push_back("SfIteraviveFitCferr2");
                exclude.push_back("SfPileup");
                exclude.push_back("SfLepton");
                exclude.push_back("SfTopPt");
                exclude.push_back("Jes");
        }
        if (string(coup[id]) == "hct" && cat[ic] == string("b4j4")) {
                exclude.push_back("SfIteraviveFitLf");
                exclude.push_back("SfIteraviveFitCferr1");
        }
        if (string(coup[id]) == "hut" && cat[ic] == string("b2j3")) {
                exclude.push_back("SfIteraviveFitHf");
                exclude.push_back("SfIteraviveFitLfstats1");
                exclude.push_back("SfIteraviveFitHfstats2");
                exclude.push_back("SfIteraviveFitCferr1");
                exclude.push_back("SfIteraviveFitCferr2");
                exclude.push_back("SfLepton");
        }
        if (string(coup[id]) == "hut" && cat[ic] == string("b2j4")) {
                exclude.push_back("SfIteraviveFitLf");
                exclude.push_back("SfIteraviveFitHf");
                exclude.push_back("SfIteraviveFitHfstats2");
                exclude.push_back("SfIteraviveFitCferr1");
                exclude.push_back("SfIteraviveFitCferr2");
                exclude.push_back("SfLepton");
                exclude.push_back("Jer");
        }
        if (string(coup[id]) == "hut" && cat[ic] == string("b3j3")) {
                exclude.push_back("SfIteraviveFitLf");
                exclude.push_back("SfIteraviveFitHfstats1");
                exclude.push_back("SfIteraviveFitHfstats2");
                exclude.push_back("SfIteraviveFitCferr1");
                exclude.push_back("SfIteraviveFitCferr2");
                exclude.push_back("SfPileup");
                exclude.push_back("SfLepton");
        }
        if (string(coup[id]) == "hut" && cat[ic] == string("b3j4")) {
                exclude.push_back("SfIteraviveFitLf");
                exclude.push_back("SfIteraviveFitHf");
                exclude.push_back("SfIteraviveFitLfstats1");
                exclude.push_back("SfIteraviveFitLfstats2");
                exclude.push_back("SfIteraviveFitHfstats1");
                exclude.push_back("SfIteraviveFitHfstats2");
                exclude.push_back("SfIteraviveFitCferr2");
                exclude.push_back("SfPileup");
                exclude.push_back("SfLepton");
                exclude.push_back("Jes");
        }
        if (string(coup[id]) == "hut" && cat[ic] == string("b4j4")) {
                exclude.push_back("SfIteraviveFitLf");
                exclude.push_back("SfIteraviveFitCferr1");
        }
        */

	     std::string fname = "input_"+dist[id]+"_"+cat[ic]+"_"+coup[id];
	     //std::string fhist = "/afs/cern.ch/work/c/cirkovic/TrainingsFCNC/input/"+fname+".root";
	     //std::string fhist = "/afs/cern.ch/work/c/cirkovic/TrainingsFCNC/input/"+fname+".root";
	     //std::string fhist = "/afs/cern.ch/work/c/cirkovic/TrainingsFCNC_limits/input/"+fname+"_Mergedbackgrounds.root";
	     //std::string fhist = "/afs/cern.ch/work/c/cirkovic/FCNC_limits/input/"+fname+"_Mergedbackgrounds.root";
         //std::string fhist = "/afs/cern.ch/user/k/kderoove/public/Trainings_2017_04_24_statBinUnc_corrected/"+fname+"_Mergedbackgrounds.root";
         //std::string fhist = "/afs/cern.ch/user/k/kderoove/public/inputs_HLTEle32_ReducedVars/"+fname+"_Mergedbackgrounds.root";
         //std::string fhist = "/afs/cern.ch/user/k/kderoove/public/inputs_HLTEle32_ReducedVars/"+fname+"_Mergedbackgrounds.root";
         std::string fhist = "/afs/cern.ch/user/k/kderoove/public/inputs_HLTEle32_ReducedVars/cutCount/"+fname+"_Mergedbackgrounds.root";
         //std::string fhist = "/afs/cern.ch/work/c/cirkovic/FCNC_limits/rescaling/output_10/"+fname+"_Mergedbackgrounds.root";
	     std::string fcard = "cards/"+fname+".txt";
	     std::ofstream fc(fcard.c_str());
	     
	     TFile *f = TFile::Open(fhist.c_str(),"READ");
	     TFile *f1 = TFile::Open(fhist.c_str(),"READ");

	     TH1F* h_data = (TH1F*)f->Get("combSTandTT_cutCount_data_obs");
	     int stats = 0;
         if (h_data)
             stats = h_data->Integral();


	     TH1F* h_sig = (TH1F*)f->Get("combSTandTT_cutCount_sig");
	     float statsSig = 0;
         if (h_sig)
             statsSig = h_sig->Integral();

         TH1F* h_sig_stop = (TH1F*)f->Get("combSTandTT_cutCount_sig_stop");
         float statsSigStop = 0;
         if (h_sig_stop)
             statsSigStop = h_sig_stop->Integral();

         TH1F* h_sig_ttbar = (TH1F*)f->Get("combSTandTT_cutCount_sig_ttbar");
         float statsSigTtbar = 0;
         if (h_sig_ttbar)
             statsSigTtbar = h_sig_ttbar->Integral();


         TH1F* h_other = (TH1F*)f->Get("combSTandTT_cutCount_other");
         float statsOther = 0;
         if (h_other)
             statsOther = h_other->Integral();

	     TH1F* h_ttbb = (TH1F*)f->Get("combSTandTT_cutCount_ttbb");
	     float statsTtbb = 0;
         if (h_ttbb)
             statsTtbb = h_ttbb->Integral();

	     TH1F* h_ttcc = (TH1F*)f->Get("combSTandTT_cutCount_ttcc");
	     float statsTtcc = 0;
         if (h_ttcc)
             statsTtcc = h_ttcc->Integral();

	     TH1F* h_ttlf = (TH1F*)f->Get("combSTandTT_cutCount_ttlf");
	     float statsTtlf = 0;
         if (h_ttlf)
             statsTtlf = h_ttlf->Integral();


         TH1F* h_stop = (TH1F*)f->Get("combSTandTT_cutCount_stop");
         float statsStop = 0;
         if (h_stop)
            statsStop = h_stop->Integral();

         TH1F* h_wjets = (TH1F*)f->Get("combSTandTT_cutCount_wjets");
         float statsWjets = 0;
         if (h_wjets)
            statsWjets = h_wjets->Integral();

         TH1F* h_zjets = (TH1F*)f->Get("combSTandTT_cutCount_zjets");
         float statsZjets = 0;
         if (h_zjets)
            statsZjets = h_zjets->Integral();
         f->Close();


         TH1F* h_ttbbttccttlf = (TH1F*)f->Get("combSTandTT_cutCount_ttbbttccttlf");
         float statsTtbbcclf = 0;
         if (h_ttbbttccttlf)
             statsTtbbcclf = h_ttbbttccttlf->Integral();

         TH1F* h_ttbbttcc = (TH1F*)f->Get("combSTandTT_cutCount_ttbbttcc");
         float statsTtbbcc = 0;
         if (h_ttbbttcc)
             statsTtbbcc = h_ttbbttcc->Integral();

         TH1F* h_ttbbttlf = (TH1F*)f->Get("combSTandTT_cutCount_ttbbttlf");
         float statsTtbblf = 0;
         if (h_ttbbttlf)
             statsTtbblf = h_ttbbttlf->Integral();

         TH1F* h_ttccttlf = (TH1F*)f->Get("combSTandTT_cutCount_ttccttlf");
         float statsTtcclf = 0;
         if (h_ttccttlf)
             statsTtcclf = h_ttccttlf->Integral();


	     fc << "imax * # number of channels" << std::endl;
	     fc << "jmax * # number of backgrounds" << std::endl;
	     fc << "kmax * # number of nuisance parameters" << std::endl;
	     fc << "---------------" << std::endl;
	     fc << "bin " << cat[ic] << std::endl;
	     fc << "observation " << stats << std::endl;
	     fc << "---------------" << std::endl;
	     fc << "shapes * * " << fhist << " combSTandTT_cutCount_$PROCESS combSTandTT_cutCount_$PROCESS_$SYSTEMATIC" << std::endl;
	     fc << "---------------" << std::endl;
	     //fc << "bin " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << std::endl;
	     fc << "bin " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << std::endl;
	     //fc << "bin " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << std::endl;
	     //fc << "bin " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << std::endl;
	     //fc << "bin " << cat[ic] << " " << cat[ic] << " " << cat[ic] << std::endl;
	     //fc << "bin " << cat[ic] << " " << cat[ic] << " " << cat[ic] << std::endl;
	     //fc << "bin " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << std::endl;
	     //fc << "process sig sig_stop sig_ttbar ttbb ttcc ttlf stop wjets zjets other" << std::endl;
	     //fc << "process sig_stop sig_ttbar ttbb ttcc ttlf stop wjets zjets other" << std::endl;
	     fc << "process sig_ttbar ttbb ttcc ttlf other" << std::endl;
	     //fc << "process sig ttbb ttcc ttlf stop wjets zjets other" << std::endl;
	     //fc << "process sig ttbb ttcc ttlf ttbbttccttlf ttbbttcc ttbbttlf ttccttlf other" << std::endl;
	     //fc << "process sig ttbbttccttlf other" << std::endl;
	     //fc << "process sig other ttbbttccttlf" << std::endl;
	     //fc << "process sig_stop sig_ttbar other ttbbttccttlf" << std::endl;
	     //fc << "process 0 1 2 3 4 5 6 7 8 9" << std::endl;
	     //fc << "process 0 1 2 3 4 5 6 7" << std::endl;
	     //fc << "process 0 1 2 3 4 5 6 7 8" << std::endl;
	     fc << "process 0 1 2 3 4" << std::endl;
	     //fc << "process 0 1 2 3 4 5 6 7 8 9 10 11 12 13" << std::endl;
	     //fc << "process 0 1 2" << std::endl;
	     //fc << "process 0 1 2" << std::endl;
	     //fc << "process 0 1 2 3" << std::endl;
	     //fc << "rate "<< statsSig << " " << statsSigStop << " " << statsSigTtbar << " " << statsTtbb << " " << statsTtcc << " " << statsTtlf << " " << statsStop << " " << statsWjets << " " << statsZjets << " " << statsOther << std::endl;
	     //fc << "rate " << statsSig << " "  << statsSigStop << " " << statsSigTtbar << " " << statsTtbb << " " << statsTtcc << " " << statsTtlf << " " << statsStop << " " << statsWjets << " " << statsZjets << " " << statsTtbbcclf << " " << statsTtbbcc << " " << statsTtbblf << " " << statsTtcclf << " " << statsOther << std::endl;
	     //fc << "rate " << statsSigStop << " " << statsSigTtbar << " " << statsTtbb << " " << statsTtcc << " " << statsTtlf << " " << statsStop << " " << statsWjets << " " << statsZjets << " " << statsOther << std::endl;
	     fc << "rate " << statsSigTtbar << " " << statsTtbb << " " << statsTtcc << " " << statsTtlf << " " << statsOther << std::endl;
	     //fc << "rate "<< statsSig << " " << statsTtbb << " " << statsTtcc << " " << statsTtlf << " " << statsStop << " " << statsWjets << " " << statsZjets << " " << statsOther << std::endl;
	     //fc << "rate "<< statsSig << " " << statsTtbb << " " << statsTtcc << " " << statsTtlf << " " << statsTtbbcclf << " " << statsTtbbcc << " " << statsTtbblf << " " << statsTtcclf << " " << statsOther << std::endl;
	     //fc << "rate "<< statsSig << " " << statsTtbbcclf << " " << statsOther << std::endl;
	     //fc << "rate "<< statsSig << " " << statsOther << " " << statsTtbbcclf << std::endl;
	     //fc << "rate "<< statsSigStop << " " << statsSigTtbar << " " << statsOther << " " << statsTtbbcclf << std::endl;
/*	     fc << "bin " << cat[ic] << " " << cat[ic] << std::endl;
	     fc << "process sig other" << std::endl;
	     fc << "process 0 1" << std::endl;
	     fc << "rate "<< statsSig << " " << statsOther << std::endl;*/
         /*
	     fc << "---------------" << std::endl;
         fc << "SfIteraviveFitLf shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHf shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats2    shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr1    shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr2    shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfPileup    shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfLepton shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfTopPt shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "Jes shape 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "Jer shape 1 1 1 1 1 1 1 1 1" << std::endl;
         */
         /*
         fc << "SfIteraviveFitLf shape 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHf shape 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats2    shape 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr1    shape 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr2    shape 1 1 1 1 1 1 1" << std::endl;
         fc << "SfPileup    shape 1 1 1 1 1 1 1" << std::endl;
         fc << "SfLepton shape 1 1 1 1 1 1 1" << std::endl;
         fc << "SfTopPt shape 1 1 1 1 1 1 1" << std::endl;
         fc << "Jes shape 1 1 1 1 1 1 1" << std::endl;
         fc << "Jer shape 1 1 1 1 1 1 1" << std::endl;
         */
         /*
         fc << "SfIteraviveFitLf shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHf shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats2    shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr1    shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr2    shape 1 1 1 1 1" << std::endl;
         fc << "SfPileup    shape 1 1 1 1 1" << std::endl;
         fc << "SfLepton shape 1 1 1 1 1" << std::endl;
         fc << "SfTopPt shape 1 1 1 1 1" << std::endl;
         fc << "Jes shape 1 1 1 1 1" << std::endl;
         fc << "Jer shape 1 1 1 1 1" << std::endl;
         */
         /*
         fc << "SfIteraviveFitLf shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHf shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats2 shape 1 1 1 1 1" << std::endl;
         //fc << "SfIteraviveFitCferr1 shape 1 1 1 1 1" << std::endl;
         fc << "SfPileup shape 1 1 1 1 1" << std::endl;
         fc << "SfLepton shape 1 1 1 1 1" << std::endl;
         fc << "SfTopPt shape 1 1 1 1 1" << std::endl;
         fc << "Jes shape 1 1 1 1 1" << std::endl;
         fc << "Jer shape 1 1 1 1 1" << std::endl;
         */
         /*
         fc << "SfIteraviveFitLf shape 1 1" << std::endl;
         fc << "SfIteraviveFitHf shape 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats1 shape 1 1" << std::endl;
         //fc << "SfIteraviveFitLfstats2 shape 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats1 shape 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats2 shape 1 1" << std::endl;
         fc << "SfIteraviveFitCferr1 shape 1 1" << std::endl;
         fc << "SfIteraviveFitCferr2 shape 1 1" << std::endl;
         fc << "SfPileup shape 1 1" << std::endl;
         fc << "SfLepton shape 1 1" << std::endl;
         fc << "SfTopPt shape 1 1" << std::endl;
         fc << "Jes shape 1 1" << std::endl;
         fc << "Jer shape 1 1" << std::endl;
         */
         /*
         fc << "SfIteraviveFitLf shape 1 1 1" << std::endl;
         fc << "SfIteraviveFitHf shape 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats1 shape 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats2 shape 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats1 shape 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats2 shape 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr1 shape 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr2 shape 1 1 1" << std::endl;
         fc << "SfPileup shape 1 1 1" << std::endl;
         fc << "SfLepton shape 1 1 1" << std::endl;
         fc << "SfTopPt shape 1 1 1" << std::endl;
         fc << "Jes shape 1 1 1" << std::endl;
         fc << "Jer shape 1 1 1" << std::endl;
         */
         /*
         fc << "SfIteraviveFitLf shape 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHf shape 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats1 shape 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats2 shape 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats1 shape 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats2 shape 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr1 shape 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr2 shape 1 1 1 1" << std::endl;
         fc << "SfPileup shape 1 1 1 1" << std::endl;
         fc << "SfLepton shape 1 1 1 1" << std::endl;
         fc << "SfTopPt shape 1 1 1 1" << std::endl;
         fc << "Jes shape 1 1 1 1" << std::endl;
         fc << "Jer shape 1 1 1 1" << std::endl;
         */
         /*
         fc << "SfIteraviveFitLf shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHf shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats2 shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr1 shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr2 shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfPileup shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfLepton shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfTopPt shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "Jes shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "Jer shape 1 1 1 1 1 1 1 1" << std::endl;
         */
         /*
         fc << "SfIteraviveFitLf shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHf shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats2 shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr1 shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr2 shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfPileup shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfLepton shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfTopPt shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "Jes shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "Jer shape 1 1 1 1 1 1 1 1 1 1 1 1" << std::endl;
         */
//         fc << "SfIteraviveFitLf shape 1 1 1 1 1 1 1 1" << std::endl;
//         fc << "SfIteraviveFitHf shape 1 1 1 1 1 1 1 1" << std::endl;
//         fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1 1 1 1" << std::endl;
//         fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1 1 1 1" << std::endl;
//         fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1 1 1 1" << std::endl;
//         fc << "SfIteraviveFitHfstats2 shape 1 1 1 1 1 1 1 1" << std::endl;
//         fc << "SfIteraviveFitCferr1 shape 1 1 1 1 1 1 1 1" << std::endl;
//         fc << "SfIteraviveFitCferr2 shape 1 1 1 1 1 1 1 1" << std::endl;
         /*
         fc << "SfPileup shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfLepton shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfTopPt shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "Jes shape 1 1 1 1 1 1 1 1" << std::endl;
         fc << "Jer shape 1 1 1 1 1 1 1 1" << std::endl;
         */
         /*
         if(cat[ic] == "b2j3") {
             fc << "lumi lnN 1.026 - - - -" << std::endl;
             fc << "tt_norm lnN - 1.055 1.055 1.055 -" << std::endl;
             fc << "other_norm lnN - - - - 1.1" << std::endl;
             fc << "SfIteraviveFitLf shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitHf shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitHfstats2 shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitCferr1 shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitCferr2 shape 1 1 1 1 1" << std::endl;
             fc << "SfPileup shape 1 1 1 1 1" << std::endl;
             fc << "SfLepton shape 1 1 1 1 1" << std::endl;
             fc << "SfTopPt shape 1 1 1 1 1" << std::endl;
             fc << "Jes shape 1 1 1 1 1" << std::endl;
             fc << "Jer shape 1 1 1 1 1" << std::endl;
             fc << "hdamp shape 0 1 1 1 0" << std::endl;
             fc << "scaleEnvelope shape 0 0 1 1 0" << std::endl;
             fc << "UE shape 0 1 1 1 0" << std::endl;
             fc << "PDFEnvelope shape 0 0 1 1 0" << std::endl;
         }
         else {
         */
             //fc << "lumi lnN 1.026 - - - -" << std::endl;
             fc << "lumi lnN 1.026 1.026 1.026 1.026 1.026" << std::endl;
             fc << "tt_norm lnN - 1.055 1.055 1.055 -" << std::endl;
             //fc << "tt_additional lnN - 1.5 1.5 - -" << std::endl;
             fc << "tt_addbb lnN - 1.5 - - -" << std::endl;
             fc << "tt_addcc lnN - - 1.5 - -" << std::endl;
             fc << "other_norm lnN - - - - 1.1" << std::endl;
             fc << "SfIteraviveFitLf shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitHf shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitHfstats2 shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitCferr1 shape 1 1 1 1 1" << std::endl;
             fc << "SfIteraviveFitCferr2 shape 1 1 1 1 1" << std::endl;
             fc << "SfPileup shape 1 1 1 1 1" << std::endl;
             fc << "SfLepton shape 1 1 1 1 1" << std::endl;
             //fc << "SfTopPt shape 1 1 1 1 1" << std::endl;
             fc << "SfTopPt shape - 1 1 1 -" << std::endl;
             fc << "Jes shape 1 1 1 1 1" << std::endl;
             fc << "Jer shape 1 1 1 1 1" << std::endl;
             fc << "hdamp shape 0 1 1 1 0" << std::endl;
             //fc << "scaleEnvelope shape 0 1 1 1 0" << std::endl;
             //fc << "UE shape 0 1 1 1 0" << std::endl;
             //fc << "PDFEnvelope shape 0 1 1 1 0" << std::endl;
             const char *procs[] = {"sig_ttbar", "ttbb", "ttcc", "ttlf", "other"};
             const char *Procs[] = {"SigTTbar", "ttbb", "ttcc", "ttlf", "other"};
             int nprocs = 5;
             for (int np = 0; np < nprocs; np++) {
                const char *flags[] = {"0", "0", "0", "0", "0"};
                flags[np] = "1";
                std::string sflags = std::string(flags[0])+" "+std::string(flags[1])+" "+std::string(flags[2])+" "+std::string(flags[3])+" "+std::string(flags[4]);
                for (int nbin = 0; nbin < 20; nbin++) {
                    if (!f1->Get(("combSTandTT_cutCount_" + std::string(procs[np]) + "_" + cat[ic] + "StatBin" + std::string(Procs[np]) + std::to_string(nbin) + "Down").c_str())) continue;
                    fc << cat[ic] << "StatBin" << std::string(Procs[np]) << std::to_string(nbin) << " shape " << sflags << std::endl;
                }
             }
        // }
        /*
        if (inSystArr("SfIteraviveFitLf", exclude))       fc << "SfIteraviveFitLf shape 1 1 1 1 1 1 1 1 1" << std::endl;          else  fc << "SfIteraviveFitLf shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("SfIteraviveFitHf", exclude))       fc << "SfIteraviveFitHf shape 1 1 1 1 1 1 1 1 1" << std::endl;          else  fc << "SfIteraviveFitHf shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("SfIteraviveFitLfstats1", exclude)) fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1 1 1 1 1" << std::endl;    else  fc << "SfIteraviveFitLfstats1 shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("SfIteraviveFitLfstats2", exclude)) fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1 1 1 1 1" << std::endl;    else  fc << "SfIteraviveFitLfstats2 shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("SfIteraviveFitHfstats1", exclude)) fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1 1 1 1 1" << std::endl;    else  fc << "SfIteraviveFitHfstats1 shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("SfIteraviveFitHfstats2", exclude)) fc << "SfIteraviveFitHfstats2    shape 1 1 1 1 1 1 1 1 1" << std::endl; else  fc << "SfIteraviveFitHfstats2    shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("SfIteraviveFitCferr1", exclude))   fc << "SfIteraviveFitCferr1    shape 1 1 1 1 1 1 1 1 1" << std::endl;   else  fc << "SfIteraviveFitCferr1    shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("SfIteraviveFitCferr2", exclude))   fc << "SfIteraviveFitCferr2    shape 1 1 1 1 1 1 1 1 1" << std::endl;   else  fc << "SfIteraviveFitCferr2    shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("SfPileup", exclude))               fc << "SfPileup    shape 1 1 1 1 1 1 1 1 1" << std::endl;               else  fc << "SfPileup    shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("SfLepton", exclude))               fc << "SfLepton shape 1 1 1 1 1 1 1 1 1" << std::endl;                  else  fc << "SfLepton shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("SfTopPt", exclude))                fc << "SfTopPt shape 1 1 1 1 1 1 1 1 1" << std::endl;                   else  fc << "SfTopPt shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("Jes", exclude))                    fc << "Jes shape 1 1 1 1 1 1 1 1 1" << std::endl;                       else  fc << "Jes shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        if (inSystArr("Jer", exclude))                    fc << "Jer shape 1 1 1 1 1 1 1 1 1" << std::endl;                       else  fc << "Jer shape 0 0 0 0 0 0 0 0 0 0" << std::endl;
        */
        /*
        if (inSystArr("SfIteraviveFitLf", exclude))       fc << "SfIteraviveFitLf shape 1 1 1 1 1 1 1 1 1" << std::endl;          else  fc << "SfIteraviveFitLf shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("SfIteraviveFitHf", exclude))       fc << "SfIteraviveFitHf shape 1 1 1 1 1 1 1 1 1" << std::endl;          else  fc << "SfIteraviveFitHf shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("SfIteraviveFitLfstats1", exclude)) fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1 1 1 1 1" << std::endl;    else  fc << "SfIteraviveFitLfstats1 shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("SfIteraviveFitLfstats2", exclude)) fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1 1 1 1 1" << std::endl;    else  fc << "SfIteraviveFitLfstats2 shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("SfIteraviveFitHfstats1", exclude)) fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1 1 1 1 1" << std::endl;    else  fc << "SfIteraviveFitHfstats1 shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("SfIteraviveFitHfstats2", exclude)) fc << "SfIteraviveFitHfstats2    shape 1 1 1 1 1 1 1 1 1" << std::endl; else  fc << "SfIteraviveFitHfstats2    shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("SfIteraviveFitCferr1", exclude))   fc << "SfIteraviveFitCferr1    shape 1 1 1 1 1 1 1 1 1" << std::endl;   else  fc << "SfIteraviveFitCferr1    shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("SfIteraviveFitCferr2", exclude))   fc << "SfIteraviveFitCferr2    shape 1 1 1 1 1 1 1 1 1" << std::endl;   else  fc << "SfIteraviveFitCferr2    shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("SfPileup", exclude))               fc << "SfPileup    shape 1 1 1 1 1 1 1 1 1" << std::endl;               else  fc << "SfPileup    shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("SfLepton", exclude))               fc << "SfLepton shape 1 1 1 1 1 1 1 1 1" << std::endl;                  else  fc << "SfLepton shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("SfTopPt", exclude))                fc << "SfTopPt shape 1 1 1 1 1 1 1 1 1" << std::endl;                   else  fc << "SfTopPt shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("Jes", exclude))                    fc << "Jes shape 1 1 1 1 1 1 1 1 1" << std::endl;                       else  fc << "Jes shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        if (inSystArr("Jer", exclude))                    fc << "Jer shape 1 1 1 1 1 1 1 1 1" << std::endl;                       else  fc << "Jer shape 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1" << std::endl;
        */
        /*
        if (inSystArr("SfIteraviveFitLf", exclude))       fc << "SfIteraviveFitLf shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;          else  fc << "SfIteraviveFitLf shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("SfIteraviveFitHf", exclude))       fc << "SfIteraviveFitHf shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;          else  fc << "SfIteraviveFitHf shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("SfIteraviveFitLfstats1", exclude)) fc << "SfIteraviveFitLfstats1 shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;    else  fc << "SfIteraviveFitLfstats1 shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("SfIteraviveFitLfstats2", exclude)) fc << "SfIteraviveFitLfstats2 shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;    else  fc << "SfIteraviveFitLfstats2 shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("SfIteraviveFitHfstats1", exclude)) fc << "SfIteraviveFitHfstats1 shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;    else  fc << "SfIteraviveFitHfstats1 shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("SfIteraviveFitHfstats2", exclude)) fc << "SfIteraviveFitHfstats2    shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl; else  fc << "SfIteraviveFitHfstats2    shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("SfIteraviveFitCferr1", exclude))   fc << "SfIteraviveFitCferr1    shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;   else  fc << "SfIteraviveFitCferr1    shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("SfIteraviveFitCferr2", exclude))   fc << "SfIteraviveFitCferr2    shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;   else  fc << "SfIteraviveFitCferr2    shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("SfPileup", exclude))               fc << "SfPileup    shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;               else  fc << "SfPileup    shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("SfLepton", exclude))               fc << "SfLepton shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;                  else  fc << "SfLepton shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("SfTopPt", exclude))                fc << "SfTopPt shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;                   else  fc << "SfTopPt shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("Jes", exclude))                    fc << "Jes shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;                       else  fc << "Jes shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        if (inSystArr("Jer", exclude))                    fc << "Jer shape 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8 0.8" << std::endl;                       else  fc << "Jer shape 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2" << std::endl;
        */

/*	     fc << "SfIterativeFitHfstats1 shape 1 1" << std::endl;
	     fc << "SfIterativeFitHfstats2 shape 1 1" << std::endl;
	     fc << "SfIterativeFitLfstats1 shape 1 1" << std::endl;
	     fc << "SfIterativeFitLfstats2 shape 1 1" << std::endl;
	     fc << "SfIterativeFitJes shape 1 1" << std::endl;
	     fc << "SfIterativeFitLf shape 1 1" << std::endl;
	     fc << "SfIterativeFitHf shape 1 1" << std::endl;
	     fc << "SfIterativeFitCferr1 shape 1 1" << std::endl;
	     fc << "SfIterativeFitCferr2 shape 1 1" << std::endl;
	     fc << "Jes shape 1 1" << std::endl;
	     fc << "Jer shape 1 1" << std::endl;*/
	     fc << "---------------" << std::endl;
	     
	     fc.close();
	  }
     }
   
   gApplication->Terminate();
}
