\name{AwardsSharePlayers}
\alias{AwardsSharePlayers}
\docType{data}
\title{
AwardsSharePlayers table
}
\description{
Award voting for managers awards
}
\usage{data(AwardsSharePlayers)}
\format{
  A data frame with 6354 observations on the following 7 variables.
  \describe{
    \item{\code{awardID}}{name of award votes were received for}
    \item{\code{yearID}}{Year}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{ML} \code{NL}}
    \item{\code{playerID}}{Player ID code}
    \item{\code{pointsWon}}{Number of points received}
    \item{\code{pointsMax}}{Maximum numner of points possible}
    \item{\code{votesFirst}}{Number of first place votes}
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
