#include "R.h"
#include "Rinternals.h"


SEXP calculateFreq_c(SEXP alleleMatrix)
{
  int i, j;
  i = nrows(alleleMatrix);
  j = ncols(alleleMatrix);
  // create a pointer to the allele matrix
  int *allelePtr = INTEGER(alleleMatrix);
  Rprintf("The allele matrix is %d x %d\n", i, j);
  // // print the allele matrix
  // for (int k = 0; k < i; k++)
  // {
  //   for (int l = 0; l < j; l++)
  //   {
  //     Rprintf("%d ", allelePtr[k + l * i]);
  //   }
  //   Rprintf("\n");
  // }

  // create a frequency matrix of i rows and 3 columns (AA, AB, BB)
  SEXP freq;
  PROTECT(freq = allocMatrix(REALSXP, i, 3));
  double *freqPtr = REAL(freq);
  // initialize the frequency matrix
  memset(freqPtr, 0, i * 3 * sizeof(double));
  // calculate the frequency matrix
  for (int k = 0; k < i; k++)
  {
    double a1 = 0 , a2 = 0, a3 = 0, sum = 0;
    for (int l = 0; l < j; l++)
    {
      // print the allele value
      // Rprintf("%d ", allelePtr[k + l * i]);
    if (allelePtr[k + l * i] == 0)
    {
      a1 ++;
      sum++;
    }
    else if (allelePtr[k + l * i] == 1)
    {
      a2 ++;
      sum++;
    }
    else if (allelePtr[k + l * i] == 2)
    {
      a3 ++;
      sum++;
    }
    // // if missing = -1
    // else if (allelePtr[k + l * i] == -1)
    // {
    //   sum++;
    // }
    }
    freqPtr[k] = a1/sum;
    freqPtr[k + i] = a2/sum;
    freqPtr[k + 2 * i] = a3/sum;
    // Rprintf("\n");
  }
  UNPROTECT(1);
  return freq;
}
