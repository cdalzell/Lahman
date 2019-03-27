\name{PitchingPost}
\alias{PitchingPost}
\docType{data}
\title{
PitchingPost table
}
\description{
Post season pitching statistics
}
\usage{data(PitchingPost)}
\format{
  A data frame with 5624 observations on the following 30 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year}
    \item{\code{round}}{Level of playoffs }
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{NL}}
    \item{\code{W}}{Wins}
    \item{\code{L}}{Losses}
    \item{\code{G}}{Games}
    \item{\code{GS}}{Games Started}
    \item{\code{CG}}{Complete Games}
    \item{\code{SHO}}{Shutouts }
    \item{\code{SV}}{Saves}
    \item{\code{IPouts}}{Outs Pitched (innings pitched x 3)}
    \item{\code{H}}{Hits}
    \item{\code{ER}}{Earned Runs}
    \item{\code{HR}}{Homeruns}
    \item{\code{BB}}{Walks}
    \item{\code{SO}}{Strikeouts}
    \item{\code{BAOpp}}{Opponents' batting average}
    \item{\code{ERA}}{Earned Run Average}
    \item{\code{IBB}}{Intentional Walks}
    \item{\code{WP}}{Wild Pitches}
    \item{\code{HBP}}{Batters Hit By Pitch}
    \item{\code{BK}}{Balks}
    \item{\code{BFP}}{Batters faced by Pitcher}
    \item{\code{GF}}{Games Finished}
    \item{\code{R}}{Runs Allowed}
    \item{\code{SH}}{Sacrifice Hits allowed}
    \item{\code{SF}}{Sacrifice Flies allowed}
    \item{\code{GIDP}}{Grounded into Double Plays}
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
library("dplyr")
library(ggplot2)

# Restrict data to World Series in modern era
ws <- PitchingPost \%>\%
         filter(yearID >= 1903 & round == "WS")
# Pitchers with ERA 0.00 in WS play (> 10 IP)
ws \%>\%
  filter(IPouts > 30 & ERA == 0.00) \%>\%
  arrange(desc(IPouts)) \%>\%
  select(playerID, yearID, teamID, lgID, IPouts, W, L, G, 
         CG, SHO, H, R, SO, BFP) 

# Pitchers with the most IP in a series 
# 1903 Series went eight games - for details, see
# https://en.wikipedia.org/wiki/1903_World_Series
ws \%>\%
  arrange(desc(IPouts)) \%>\%
  select(playerID, yearID, teamID, lgID, IPouts, W, L, G, 
         CG, SHO, H, SO, BFP, ERA) \%>\%
  head(., 10)

# Pitchers with highest strikeout rate in WS
# (minimum 20 IP)
ws \%>\%
  filter(IPouts >= 60) \%>\%
  mutate(K_rate = 27 * SO/IPouts) \%>\%
  arrange(desc(K_rate)) \%>\%
  select(playerID, yearID, teamID, lgID, IPouts, 
         H, SO, K_rate) \%>\%
  head(., 10)
  
# Pitchers with the most IP in WS history
ws \%>\%
  group_by(playerID) \%>\%
  summarise_at(vars(IPouts, H, ER, CG, BB, SO, W, L), 
               sum, na.rm = TRUE) \%>\%
  mutate(ERA = round(27 * ER/IPouts, 2),
         Kper9 = round(27 * SO/IPouts, 3),
         WHIP = round(3 * (H + BB)/IPouts, 3)) \%>\%
  arrange(desc(IPouts)) \%>\%
  select(-H, -ER) \%>\%
  head(., 10)

# Plot of K/9 by year
ws \%>\%
  group_by(yearID) \%>\%
  summarise(Kper9 = 27 * sum(SO)/sum(IPouts)) \%>\%
  ggplot(., aes(x = yearID, y = Kper9)) +
    geom_point() +
    geom_smooth() +
    labs(x = "Year", y = "K per 9 innings")

}
\keyword{datasets}
