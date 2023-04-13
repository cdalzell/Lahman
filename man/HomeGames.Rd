\name{HomeGames}
\alias{HomeGames}
\docType{data}
\title{
HomeGames table
}
\description{
Data mapping teams to the stadiums they played regular season games in as the home team.
}
\usage{data(HomeGames)}
\format{
  A data frame with 3200 observations on the following 9 variables.
  \describe{
    \item{\code{year.key}}{Year}
    \item{\code{league.key}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{team.key}}{Team; a factor}
    \item{\code{park.key}}{Unique identifier for each ballpark}
    \item{\code{span.first}}{First date the park began acting as home field for the team}
    \item{\code{span.last}}{Last date the park began acting as home field for the team}
    \item{\code{games}}{Total games in this time span}
    \item{\code{openings}}{Total opening in this time span}
    \item{\code{attendance}}{Total attendance in this time span}
  }
}
\source{
Lahman, S. (2023) Lahman's Baseball Database, 1871-2022, 2022 version, \url{https://www.seanlahman.com/baseball-archive/statistics/}
}
\keyword{datasets}
\examples{
data(HomeGames)
library(dplyr)

# How many parks has every team played in as the home team for even a single game?
HomeGames \%>\%
  count(team.key) \%>\%
  arrange(team.key)

# What parks have the Toronto Blue Jays played in as the home team?
HomeGames \%>\%
  filter(team.key == "TOR") \%>\%
  arrange(span.last)
  
# What parks have the Boston Red Sox played in as the home team?
HomeGames \%>\%
  filter(team.key == "BOS") \%>\%
  arrange(span.last)
  
# What is the Toronto Blue Jays annual total home attendance by year?
HomeGames \%>\%
  filter(team.key == "TOR") \%>\%
  group_by(year.key) \%>\%
  summarize(total.attendance = sum(attendance)) \%>\%
  arrange(year.key)
}
