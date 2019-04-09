\name{AwardsShareManagers}
\alias{AwardsShareManagers}
\docType{data}
\title{
AwardsShareManagers table
}
\description{
Award voting for managers awards
}
\usage{data(AwardsShareManagers)}
\format{
  A data frame with 425 observations on the following 7 variables.
  \describe{
    \item{\code{awardID}}{name of award votes were received for}
    \item{\code{yearID}}{Year}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{NL}}
    \item{\code{playerID}}{Manager (player) ID code}
    \item{\code{pointsWon}}{Number of points received}
    \item{\code{pointsMax}}{Maximum number of points possible}
    \item{\code{votesFirst}}{Number of first place votes}
  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Lahman, S. (2019) Lahman's Baseball Database, 1871-2018, 2018 version, \url{http://www.seanlahman.com/baseball-archive/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
# Voting for the BBWAA Manager of the Year award by year and league

require("dplyr")

# Sort in decreasing order of points by year and league
AwardsShareManagers \%>\%
   group_by(yearID, lgID) \%>\%
   arrange(desc(pointsWon))

# Any unanimous winners?
AwardsShareManagers \%>\%
  filter(pointsWon == pointsMax)

# Manager with highest proportion of possible points
AwardsShareManagers \%>\%
   mutate(propWon = pointsWon/pointsMax) \%>\%
   arrange(desc(propWon)) \%>\%
   head(., 1)

# Bobby Cox's MOY vote tallies
AwardsShareManagers \%>\%
  filter(playerID == "coxbo01")

}

\keyword{datasets}
