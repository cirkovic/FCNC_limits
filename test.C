void test(const char *fn) {
    TFile *f1 = TFile::Open(fn);
    RooFitResult *fb = (RooFitResult *)f1->Get("fit_b");
    fb->Print();
}
