


getOANDA <- function(symbol="USD/EUR",from="2005-01-01",to="2012-01-01") {
	from <- as.Date(from)
	to <- as.Date(to)
	span <- as.numeric(to-from)
	n <- span %/% 500
	rem <- span %% 500
	res <- NULL
	for (i in 1:n) {
		mid <- to - 499
		data <- getSymbols(symbol,src="oanda",
				from=as.character(mid),
				to=as.character(to),
				auto.assign=F)
		res <- rbind(res,data)
		to <- mid - 1
	}
	from <- mid - rem -1
	data <- getSymbols(symbol,src="oanda",
			from=as.character(from),
			to=as.character(to),
			auto.assign=F)
	res <- rbind(res,data)
	return(res)
}

