\name{AllstarFull}
\alias{AllstarFull}
\docType{data}
\title{
AllstarFull table
}
\description{
All Star appearances by players
}
\usage{data(AllstarFull)}
\format{
  A data frame with 4676 observations on the following 8 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year}
    \item{\code{gameNum}}{Game number (for years in which more than one game was played)}
    \item{\code{gameID}}{Game ID code}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{NL}}
    \item{\code{GP}}{Game played (zero if player did not appear in game)}
    \item{\code{startingPos}}{If the player started, what position he played}
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
