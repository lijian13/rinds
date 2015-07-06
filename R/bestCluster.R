
bestCluster <- function(data, n, plot = FALSE) {
	clusting <- lapply(n,function(x) pam(data,k=x))
	silwidth <- lapply(clusting,function(x) 
				summary(silhouette(x))$avg.width)
	bestn <- n[which.max(silwidth)]
	if (plot) plot(x = n, y = silwidth, type = 'b')
	return(bestn)
}
