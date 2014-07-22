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
  A data frame with 385 observations on the following 7 variables.
  \describe{
    \item{\code{awardID}}{name of award votes were received for}
    \item{\code{yearID}}{Year}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{NL}}
    \item{\code{playerID}}{Manager (player) ID code}
    \item{\code{pointsWon}}{Number of points received}
    \item{\code{pointsMax}}{Maximum numner of points possible}
    \item{\code{votesFirst}}{Number of first place votes}
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
\examples{
# Voting for the BBWAA Manager of the Year award by year and league

require(plyr)

# Sort in decreasing order of points by year and league
MOYsort <- ddply(AwardsShareManagers, .(yearID, lgID), arrange, desc(pointsWon))

# Any unanimous winners?
subset(AwardsShareManagers, pointsWon == pointsMax)

# OK, how about highest proportion of possible points?
AwardsShareManagers[with(AwardsShareManagers, which.max(pointsWon/pointsMax)), ]

# Bobby Cox's MOY vote tallies
subset(AwardsShareManagers, playerID == "coxbo01")

}

\keyword{datasets}
