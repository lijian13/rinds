
##' Load all the required packages mentioned in this book.
##' 
##' @title Load all the required packages mentioned in this book.
##' @param install Whether to install the uninstalled packages, default is FALSE.
##' @param lib.loc character vector giving the library directories where to install the packages. Defaults to the first element of \code{\link{.libPaths}()}.
##' @return TRUE or FALSE.
##' @author Jian Li <\email{rinds.book@@gmail.com}>
##' @keywords string
##' @examples \dontrun{
##' loadAllDSPkgs(install = TRUE)
##' }
##'

loadAllDSPkgs <- function(install = FALSE, lib.loc = .libPaths()[1]) 
{
	.installPkg("roxygen2", lib.loc = lib.loc, install = install)
	.installPkg("tmcn", lib.loc = lib.loc, install = install, repos="http://R-Forge.R-project.org")
	.installPkg("knitr", lib.loc = lib.loc, install = install)
	
	.installPkg("reshape2", lib.loc = lib.loc, install = install)
	.installPkg("plyr", lib.loc = lib.loc, install = install)
	.installPkg("xts", lib.loc = lib.loc, install = install)
	.installPkg("quantmod", lib.loc = lib.loc, install = install)
	
	.installPkg("lmtest", lib.loc = lib.loc, install = install)
	.installPkg("car", lib.loc = lib.loc, install = install)
	.installPkg("ggplot2", lib.loc = lib.loc, install = install)
	
	.installPkg("mvtnorm", lib.loc = lib.loc, install = install)
	.installPkg("FactoMineR", lib.loc = lib.loc, install = install)
	.installPkg("corrplot", lib.loc = lib.loc, install = install)
	.installPkg("tseries", lib.loc = lib.loc, install = install)
	.installPkg("forecast", lib.loc = lib.loc, install = install)
	
	.installPkg("fastcluster", lib.loc = lib.loc, install = install)
	.installPkg("proxy", lib.loc = lib.loc, install = install)
	.installPkg("fpc", lib.loc = lib.loc, install = install)
	.installPkg("kohonen", lib.loc = lib.loc, install = install)
	.installPkg("caret", lib.loc = lib.loc, install = install)
	.installPkg("rpart.plot", lib.loc = lib.loc, install = install)
	.installPkg("klaR", lib.loc = lib.loc, install = install)
	.installPkg("kernlab", lib.loc = lib.loc, install = install)
	.installPkg("mlbench", lib.loc = lib.loc, install = install)
	.installPkg("ipred", lib.loc = lib.loc, install = install)
	.installPkg("e1071", lib.loc = lib.loc, install = install)
	.installPkg("randomForest", lib.loc = lib.loc, install = install)
	
	.installPkg("lpSolve", lib.loc = lib.loc, install = install)
	.installPkg("Rglpk", lib.loc = lib.loc, install = install)
	.installPkg("alabama", lib.loc = lib.loc, install = install)
	.installPkg("Rsolnp", lib.loc = lib.loc, install = install)
	
	.installPkg("ggthemes", lib.loc = lib.loc, install = install)
	.installPkg("vcd", lib.loc = lib.loc, install = install)
	.installPkg("treemap", lib.loc = lib.loc, install = install)
	.installPkg("openair", lib.loc = lib.loc, install = install)
	
	.installPkg("fImport", lib.loc = lib.loc, install = install)
	.installPkg("PerformanceAnalytics", lib.loc = lib.loc, install = install)
	.installPkg("Quandl", lib.loc = lib.loc, install = install)
	
	.installPkg("rjson", lib.loc = lib.loc, install = install)
	.installPkg("XML", lib.loc = lib.loc, install = install)
	.installPkg("rJava", lib.loc = lib.loc, install = install)
	.installPkg("tm", lib.loc = lib.loc, install = install)
	.installPkg("wordcloud", lib.loc = lib.loc, install = install)
	.installPkg("topicmodels", lib.loc = lib.loc, install = install)
	.installPkg("Rweibo", lib.loc = lib.loc, install = install, repos="http://R-Forge.R-project.org")
	.installPkg("Rwordseg", lib.loc = lib.loc, install = install, repos="http://R-Forge.R-project.org")
	
	.installPkg("sp", lib.loc = lib.loc, install = install)
	.installPkg("maptools", lib.loc = lib.loc, install = install)
	.installPkg("plotKML", lib.loc = lib.loc, install = install)
	.installPkg("ggmap", lib.loc = lib.loc, install = install)
	.installPkg("igraph", lib.loc = lib.loc, install = install)
	
	.installPkg("RSQLite", lib.loc = lib.loc, install = install)
	.installPkg("RODBC", lib.loc = lib.loc, install = install)
	
	.installPkg("doParallel", lib.loc = lib.loc, install = install)
	
}

