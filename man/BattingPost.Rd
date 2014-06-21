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
  A data frame with 10900 observations on the following 22 variables.
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
Lahman, S. (2014) Lahman's Baseball Database, 1871-2013, 2014 version, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
# Post-season batting data
# Requires care since intra-league playoffs have evolved since 1969
# Simplest case: World Series

require(plyr)

# Create a sub-data frame for modern World Series play
ws <- subset(BattingPost, round == "WS" & yearID >= 1903)

# Add some derived measures
ws <- mutate(ws, BA = ifelse(AB == 0, 0, round(H/AB, 3)),
                 TB = H + X2B + 2 * X3B + 3 * HR,
                 SA = ifelse(AB == 0,  0, round(TB/AB, 3)),
                 PA = AB + BB + IBB + HBP + SH + SF,
                 OB = H + BB + IBB + HBP,
                 OBP = ifelse(AB == 0, 0, round(OB/PA, 3)) )

# Players with most appearances in the WS:
with(subset(BattingPost, round == "WS"), rev(sort(table(playerID))))[1:10]

# OK, how about someone who is *not* a Yankee?
with(subset(BattingPost, round == "WS" & teamID != "NYA"),
       rev(sort(table(playerID))))[1:10]


# Top ten single WS batting averages ( >= 10 AB )
head(arrange(subset(ws, AB > 10), desc(BA)), 10)

# Top ten slugging averages in a single WS 
head(arrange(subset(ws, AB > 10), desc(SA)), 10)

# Hitting stats for the 1946 St. Louis Cardinals, ordered by BA
arrange(subset(ws, teamID == "SLN" & yearID == 1946), desc(BA))

# Babe Ruth's WS profile
subset(ws, playerID == "ruthba01")


}

\keyword{datasets}
