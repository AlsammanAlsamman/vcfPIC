#include "R.h"
#include "Rinternals.h"


// Function to calculate allele frequencies
SEXP calculateAlleleFreqVCF_c(SEXP vcfx) {
  // The matrix of characters from R in VCF format
  SEXP vcf_R = PROTECT(coerceVector(vcfx, STRSXP));

  int nr = nrows(vcfx);
  int nc = ncols(vcfx);

  // create a matrix of frequencies of nr * 3
  // 0, 1, 2
  // 0/0, 0/1, 1/1

  SEXP freq = PROTECT(allocMatrix(REALSXP, nr, 3));
  double *freq_p = REAL(freq);

  // initialize the matrix
  for(int i=0; i<nr*3; i++){
    freq_p[i] = 0;
  }

  // calculate the frequencies
  for(int r=0; r<nr; r++){
    int mc = 0;
    for(int c=0; c<nc; c++){

      const char *genotype = CHAR(STRING_ELT(vcf_R, r+c*nr));
      // if genotype contains a 0/0 add 1 to the first column in the first row
      if(strstr(genotype, "0/0") != NULL){
        freq_p[r] += 1;
        mc++;
      }

      // if genotype contains a 0/1 add 1 to the second column in the first row
      if(strstr(genotype, "0/1") != NULL){
        freq_p[r+nr] += 1;
        mc++;
      }
      if(strstr(genotype, "1/0") != NULL){
        freq_p[r+nr] += 1;
        mc++;
      }
      // if genotype contains a 1/1 add 1 to the third column in the first row
      if(strstr(genotype, "1/1") != NULL){
        freq_p[r+2*nr] += 1;
        mc++;
      }
    }
    // normalize the frequencies
    for(int c=0; c<3; c++){
      freq_p[r+c*nr] /= mc;
    }
  }
  UNPROTECT(2);
  return freq;
}
