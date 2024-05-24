#' Read hapmap file into R
#' @param path Path to hapmap file
#' @param sep Separator
#' @param header Logical indicating if the file has a header
#' @param ... Additional arguments to \code{\link{read.table}}
#' @return A data frame
#' @export
#' @examples
#' readHapmap("hapmap.txt")
#' readHapmap("hapmap.txt", header = FALSE)
#' readHapmap("hapmap.txt", header = FALSE, sep = "\t")
#' readHapmap("hapmap.txt", header = FALSE, sep = "\t", skip = 1)
#' readHapmap("hapmap.txt", header = FALSE, sep = "\t", skip = 1, nrows = 10)

readHapmap <- function(path, sep = "\t", header = TRUE, ...) {
  # remove the # character from the header
  read.csv(path, sep = sep, header = header, ...)
}
