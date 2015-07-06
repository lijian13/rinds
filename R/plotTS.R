
##' Plot time series and its forecast values.
##' 
##' @title Plot time series and its forecast values.
##' @param series ts object.
##' @param forecast the output of predict or a forecast object.
##' @return plot.
##' @author Jian Li <\email{rinds.book@@gmail.com}>
##'
plotTS <- function(series, forecast) {
	if (inherits(forecast, "forecast")) {
		forecast <- as.ts(forecast)
		forecast$pred <- forecast$mean
		if ("95%" %in% forecast$upper) {
			forecast$se <- (forecast$upper[, "95%"] - forecast$mean)/1.96
		} else {
			forecast$se <- (forecast$upper[, 1] - forecast$mean)/1.96
		}
	}
	if (length(forecast) > 0) {
		act.start <- attributes(series)$tsp[1]
		act.end <- attributes(series)$tsp[2]
		pred.start <- attributes(forecast$pred)$tsp[1]
		pred.end <- attributes(forecast$pred)$tsp[2]
		
		ylim <- c( min(series,forecast$pred - 1.96 * forecast$se), max(series,forecast$pred + 1.96 * forecast$se))
		xlim <- c(act.start, pred.end)
		
		#opar <- par(mar=c(4,4,2,2),las=1)
		opar <- par(mar=c(4,4,0.5,2))
		plot(series, ylim = ylim, type = "n", xlim = xlim)
		usr <- par("usr")
		
		rect(usr[1], usr[3], pred.start ,usr[4],border=NA,col="lemonchiffon")
		rect(pred.start ,usr[3], usr[2], usr[4],border=NA,col="lavender")
		abline(h= seq(from = ylim[1], to = ylim[2], length.out = 10) , col ="gray" , lty =3)
		
		polygon( c(as.vector(time(forecast$pred)), rev(as.vector(time(forecast$pred)))),
				c(forecast$pred - 1.96*forecast$se,rev(forecast$pred + 1.96*forecast$se)),
				col = "orange",
				lty=2,border=NA)
		
		lines( as.vector(time(forecast$pred)) , forecast$pred - 1.96*forecast$se , lty=2)
		lines( as.vector(time(forecast$pred)) , forecast$pred + 1.96*forecast$se , lty=2)
		
		lines( series , lwd=2 )
		lines( forecast$pred , lwd=2 )
		lines( as.vector(time(forecast$pred)) , forecast$pred , lwd=2 , col ="white")
		
		legend( "topleft", inset=0, legend = c("series","prediction","95% confidence band"), 
				fill=c("black","white","orange"), bg = "gray")  
		
		box()
		par(opar)
	} else {
		ylim <- c( min(series), max(series))
		opar <- par(mar=c(4,4,0.5,2))
		plot(series, type = "n", ylim = ylim)
		usr <- par("usr")
		abline(h= seq(from = ylim[1], to = ylim[2], length.out = 10) , col ="gray" , lty =3)
		lines( series , lwd=2 )
		legend( "topleft", inset=0, legend = c("series"), fill=c("black"), bg = "gray")  
		box()
		par(opar)
	}
	
}


