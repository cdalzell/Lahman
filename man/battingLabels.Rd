\name{battingLabels}
\alias{fieldingLabels}
\alias{pitchingLabels}
\alias{battingLabels}
\docType{data}
\title{
Variable Labels
}
\description{
These data frames provide descriptive labels for the variables in the
\code{\link{Batting}}, 
\code{\link{Pitching}} and
\code{\link{Fielding}} files (and related \code{*Post} files).
They are useful for plots and other output using \code{\link{Label}}.
}

\usage{
data(battingLabels)

data(fieldingLabels)

data(pitchingLabels)
}

\format{
  Each is data frame with observations on the following 2 variables.
  \describe{
    \item{\code{variable}}{variable name}
    \item{\code{label}}{variable label}
  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
%\source{
%%%  ~~ reference to a publication or URL from which the data were obtained ~~
%}
%\references{
%%%  ~~ possibly secondary sources and usages ~~
%}

\seealso{
	\code{\link{Label}}
}

\examples{
data(battingLabels)
str(battingLabels)

require("dplyr")

# find and plot maximum number of homers per year
batHR <- Batting \%>\%
           filter(!is.na(HR)) \%>\%
           group_by(yearID) \%>\%
           summarise(max=max(HR))
		
with(batHR, {
  plot(yearID, max, 
       xlab=Label("yearID"), ylab=paste("Maximum", Label("HR")), 
       cex=0.8)
  lines(lowess(yearID, max), col="blue", lwd=2)
  abline(lm(max ~ yearID), col="red", lwd=2)
	})

}
\keyword{datasets}



