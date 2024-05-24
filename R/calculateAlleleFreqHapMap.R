#' Calculate allele frequency for haplotype  file
#' @description
#' Calculate allele frequency for haplotype  file read by \code{\link{readHapmap}} function
#' @param hapmapData A data frame containing haplotype data
#' @return A data frame containing allele frequency
#' @examples
#' hapmapData<-readHapmap("data/sample_hapDouble.hapmap")
#' calculateAlleleFreqHapMap(hapmapData)
#' @export
calculateAlleleFreqHapMap <- function(hapmapData, roundnum=2){
  rs<-hapmapData[,1]
  alleles<-hapmapData[,2]
  chr<-hapmapData[,3]
  pos<-hapmapData[,4]
  # remove the first 11 columns
  hapmapData<-convertGenoBi2Numeric(hapmapData)
  hapmapData<-as.matrix(hapmapData)
  print(paste("The allele matrix is:","row:",nrow(hapmapData),"column:",ncol(hapmapData)))
  freq<-.Call("calculateFreq_c",as.matrix(hapmapData))

  freq<-round(freq,roundnum)
  # convert the output to a data frame
  markerFreq<-cbind(rs,alleles,chr,pos,freq)
  # add the rs, chr and pos columns
  colnames(markerFreq)<-c("rs","alleles","chr","pos","AA","AB","BB")
  markerFreq<-as.data.frame(markerFreq)
  markerFreq$AA<-as.numeric(markerFreq$AA)
  markerFreq$AB<-as.numeric(markerFreq$AB)
  markerFreq$BB<-as.numeric(markerFreq$BB)
  return(markerFreq)
}

