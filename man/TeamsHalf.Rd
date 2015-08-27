\name{TeamsHalf}
\alias{TeamsHalf}
\docType{data}
\title{
TeamsHalf table
}
\description{
Split season data for teams
}
\usage{data(TeamsHalf)}
\format{
  A data frame with 52 observations on the following 10 variables.
  \describe{
    \item{\code{yearID}}{Year}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{NL}}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{Half}}{First or second half of season}
    \item{\code{divID}}{Division}
    \item{\code{DivWin}}{Won Division (Y or N)}
    \item{\code{Rank}}{Team's position in standings for the half}
    \item{\code{G}}{Games played}
    \item{\code{W}}{Wins}
    \item{\code{L}}{Losses}
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
