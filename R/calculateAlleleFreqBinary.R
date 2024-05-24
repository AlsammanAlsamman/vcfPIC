#' Calculate allele frequency for Binary file read by \code{\link{readGeneticBinaryTable}} function
#' @description
#' Calculate allele frequency for BinaryTable  file read by \code{\link{readGeneticBinaryTable}} function
#' @param BinaryTable A data frame containing Binary data
#' @return A data frame containing allele frequency
#' @export
#' @examples
#' binaryData<-readGeneticBinaryTable("data/sheep_genotypes_binary.tsv")
#' calculateAlleleFreqBinary(binaryData)
calculateAlleleFreqBinary <- function(BinaryTable, roundnum=2){
  rs<-BinaryTable[,1]
  alleles<-BinaryTable[,2]
  chr<-BinaryTable[,3]
  pos<-BinaryTable[,4]
  # remove first 4 columns
  BinaryTable<-BinaryTable[,-c(1:4)]
  BinaryData<-as.matrix(BinaryTable)
  print(paste("The allele matrix is:","row:",nrow(BinaryData),"column:",ncol(BinaryData)))
  freq<-.Call("calculateFreq_c",as.matrix(BinaryData))

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

