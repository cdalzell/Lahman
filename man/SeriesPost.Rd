\name{SeriesPost}
\alias{SeriesPost}
\docType{data}
\title{
SeriesPost table
}
\description{
Post season series information
}
\usage{data(SeriesPost)}
\format{
  A data frame with 298 observations on the following 9 variables.
  \describe{
    \item{\code{yearID}}{Year}
    \item{\code{round}}{Level of playoffs }
    \item{\code{teamIDwinner}}{Team ID of the team that won the series; a factor}
    \item{\code{lgIDwinner}}{League ID of the team that won the series; a factor with levels \code{AL} \code{NL}}
    \item{\code{teamIDloser}}{Team ID of the team that lost the series; a factor}
    \item{\code{lgIDloser}}{League ID of the team that lost the series; a factor with levels \code{AL} \code{NL} }
    \item{\code{wins}}{Wins by team that won the series}
    \item{\code{losses}}{Losses by team that won the series}
    \item{\code{ties}}{Tie games}
  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Lahman, S. (2015) Lahman's Baseball Database, 1871-2014, 2015 version, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}
