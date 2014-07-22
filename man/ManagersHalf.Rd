\name{ManagersHalf}
\alias{ManagersHalf}
\docType{data}
\title{
ManagersHalf table
}
\description{
Split season data for managers
}
\usage{data(ManagersHalf)}
\format{
  A data frame with 93 observations on the following 10 variables.
  \describe{
    \item{\code{playerID}}{Manager (player) ID code}
    \item{\code{yearID}}{Year}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{NL}}
    \item{\code{inseason}}{Managerial order.  One if the individual managed the team
                 the entire year.  Otherwise denotes where the manager appeared
                 in the managerial order (1 for first manager, 2 for second, etc.).
                 A factor with levels \code{1} \code{2} \code{3} \code{4} \code{5}}
    \item{\code{half}}{First or second half of season}
    \item{\code{G}}{Games managed}
    \item{\code{W}}{Wins}
    \item{\code{L}}{Losses}
    \item{\code{rank}}{Team's position in standings for the half}
  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Lahman, S. (2014) Lahman's Baseball Database, 1871-2013, 2014 version, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}
