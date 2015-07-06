
##' Convert integers to binary mode.
##' 
##' @title Convert integers to binary mode.
##' @param int integer vector.
##' @param len number of characters of the result string.
##' @return A character vector.
##' @author Jian Li <\email{rinds.book@@gmail.com}>
##' @keywords string
##' @examples \dontrun{
##' int2bin(10)
##' }
##'

int2bin <- function(int, len = NULL) 
{
	res <- character(length(int))
	tmp <- NULL
	while (any(int > 0) | is.null(tmp)) {
		tmp <- int%%2
		int <- floor(int/2)
		res <- paste(tmp, res, sep = "")
	}
	if (identical(class(len), "numeric")) res <- sprintf(paste("%0", len, "d", sep = ""), as.numeric(res))
	return(res)
}

