#include "R.h"
#include "Rinternals.h"

SEXP calculatePIC_c(SEXP FreqMatrix)
{
 // number of rows and columns
 int n = nrows(FreqMatrix);
 int m = ncols(FreqMatrix);
 Rprintf("The matrix SNP = %d \t Alleles = %d\n", n, m);
 // create a vector for the results
 SEXP pic = PROTECT(allocVector(REALSXP, n));
 double *p = REAL(FreqMatrix);
 // loop through the matrix
 for (int i = 0; i < n; i++) {
   double sum_p_squared = 0.0;
   // p1 , p2, p3, p4, p5, p6, p7, p8, p9
   for (int j = 0; j < m; j++) {
     sum_p_squared += p[i + j * n] * p[i + j * n];
   }
   REAL(pic)[i] = 1 - sum_p_squared;
 }
 UNPROTECT(1);
 return pic;
}
