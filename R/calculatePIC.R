#' Calculate Polymorphic Information Content (PIC) from VCF , Hapmap file, Genetic Binary Table read by \code{\link{readGeneticBinaryTable}}
#' @param filepath path to the file
#' @param filetype type of file, either vcf , hapmap , or genetic binary table
#' @param outpath path to write the PIC values
#' @return PIC values
#' @export
#' @examples
#' calculatePIC("data/sheep_genotypes.vcf", "vcf")
#' calculatePIC("data/sheep_genotypes.hmp", "hapmap")
#' calculatePIC("data/sheep_genotypes_binary.tsv", "binary")

calculatePIC<-function(filepath, filetype,outpath="")
{
  PIC <- NULL
  if(filetype=="vcf")
  {
    vcfData<-readVCF(filepath)
    freqVCF<-calculateAlleleFreqVCF(vcfData)
    PIC <- calculatePICByFreq(freqVCF)
  }
  else if(filetype=="hapmap")
  {
    hapmapData<-readHapmap(filepath)
    hapmapData.Binary<-convertGenoBi2Numeric(hapmapData)
    freqHAP<-calculateAlleleFreqHapMap(hapmapData)
    PIC <- calculatePICByFreq(freqHAP)
  }
  else if(filetype=="binary")
  {
    binaryData<-readGeneticBinaryTable(filepath, header=TRUE, sep="\t")
    TableBinarFreq<-calculateAlleleFreqBinary(binaryData)
    PIC <- calculatePICByFreq(TableBinarFreq)
  } else
  {
    print("Invalid file type, please choose either vcf or hapmap")
  }

  if(outpath!="")
  {
    write.table(PIC, outpath, sep="\t", row.names=FALSE)
  }
  return(PIC)
}
