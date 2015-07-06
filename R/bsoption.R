


bsoption <- function(s,x,r,t,sigma,call=TRUE){
	d1 <- (log(s/x)+(r+sigma^2/2)*t)/(sigma*sqrt(t))
	d2 <- d1-sigma*sqrt(t)
	if(call) {
		c <- s*pnorm(d1)-x*exp(-r*t)*pnorm(d2)
		return(c)
	} else {
		p <- x*exp(-r*t)*pnorm(-d2)-s*pnorm(-d1)
		return(p)
	}
}

