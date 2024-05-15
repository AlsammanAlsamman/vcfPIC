
R_sum <- function(x) {
  .Call("c_sum", as.numeric(x))
}
