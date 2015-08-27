\name{AwardsPlayers}
\alias{AwardsPlayers}
\docType{data}
\title{
AwardsPlayers table 
}
\description{
Award information for players awards
}
\usage{data(AwardsPlayers)}
\format{
  A data frame with 6026 observations on the following 6 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{awardID}}{Name of award won}
    \item{\code{yearID}}{Year}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{ML} \code{NL}}
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
\keyword{datasets}

\examples{
data(AwardsPlayers)
# Which awards have been given and how many?
with(AwardsPlayers, table(awardID))
awardtab <- with(AwardsPlayers, table(awardID))
library('lattice')
dotplot(awardtab)

# Restrict to MVP awards
mvp <- subset(AwardsPlayers, awardID == 'Most Valuable Player')
# Who won in 1994?
mvp[mvp$yearID == 1994L, ]

goldglove <- subset(AwardsPlayers, awardID == 'Gold Glove')
# which players won most often?
GGcount <- table(goldglove$playerID)
GGcount[GGcount>10]

# Triple Crown winners
subset(AwardsPlayers, awardID == "Triple Crown")

# Simultaneous Triple Crown and MVP winners
# (compare merged file to TC)
TC <- subset(AwardsPlayers, awardID == "Triple Crown")
MVP <- subset(AwardsPlayers, awardID == "Most Valuable Player")
keepvars <- c("playerID", "yearID", "lgID.x")
merge(TC, MVP, by = c("playerID", "yearID"))[ ,keepvars]


}