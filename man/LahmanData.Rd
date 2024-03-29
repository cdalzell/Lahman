\name{LahmanData}
\alias{LahmanData}
\docType{data}
\title{
Lahman Datasets
}
\description{
This dataset gives a concise description of the data files in the Lahman package.
It may be useful for computing on the various files.
}
\usage{data(LahmanData)}
\format{
  A data frame with 24 observations on the following 5 variables.
  \describe{
    \item{\code{file}}{name of dataset}
    \item{\code{class}}{class of dataset}
    \item{\code{nobs}}{number of observations}
    \item{\code{nvar}}{number of variables}
    \item{\code{title}}{dataset title}
  }
}
\details{
This dataset is generated using \code{vcdExtra::datasets(package="Lahman")}
with some post-processing.
}
%\source{
%%%  ~~ reference to a publication or URL from which the data were obtained ~~
%}
%\references{
%%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(LahmanData)

# find ID variables in the datasets
IDvars <- lapply(LahmanData[,"file"], function(x) grep('.*ID$', colnames(get(x)), value=TRUE))
names(IDvars) <- LahmanData[,"file"]
str(IDvars)
# vector of unique ID variables
unique(unlist(IDvars))

# which datasets have playerID?
names(which(sapply(IDvars, function(x) "playerID" \%in\% x)))

################################################
# Visualize relations among datasets via an MDS
################################################
# jaccard distance between two sets; assure positivity
jaccard <- function(A, B) {
	max(1 - length(intersect(A,B)) / length(union(A,B)), .00001)
}	

distmat <- function(vars, FUN=jaccard) {
	nv <- length(vars)
	d <- matrix(0, nv, nv, dimnames=list(names(vars), names(vars)))
	
	for(i in 1:nv) {
		for (j in 1:nv) {
			if (i != j) d[i,j] <- FUN(vars[[i]], vars[[j]])
		}
	}
	
	d[is.nan(d)] = 0
	
	d
}

# do an MDS on distances
distID <- distmat(IDvars)
config <- cmdscale(distID)

pos=rep(1:4, length=nrow(config))
plot(config[,1], config[,2], xlab = "", ylab = "", asp = 1, axes=FALSE,
	main="MDS of ID variable distances of Lahman tables")
abline(h=0, v=0, col="gray80")
text(config[,1], config[,2], rownames(config), cex = 0.75, pos=pos, xpd=NA)

}
\keyword{datasets}
