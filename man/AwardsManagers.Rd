\name{AwardsManagers}
\alias{AwardsManagers}
\docType{data}
\title{
AwardsManagers table 
}
\description{
Award information for managers awards
}
\usage{data(AwardsManagers)}
\format{
  A data frame with 171 observations on the following 6 variables.
  \describe{
    \item{\code{playerID}}{Manager (player) ID code}
    \item{\code{awardID}}{Name of award won}
    \item{\code{yearID}}{Year}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{NL}}
    \item{\code{tie}}{Award was a tie (Y or N)}
    \item{\code{notes}}{Notes about the award}

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
\examples{
# Post-season managerial awards

# Number of recipients of each award by year
with(AwardsManagers, table(yearID, awardID))

# 1996 award winners
subset(AwardsManagers, yearID == 1996)

# AL winners of the BBWAA managerial award
subset(AwardsManagers, awardID == "BBWAA Manager of the year" &
                          lgID == "AL")

# Tony LaRussa's manager of the year awards
subset(AwardsManagers, playerID == "larusto01")

}

\keyword{datasets}
