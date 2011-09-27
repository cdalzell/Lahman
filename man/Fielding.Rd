\name{Fielding}
\alias{Fielding}
\docType{data}
\title{
Fielding table
}
\description{
Fielding table
}
\usage{data(Fielding)}
\format{
  A data frame with 160710 observations on the following 18 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year}
    \item{\code{stint}}{player's stint (order of appearances within a season)}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{POS}}{Position}
    \item{\code{G}}{Games }
    \item{\code{GS}}{Games Started}
    \item{\code{InnOuts}}{Time played in the field expressed as outs }
    \item{\code{PO}}{Putouts}
    \item{\code{A}}{Assists}
    \item{\code{E}}{Errors}
    \item{\code{DP}}{Double Plays}
    \item{\code{PB}}{Passed Balls (by catchers)}
    \item{\code{WP}}{Wild Pitches (by catchers)}
    \item{\code{SB}}{Opponent Stolen Bases (by catchers)}
    \item{\code{CS}}{Opponents Caught Stealing (by catchers)}
    \item{\code{ZR}}{Zone Rating}
  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Lahman, S. (2010) Lahman's Baseball Database, 1871-2010, v.5.8, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{
data(Fielding)
head(Fielding)
}
