#include "R.h"
#include "Rinternals.h"

// c_sum.c -> c_sum.o -> c_sum.so

SEXP c_sum(SEXP x) {
  int n = length(x);
  double sum = 0; // user double to avoid overflow
  for (int i = 0; i < n; i++) {
    sum += REAL(x)[i]; // 1:3 -> [1, 2, 3] index starts from 0 = 1st element
  }
  return ScalarReal(sum);
}
