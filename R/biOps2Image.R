
##' Convert imagedata object to Image object.
##' 
##' @title Convert imagedata object of biOps package to Image object of EBImage package.
##' @param x imagedata object of biOps package.
##' @return Image object.
##' @author Jian Li <\email{rinds.book@@gmail.com}>
##' @examples \dontrun{
##' biOps2Image(x)
##' }
##'

biOps2Image <- function(x) {
	if (!require(EBImage)) {
		stop("EBImage should be installed!")
	}
	if (!inherits(x, "imagedata")) {
		stop("x should be biOps object!")
	}
	
	colormode <- attributes(x)$type
	if (colormode == "rgb") {
		colormode <- "Color"
		bidata <- x[ , ,]/256
		outdata <- array(0, dim = dim(bidata)[c(2, 1, 3)])
		outdata[, , 1] <- t(bidata[, , 1] )
		outdata[, , 2] <- t(bidata[, , 2] )
		outdata[, , 3] <- t(bidata[, , 3] )
	}
	if (colormode == "grey") {
		colormode <- "Grayscale"
		bidata <- x[ ,]/256
		outdata <- t(bidata)
	}
	
	return(Image(data = outdata, colormode = colormode))
}

