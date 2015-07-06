
##' Convert binary mode to integers.
##' 
##' @title Convert binary mode to integers.
##' @param bin string vector in binary mode.
##' @return A numeric vector.
##' @author Jian Li <\email{rinds.book@@gmail.com}>
##' @keywords string
##' @examples \dontrun{
##' bin2int("001101")
##' }
##'

bin2int <- function(bin) 
{
	res <- strsplit(bin, split = "")
	return(sapply(res, FUN = function(X) sum(as.numeric(X)*2^rev(seq_along(X))))/2)
}

