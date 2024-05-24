#' Calculate the polymorphism information content (PIC) of a set of alleles from allele frequencies
#' @param AlleleFreq A matrix of allele frequencies,
#' with rows representing alleles and columns representing individuals \code{\link{calculateAlleleFreq}}
#' @return The polymorphism information content (PIC) of the alleles
#' @export
calculatePICByFreq<-function(AlleleFreq)
{
  # calculate the PIC values
  print("Calculating PIC values")
  markerFreq<-.Call("calculatePIC_c", as.matrix(AlleleFreq[,-c(1:4)]))
  # create a data frame with the PIC values
  PIC<-data.frame(rs=AlleleFreq[,1], alleles=AlleleFreq[,2], chr=AlleleFreq[,3], pos=AlleleFreq[,4], AA=AlleleFreq[,5], AB=AlleleFreq[,6], BB=AlleleFreq[,7],PIC=markerFreq)
  return(PIC)
}

