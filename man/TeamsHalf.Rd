\name{TeamsHalf}
\alias{TeamsHalf}
\docType{data}
\title{
TeamsHalf table
}
\description{
Split season data for teams
}
\usage{data(TeamsHalf)}
\format{
  A data frame with 52 observations on the following 10 variables.
  \describe{
    \item{\code{yearID}}{Year}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{NL}}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{Half}}{First or second half of season}
    \item{\code{divID}}{Division}
    \item{\code{DivWin}}{Won Division (Y or N)}
    \item{\code{Rank}}{Team's position in standings for the half}
    \item{\code{G}}{Games played}
    \item{\code{W}}{Wins}
    \item{\code{L}}{Losses}
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
# 1981 season team data split into half seasons
data(TeamsHalf)
library("dplyr")

# List standings with winning percentages by
# season half, league and division
TeamsHalf \%>\%
   group_by(Half, lgID, divID) \%>\%
   mutate(WinPct = round(W/G, 3)) \%>\%
   arrange(Half, lgID, divID, Rank) \%>\%
   select(Half, lgID, divID, Rank, teamID, WinPct)

}
\keyword{datasets}
