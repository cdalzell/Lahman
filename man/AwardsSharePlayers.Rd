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
  A data frame with 6617 observations on the following 7 variables.
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
Lahman, S. (2014) Lahman's Baseball Database, 1871-2013, 2014 version, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
# Vote tallies for post-season player awards

require(plyr)

# Which awards are represented in this data frame?
unique(AwardsSharePlayers$awardID)

# Sort the votes for the Cy Young award in decreasing order.
# For the first few years, the award went to the best pitcher
# in both leagues.

cyvotes <- ddply(subset(AwardsSharePlayers, awardID == "Cy Young"),
                 .(yearID, lgID), arrange, desc(pointsWon))

# 2012 votes
subset(cyvotes, yearID == 2012)

# top three votegetters each year by league

cya_top3 <- ddply(cyvotes, .(yearID, lgID), function(d) head(d, 3))

# unanimous Cy Young winners
subset(cyvotes, pointsWon == pointsMax)

# Top five pitchers with most top 3 vote tallies in CYA
head(with(cya_top3, rev(sort(table(playerID)))), 5)

# Ditto for MVP awards

MVP <- subset(AwardsSharePlayers, awardID == "MVP")
MVP_top3 <- ddply(MVP, .(yearID, lgID), 
                  function(d) head(arrange(d, desc(pointsWon)), 3))
head(with(MVP_top3, rev(sort(table(playerID)))), 5)

}

\keyword{datasets}
