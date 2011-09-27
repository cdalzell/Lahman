\name{Managers}
\alias{Managers}
\docType{data}
\title{
Managers table
}
\description{
Managers table
}
\usage{data(Managers)}
\format{
  A data frame with 3238 observations on the following 10 variables.
  \describe{
    \item{\code{managerID}}{Player ID Number}
    \item{\code{yearID}}{Year}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{inseason}}{Managerial order.  Zero if the individual managed the team
                 the entire year.  Otherwise denotes where the manager appeared
                 in the managerial order (1 for first manager, 2 for second, etc.)}
    \item{\code{G}}{Games managed}
    \item{\code{W}}{Wins}
    \item{\code{L}}{Losses}
    \item{\code{rank}}{Team's final position in standings that year}
    \item{\code{plyrMgr}}{Player Manager (denoted by 'Y'); a factor with levels \code{N} \code{Y}}

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
