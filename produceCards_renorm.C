void produceCards_renorm()
{
   gROOT->SetBatch(1);

   const int nc = 5;
   std::string cat[nc] = {"b2j3","b2j4","b3j3","b3j4","b4j4"};
   const int nd = 2;
   std::string dist[nd] = {"MVAHutMAX","MVAHctMAX"};
   std::string coup[nd] = {"hut","hct"};
   
   for(int id=0;id<nd;id++)
     {	
	for(int ic=0;ic<nc;ic++)
	  {	
	     std::string fname = "input_"+dist[id]+"_"+cat[ic]+"_"+coup[id];
	     //std::string fhist = "/afs/cern.ch/work/c/cirkovic/TrainingsFCNC/input/"+fname+".root";
	     std::string fhist = "/afs/cern.ch/work/c/cirkovic/TrainingsFCNC/input_renorm/"+fname+".root";
	     std::string fcard = "cards/"+fname+".txt";
	     std::ofstream fc(fcard.c_str());
	     
	     TFile *f = TFile::Open(fhist.c_str(),"READ");
	     TH1F* h_data = (TH1F*)f->Get("h_data_obs");
	     int stats = h_data->Integral();
	     TH1F* h_sig = (TH1F*)f->Get("h_sig");
	     float statsSig = h_sig->Integral();
         TH1F* h_sig_stop = (TH1F*)f->Get("h_sig_stop");
         float statsSigStop = h_sig_stop->Integral();
         //if (id == 0) // hut
         //    statsSigStop = statsSigStop/0.88*13.84;
         //else if (id == 1) //hct
         //    statsSigStop = statsSigStop/0.11*1.90;
         TH1F* h_sig_ttbar = (TH1F*)f->Get("h_sig_ttbar");
         float statsSigTtbar = h_sig_ttbar->Integral();
         //statsSigTtbar = statsSigTtbar/4.892*36.98;
	     TH1F* h_ttbb = (TH1F*)f->Get("h_ttbb");
	     float statsTtbb = h_ttbb->Integral();
	     TH1F* h_ttcc = (TH1F*)f->Get("h_ttcc");
	     float statsTtcc = h_ttcc->Integral();
	     TH1F* h_ttlf = (TH1F*)f->Get("h_ttlf");
	     float statsTtlf = h_ttlf->Integral();
         TH1F* h_stop = (TH1F*)f->Get("h_stop");
         float statsStop = h_stop->Integral();
         TH1F* h_wjets = (TH1F*)f->Get("h_wjets");
         float statsWjets = h_wjets->Integral();
         TH1F* h_zjets = (TH1F*)f->Get("h_zjets");
         float statsZjets = h_zjets->Integral();
	     TH1F* h_other = (TH1F*)f->Get("h_other");
	     float statsOther = h_other->Integral();
	     f->Close();
   
	     fc << "imax * # number of channels" << std::endl;
	     fc << "jmax * # number of backgrounds" << std::endl;
	     fc << "kmax * # number of nuisance parameters" << std::endl;
	     fc << "---------------" << std::endl;
	     fc << "bin " << cat[ic] << std::endl;
	     fc << "observation " << stats << std::endl;
	     fc << "---------------" << std::endl;
	     fc << "shapes * * " << fhist << " h_$PROCESS h_$PROCESS_$SYSTEMATIC" << std::endl;
	     fc << "---------------" << std::endl;
	     fc << "bin " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << " " << cat[ic] << std::endl;
	     fc << "process sig sig_stop sig_ttbar ttbb ttcc ttlf stop wjets zjets other" << std::endl;
	     fc << "process 0 1 2 3 4 5 6 7 8 9" << std::endl;
	     fc << "rate "<< statsSig << " " << statsSigStop << " " << statsSigTtbar << " " << statsTtbb << " " << statsTtcc << " " << statsTtlf << " " << statsStop << " " << statsWjets << " " << statsZjets << " " << statsOther << std::endl;
/*	     fc << "bin " << cat[ic] << " " << cat[ic] << std::endl;
	     fc << "process sig other" << std::endl;
	     fc << "process 0 1" << std::endl;
	     fc << "rate "<< statsSig << " " << statsOther << std::endl;*/
	     fc << "---------------" << std::endl;
         fc << "SfIteraviveFitLf shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHf shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats1 shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitLfstats2 shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats1 shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitHfstats2    shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr1    shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfIteraviveFitCferr2    shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfPileup    shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfLepton shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "SfTopPt shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "Jes shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
         fc << "Jer shape 1 1 1 1 1 1 1 1 1 1" << std::endl;
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
