#include "R.h"
#include "Rinternals.h"

SEXP calculatePIC(SEXP FreqMatrix)
{
 // number of rows and columns
 int n = nrows(FreqMatrix);
 int m = ncols(FreqMatrix);
 Rprintf("n = %d \t m = %d\n", n, m);
 // create a vector for the results
 SEXP pic = PROTECT(allocVector(REALSXP, n));
 double *p = REAL(FreqMatrix);
 // loop through the matrix
 for (int i = 0; i < n; i++) {
   double sum_p_squared = 0.0;
   for (int j = 0; j < m; j++) {
     sum_p_squared += p[i + j * n] * p[i + j * n];
   }
   REAL(pic)[i] = 1 - sum_p_squared;
 }
 UNPROTECT(1);
 return pic;
}


//
// // get the length of the vector
// int n = LENGTH(FreqMatrix);
// // create a
// double *p = REAL(FreqMatrix);
// // create a matrix of outer products
// double o[n][n];
// double PIC;
//
// // Calculate the outer product of p^2
// for (int i = 0; i < n; i++) {
//   for (int j = 0; j < n; j++) {
//     o[i][j] = p[i] * p[i] * p[j] * p[j];
//   }
// }
//
// // Calculate PIC
// double sum_p_squared = 0.0;
// double sum_upper_tri_o = 0.0;
//
// for (int i = 0; i < n; i++) {
//   sum_p_squared += p[i] * p[i];
//   for (int j = i + 1; j < n; j++) {
//     sum_upper_tri_o += 2 * o[i][j];
//   }
// }
// PIC = 1 - sum_p_squared - sum_upper_tri_o;
// return ScalarReal(PIC);
