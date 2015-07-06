
##' Convert Image object to imagedata object.
##' 
##' @title Convert Image object of EBImage package to imagedata object of biOps package.
##' @param x Image object of EBImage package.
##' @return imagedata object.
##' @author Jian Li <\email{rinds.book@@gmail.com}>
##' @examples \dontrun{
##' Image2biOps(x)
##' }
##'

Image2biOps <- function(x) {
	if (!require(biOps)) {
		stop("biOps should be installed!")
	}
	if (!inherits(x, "Image")) {
		stop("x should be Image object!")
	}
	
	ebdata <- x@.Data * 256
	if (x@colormode == "Grayscale" || x@colormode == 0) ebtype <- "grey"
	if (x@colormode == "Color" || x@colormode == 2) ebtype <- "rgb"

	if (ebtype == "rgb") {
		outdata <- array(0, dim = dim(ebdata)[c(2, 1, 3)])
		outdata[, , 1] <- t(ebdata[, , 1] )
		outdata[, , 2] <- t(ebdata[, , 2] )
		outdata[, , 3] <- t(ebdata[, , 3] )
	}
	if (ebtype == "grey") {
		outdata <- t(ebdata)
	}
	
	return(imagedata(outdata, type = ebtype))
}

