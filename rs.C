void rs(const char *fn) {
TFile *f = TFile::Open(fn);
TH1F *h;
h = (TH1F*)f->Get("combSTandTT_cutCount_ttbb_scaleEnvelopeUp");
std::cout << h->Integral() << std::endl;
h = (TH1F*)f->Get("combSTandTT_cutCount_ttbb_scaleEnvelopeDown");
std::cout << h->Integral() << std::endl;
h = (TH1F*)f->Get("combSTandTT_cutCount_ttcc_scaleEnvelopeUp");
std::cout << h->Integral() << std::endl;
h = (TH1F*)f->Get("combSTandTT_cutCount_ttcc_scaleEnvelopeDown");
std::cout << h->Integral() << std::endl;
h = (TH1F*)f->Get("combSTandTT_cutCount_ttlf_scaleEnvelopeUp");
std::cout << h->Integral() << std::endl;
h = (TH1F*)f->Get("combSTandTT_cutCount_ttlf_scaleEnvelopeDown");
std::cout << h->Integral() << std::endl;

h = (TH1F*)f->Get("combSTandTT_cutCount_ttbb_PDFEnvelopeUp");
std::cout << h->Integral() << std::endl;
h = (TH1F*)f->Get("combSTandTT_cutCount_ttbb_PDFEnvelopeDown");
std::cout << h->Integral() << std::endl;
h = (TH1F*)f->Get("combSTandTT_cutCount_ttcc_PDFEnvelopeUp");
std::cout << h->Integral() << std::endl;
h = (TH1F*)f->Get("combSTandTT_cutCount_ttcc_PDFEnvelopeDown");
std::cout << h->Integral() << std::endl;
h = (TH1F*)f->Get("combSTandTT_cutCount_ttlf_PDFEnvelopeUp");
std::cout << h->Integral() << std::endl;
h = (TH1F*)f->Get("combSTandTT_cutCount_ttlf_PDFEnvelopeDown");
std::cout << h->Integral() << std::endl;

}
