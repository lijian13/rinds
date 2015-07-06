
.installPkg <- function(pkg, lib.loc, install, ...) {
	
	tmp.load <- FALSE
	eval(parse(text = paste("tmp.load <- suppressWarnings(require(", 
							pkg, ", lib.loc = '", lib.loc, 
							"', warn.conflicts = FALSE))", sep = "")))
	
	tmp.calls <- as.list(match.call())
	tmp.calls[[1]] <- NULL
	tmp.calls[["pkg"]] <- NULL
	tmp.calls[["lib.loc"]] <- NULL
	tmp.calls[["install"]] <- NULL
	tmp.calls[["pkgs"]] <- pkg
	tmp.calls[["lib"]] <- lib.loc
	
	if (!tmp.load && install) do.call("install.packages", tmp.calls)
}
