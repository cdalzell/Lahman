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
  A data frame with 6879 observations on the following 7 variables.
  \describe{
    \item{\code{awardID}}{name of award votes were received for}
    \item{\code{yearID}}{Year}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{ML} \code{NL}}
    \item{\code{playerID}}{Player ID code}
    \item{\code{pointsWon}}{Number of points received}
    \item{\code{pointsMax}}{Maximum number of points possible}
    \item{\code{votesFirst}}{Number of first place votes}
  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Lahman, S. (2023) Lahman's Baseball Database, 1871-2022, 2022 version, \url{https://www.seanlahman.com/baseball-archive/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
# Vote tallies for post-season player awards

require("dplyr")

# Which awards are represented in this data frame?
unique(AwardsSharePlayers$awardID)

# Sort the votes for the Cy Young award in decreasing order.
# Until 1967, the award went to the best pitcher
# in both leagues.

cyvotes <- AwardsSharePlayers \%>\%
              filter(awardID == "Cy Young") \%>\%
              group_by(yearID, lgID) \%>\%
              arrange(desc(pointsWon))

# 2012 votes
subset(cyvotes, yearID == 2012)

# top three votegetters each year by league

cya_top3 <- cyvotes \%>\%
              group_by(yearID, lgID) \%>\%
              do(head(., 3))
head(cya_top3, 12)

# unanimous Cy Young winners
subset(cyvotes, pointsWon == pointsMax)

## CYA was a major league award until 1967
# Find top five pitchers with most top 3 vote tallies in CYA
# head(with(cya_top3, rev(sort(table(playerID)))), 5)

# Pre-1967
cya_top3 \%>\% 
  filter(yearID <= 1966) \%>\%
  group_by(playerID) \%>\%
  summarise(yrs_top3 = n()) \%>\%
  arrange(desc(yrs_top3)) \%>\%
  head(., 2)

# 1967+ (both leagues)
cya_top3 \%>\% 
  filter(yearID > 1966) \%>\%
  group_by(playerID) \%>\%
  summarise(yrs_top3 = n()) \%>\%
  arrange(desc(yrs_top3)) \%>\%
  head(., 5)

# 1967+ (by league)
cya_top3 \%>\% 
  filter(yearID > 1966) \%>\%
  group_by(playerID, lgID) \%>\%
  summarise(yrs_top3 = n()) \%>\%
  arrange(desc(yrs_top3)) \%>\%
  head(., 5)

# Ditto for MVP awards
# Top 3 votegetters for MVP award by year and league
MVP_top3 <- AwardsSharePlayers \%>\% 
              filter(awardID == "MVP") \%>\%
              group_by(yearID, lgID) \%>\% 
              arrange(desc(pointsWon)) \%>\%
              do(head(., 3))
tail(MVP_top3)

## Select players with >= 7 top 3 finishes
MVP_top3 \%>\% 
  group_by(playerID) \%>\%
  summarise(n_top3 = n()) \%>\%
  arrange(desc(n_top3)) \%>\%
  filter(n_top3 > 6)

}

\keyword{datasets}
