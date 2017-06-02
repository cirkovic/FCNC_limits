{
   TCanvas *c4 = new TCanvas("c4","c4",200,10,600,400);
   //double x[] = {0, 1, 2, 3, 4};
   double x[] = {1, 1, 1, 1, 1};
   double y[] = {0, 2, 4, 1, 3};
   double ex[] = {0.1, 0.2, 0.3, 0.4, 0.5};
   double ey[] = {0, 0, 0, 0, 0};
   TGraphErrors* ge = new TGraphErrors(5, x, y, ex, ey);
   ge->Draw("ap");
   return c4;
}
