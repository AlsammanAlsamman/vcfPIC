#' Calculate the allele frequency of each variant in a VCF file
#' @param vcf A data frame containing the VCF file read by the read.vcf function \code{\link{read.vcf}}
#' @export
#' @examples
#' \dontrun{
#' library(vcfPIC)
#' vcfData<-readVCF("data/sheep_genotypes.vcf")
#' calculateAlleleFreq(vcfData)
#' }
calculateAlleleFreq<-function(vcf){
  ############## Prepare the vcffile
  # remove the first 9 columns
  rs<-vcf$V3
  chr<-vcf$V1
  pos<-vcf$V2
  vcf<-vcf[,-(1:9)]
  vcf<-as.matrix(vcf)
  # get the number of rows and columns
  nr<-nrow(vcf)
  nc<-ncol(vcf)
  ############## Call the C function
  markerFreq<-.Call("calculateAlleleFreq_c", vcf, as.integer(nr), as.integer(nc), PACKAGE="vcfPIC")
  round(markerFreq,2)
  # convert the output to a data frame
  markerFreq<-cbind(rs,chr,pos,markerFreq)
  # add the rs, chr and pos columns
  colnames(markerFreq)<-c("rs","chr","pos","AA","AB","BB")
  markerFreq<-as.data.frame(markerFreq)
  markerFreq$AA<-as.numeric(markerFreq$AA)
  markerFreq$AB<-as.numeric(markerFreq$AB)
  markerFreq$BB<-as.numeric(markerFreq$BB)
  return(markerFreq)
}



