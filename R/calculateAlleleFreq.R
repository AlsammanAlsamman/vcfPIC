#' @export
#' @import inline
calculateAlleleFreq<-function(vcf){
  ############## Prepare the vcffile
  # remove the first 9 columns
  vcf<-vcf[,-(1:9)]
  vcf<-as.matrix(vcf)
  # get the number of rows and columns
  nr<-nrow(vcf)
  nc<-ncol(vcf)
  ############## Call the C function
  .Call("calculateAlleleFreq_c", vcf, as.integer(nr), as.integer(nc), PACKAGE="vcfPIC")
}



