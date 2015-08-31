\name{Label}
\alias{Label}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Extract the Label for a Variable
}
\description{
Extracts the label for a variable from one or more of the \code{*Labels}
files. This is useful for plots and other displays because the variable
names are often cryptically short.
}
\usage{
Label(var, labels = rbind(Lahman::battingLabels, 
                          Lahman::pitchingLabels, 
                          Lahman::fieldingLabels))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{var}{
name of a variable
}
  \item{labels}{
label table(s) to search, a 2-column dataframe containing 
variable names and labels.
}
}
%\details{
%%%  ~~ If necessary, more details than the description above ~~
%}
\value{
Returns the variable label, or \code{var} if no label is found
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
%\references{
%%% ~put references to the literature/web site here ~
%}
\author{
Michael Friendly
}
%\note{
%%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{battingLabels}},
\code{\link{pitchingLabels}},
\code{\link{fieldingLabels}}

}
\examples{
require(plyr)
# find and plot maximum number of homers per year
batHR <- ddply(subset(Batting, !is.na(HR)), .(yearID),
		summarise, max=max(HR))
		
with(batHR, {
  plot(yearID, max, 
       xlab=Label("yearID"), ylab=paste("Maximum", Label("HR")), 
       cex=0.8)
  lines(lowess(yearID, max), col="blue", lwd=2)
  abline(lm(max ~ yearID), col="red", lwd=2)
	})
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
