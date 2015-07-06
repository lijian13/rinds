  
.onAttach <- function(libname, pkgname ){
	packageStartupMessage( paste("# Version:", packageDescription("rinds", fields = "Version"), sep = "") )

}



