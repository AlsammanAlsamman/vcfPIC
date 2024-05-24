#' Read a binary table of genetic data coded as 0, 1, 2, -1
#'@description Read a binary table of genetic data coded as 0, 1, 2, -1
#'Where AA = 0, AB = 1, BB = 2, and missing data = -1
#'@param binartablepath The path to the binary table
#'@param header A logical value indicating whether the file has a header line
#'@param sep The field separator character
#'@return A data frame with the binary table
#'@export
#'@examples
#'readBinaryTable("data/sheep_genotypes_binary.tsv")


readGeneticBinaryTable<-function(binartablepath, header=TRUE, sep="\t", ...)
{
  # Read the binary table
  binarytable<-read.csv(binartablepath, header=header, sep=sep, ...)
  print("Please be aware that genetic alleles values should be coded as 0, 1, 2, -1, and if not, the results may be incorrect.")
  return(binarytable)
}
