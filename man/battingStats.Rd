\name{battingStats}
\alias{battingStats}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate additional batting statistics
}
\description{
The \code{\link{Batting}} does not contain batting statistics derived from those
present in the data.frame.  This function calculates
batting average (\code{BA}),
plate appearances (\code{PA}),
total bases (\code{TB}),
slugging percentage (\code{SlugPct}),
on-base percentage (\code{OBP}),
on-base percentage + slugging (\code{OPS}), and
batting average on balls in play (\code{BABIP})
for each record in a Batting-like data.frame.

}
\usage{
battingStats(data = Lahman::Batting, 
             idvars = c("playerID", "yearID", "stint", "teamID", "lgID"), 
             cbind = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
input data, typically \code{\link{Batting}}
}
  \item{idvars}{
ID variables to include in the output data.frame
}
  \item{cbind}{
If \code{TRUE}, the calculated statistics are appended to the input data as additional columns
}
}
\details{
Standard calculations, e.g., \code{BA <- H/AB} are problematic because of the
presence of \code{NA}s and zeros.  This function tries to deal with those
problems.
}
\value{
	A data.frame with all the observations in \code{data}.
	If \code{cbind==FALSE}, only the \code{idvars} and the calculated variables are returned.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
%\references{
%%% ~put references to the literature/web site here ~
%}
\author{
Michael Friendly, Dennis Murphy
}
%\note{
%%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Batting}}, \code{\link{BattingPost}}
}
\examples{
	bstats <- battingStats()
	str(bstats)
	bstats <- battingStats(cbind=FALSE)
	str(bstats)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
