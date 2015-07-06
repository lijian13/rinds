
extractSudoku <- function(solution) {
	res.vals <- sapply(split(solution, f = rep(1:81, each = 9)), FUN = function(X) which(X > 0))
	res.prob <- matrix(NA, 9, 9) 
	res.prob[1, c(1, 2, 5)] <- c(5, 3, 7)
	res.prob[2, c(1, 4, 5, 6)] <- c(6, 1, 9, 5)
	res.prob[3, c(2, 3, 8)] <- c(9, 8, 6)
	res.prob[4, c(1, 5, 9)] <- c(8, 6, 3)
	res.prob[5, c(1, 4, 6, 9)] <- c(4, 8, 3, 1)
	res.prob[6, c(1, 5, 9)] <- c(7, 2, 6)
	res.prob[7, c(2, 7, 8)] <- c(6, 2, 8)
	res.prob[8, c(4, 5, 6, 9)] <- c(4, 1, 9, 5)
	res.prob[9, c(5, 8, 9)] <- c(8, 7, 9)
	res.m.t <- t(res.prob)
	res.m.t[is.na(res.m.t)] <- res.vals[-(1:sum(!is.na(res.prob)))]
	res.m <- t(res.m.t)
	res.m
}


