#' Calculate the polymorphism information content (PIC) of a set of alleles
#' @param AlleleFreq A matrix of allele frequencies,
#' with rows representing alleles and columns representing individuals \code{\link{calculateAlleleFreq}}
#' @return The polymorphism information content (PIC) of the alleles
#' @export
calculatePIC<-function(AlleleFreq)
{
  markerFreq<-.Call("calculatePIC", as.matrix(AlleleFreq[,-c(1:3)]))
  # create a data frame with the PIC values
  PIC<-data.frame(rs=AlleleFreq[,1], chr=AlleleFreq[,2], pos=AlleleFreq[,3], PIC=markerFreq)
  return(PIC)
}

