\name{SeriesPost}
\alias{SeriesPost}
\docType{data}
\title{
SeriesPost table
}
\description{
Post season series information
}
\usage{data(SeriesPost)}
\format{
  A data frame with 298 observations on the following 9 variables.
  \describe{
    \item{\code{yearID}}{Year}
    \item{\code{round}}{Level of playoffs }
    \item{\code{teamIDwinner}}{Team ID of the team that won the series; a factor}
    \item{\code{lgIDwinner}}{League ID of the team that won the series; a factor with levels \code{AL} \code{NL}}
    \item{\code{teamIDloser}}{Team ID of the team that lost the series; a factor}
    \item{\code{lgIDloser}}{League ID of the team that lost the series; a factor with levels \code{AL} \code{NL} }
    \item{\code{wins}}{Wins by team that won the series}
    \item{\code{losses}}{Losses by team that won the series}
    \item{\code{ties}}{Tie games}
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
data(SeriesPost)

# How many times has each team won the World Series?

# Notes: 
# - the SeriesPost table includes an identifier for the team (teamID), but not
# the franchise (e.g. the Brooklyn Dodgers and Los Angeles Dodgers are counted 
# separately)
# - the World Series was first played in 1903, but the Lahman data tables have
# the final round of the earlier playoffs labelled "WS", so it is necessary to
# filter the SeriesPost table to exclude years prior to 1903. 

# using the dplyr data manipulation package
library(dplyr)

ws_winner_table <- SeriesPost \%>\%
  mutate(teamIDwinner = as.character(teamIDwinner)) \%>\%
  filter(yearID > "1902", round == "WS") \%>\%
  group_by(teamIDwinner) \%>\%
  summarise(wincount = n()) \%>\%
  arrange(desc(wincount))
ws_winner_table


\keyword{datasets}
