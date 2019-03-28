\name{BattingPost}
\alias{BattingPost}
\docType{data}
\title{
BattingPost table
}
\description{
Post season batting statistics
}
\usage{data(BattingPost)}
\format{
  A data frame with 14354 observations on the following 22 variables.
  \describe{
    \item{\code{yearID}}{Year}
    \item{\code{round}}{Level of playoffs }
    \item{\code{playerID}}{Player ID code}
    \item{\code{teamID}}{Team}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{NL}}
    \item{\code{G}}{Games}
    \item{\code{AB}}{At Bats}
    \item{\code{R}}{Runs}
    \item{\code{H}}{Hits}
    \item{\code{X2B}}{Doubles}
    \item{\code{X3B}}{Triples}
    \item{\code{HR}}{Homeruns}
    \item{\code{RBI}}{Runs Batted In}
    \item{\code{SB}}{Stolen Bases}
    \item{\code{CS}}{Caught stealing}
    \item{\code{BB}}{Base on Balls}
    \item{\code{SO}}{Strikeouts}
    \item{\code{IBB}}{Intentional walks}
    \item{\code{HBP}}{Hit by pitch}
    \item{\code{SH}}{Sacrifices}
    \item{\code{SF}}{Sacrifice flies}
    \item{\code{GIDP}}{Grounded into double plays}
  }
}
\details{
Variables \code{X2B} and \code{X3B} are named \code{2B} and \code{3B} in the original database
}
\source{
Lahman, S. (2019) Lahman's Baseball Database, 1871-2018, 2018 version, \url{http://www.seanlahman.com/baseball-archive/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
# Post-season batting data
# Requires care since intra-league playoffs have evolved since 1969
# Simplest case: World Series

require("dplyr")

# Create a sub-data frame for modern World Series play
ws <- BattingPost \%>\%
        filter(round == "WS" & yearID >= 1903) \%>\%
        mutate(BA = 0 + (AB > 0) * round(H/AB, 3),
               TB = H + X2B + 2 * X3B + 3 * HR,
               SA = 0 + (AB > 0) * round(TB/AB, 3),
               PA = AB + BB + IBB + HBP + SH + SF,
               OB = H + BB + IBB + HBP,
               OBP = 0 + (AB > 0) * round(OB/PA, 3) )

# Players with most appearances in the WS:
ws \%>\% group_by(playerID) \%>\%
       summarise(appearances = n()) \%>\%
       arrange(desc(appearances)) \%>\%
       head(., 10)

# Non-Yankees with most WS appearances
ws \%>\% filter(teamID != "NYA") \%>\%
       group_by(playerID) \%>\%
       summarise(appearances = n()) \%>\%
       arrange(desc(appearances)) \%>\%
       head(., 10)


# Top ten single WS batting averages ( >= 10 AB )
ws \%>\% filter(AB > 10) \%>\%
       arrange(desc(BA)) \%>\%
       head(., 10)

# Top ten slugging averages in a single WS 
ws \%>\% filter(AB > 10) \%>\%
  arrange(desc(SA)) \%>\%
  head(., 10)


# Hitting stats for the 1946 St. Louis Cardinals, ordered by BA
ws \%>\% 
  filter(teamID == "SLN" & yearID == 1946) \%>\%
  arrange(desc(BA))

# Babe Ruth's WS profile
ws \%>\% 
  filter(playerID == "ruthba01") \%>\%
  arrange(yearID)


}

\keyword{datasets}
