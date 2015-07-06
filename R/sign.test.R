
##' Sign test.
##' 
##' @title Sign test.
##' @param v numeric vector of data values. Non-finite (e.g. infinite or missing) values will be omitted.
##' @param m0 a number specifying an optional parameter used to form the null hypothesis.
##' @param h1 a character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less". You can specify just the initial letter.
##' @param EXACT whether to use exact method.
##' @return A list with class "htest".
##' @author Jian Li <\email{rinds.book@@gmail.com}>
##' @examples \dontrun{
##' sign.test(rnorm(100))
##' }
##'

sign.test <- function(v,m0,h1=c("two.sided","less","greater"),EXACT=c("exact","approximation"))
{h1<-match.arg(h1)
	EXACT<-match.arg(EXACT)
	DNAME<-paste(deparse(substitute(v)),"and m0=",deparse(substitute(m0)))
	v<-v[!is.na(v)]
	if(!is.numeric(v)){stop("v must be numeric")}
	if(!is.numeric(m0)){stop("m0 must be numeric")}
	if(length(v)<1){stop("Not enough v data")}
	s1<-length(v[v<m0]);s2<-length(v[v>m0]);n<-s1+s2
	st<-switch(h1,two.sided=min(s1,s2),less=s2,greater=s1)
	if(EXACT=="exact")
	{pv<-switch(h1,two.sided=min(2*pbinom(min(s1,s2),n,0.5),1),less=pbinom(s2,n,0.5),greater=pbinom(s1,n,0.5))
		METHOD<-"sign test (exact)"
		names(st)<-switch(h1,two.sided="S",less="S+",greater="S-")}
	else{st<-(st+0.5*(-1)^(as.integer(st>n/2))-n/2)*2/n^0.5
		pv<-switch(h1,two.sided=min(2*pnorm(st),1),less=pnorm(st),greater=pnorm(st))
		METHOD<-"sign test (approximation)"
		names(st)<-"Z"}
	output<-list(statistic=st, p.value=pv, alternative=h1, method=METHOD, data.name=DNAME)
	class(output)<-"htest";return(output)
}

