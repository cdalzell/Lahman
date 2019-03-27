\name{Batting}
\alias{Batting}
\docType{data}
\title{
Batting table
}
\description{
Batting table - batting statistics
}
\usage{data(Batting)}
\format{
  A data frame with 105861 observations on the following 22 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year}
    \item{\code{stint}}{player's stint (order of appearances within a season)}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{G}}{Games: number of games in which a player played}
    \item{\code{AB}}{At Bats}
    \item{\code{R}}{Runs}
    \item{\code{H}}{Hits: times reached base because of a batted, fair ball without error by the defense}
    \item{\code{X2B}}{Doubles: hits on which the batter reached second base safely}
    \item{\code{X3B}}{Triples: hits on which the batter reached third base safely}
    \item{\code{HR}}{Homeruns}
    \item{\code{RBI}}{Runs Batted In}
    \item{\code{SB}}{Stolen Bases}
    \item{\code{CS}}{Caught Stealing}
    \item{\code{BB}}{Base on Balls}
    \item{\code{SO}}{Strikeouts}
    \item{\code{IBB}}{Intentional walks}
    \item{\code{HBP}}{Hit by pitch}
    \item{\code{SH}}{Sacrifice hits}
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
\seealso{
\code{\link{battingStats}} for calculating batting average (BA) and other derived statistics

\code{\link[plyr]{baseball}} for a similar dataset, but a subset of players who played 15 or more seasons.

\code{\link[vcd]{Baseball}} for data on batting in the 1987 season.

}

\keyword{datasets}

\examples{
data(Batting)
head(Batting)
require("dplyr")

## Prelude: Extract information from Salaries and People
## to be merged with the batting data.

# Subset of Salaries data
salaries <- Salaries \%>\%
              select(playerID, yearID, teamID, salary)

# Subset of People table (player metadata)
peopleInfo <- People \%>\%
              select(playerID, birthYear, birthMonth, nameLast,
                     nameFirst, bats)

# Left join salaries and peopleInfo to batting data,
# create an age variable and sort by playerID, yearID and stint
# Returns an ignorable warning.
batting <- battingStats() \%>\% 
             left_join(salaries, 
                       by =c("playerID", "yearID", "teamID")) \%>\%
             left_join(peopleInfo, by = "playerID") \%>\%
             mutate(age = yearID - birthYear - 
                            1L *(birthMonth >= 10)) \%>\%
             arrange(playerID, yearID, stint)

## Generate a ggplot similar to the NYT graph in the story about Ted
## Williams and the last .400 MLB season 
# http://www.nytimes.com/interactive/2011/09/18/sports/baseball/WILLIAMS-GRAPHIC.html

# Restrict the pool of eligible players to the years after 1899 and
# players with a minimum of 450 plate appearances (this covers the
# strike year of 1994 when Tony Gwynn hit .394 before play was suspended
# for the season - in a normal year, the minimum number of plate appearances is 502)

eligibleHitters <- batting \%>\%
                     filter(yearID >= 1900 & PA > 450)

# Find the hitters with the highest BA in MLB each year (there are a
# few ties).  Include all players with BA > .400, whether they
# won a batting title or not, and add an indicator variable for
# .400 average in a season.

topHitters <- eligibleHitters \%>\%
                 group_by(yearID) \%>\%
                 filter(BA == max(BA)| BA >= .400) \%>\%
                 mutate(ba400 = BA >= 0.400) \%>\%
                 select(playerID, yearID, nameLast, 
                        nameFirst, BA, ba400)

# Sub-data frame for the .400 hitters plus the outliers after 1950
# (averages above .380) - used to produce labels in the plot below
bignames <- topHitters \%>\%
              filter(ba400 | (yearID > 1950 & BA > 0.380)) \%>\%
              arrange(desc(BA))

# Variable to provide a vertical offset to certain
# labels in the ggplot below
bignames$yoffset <-  c(0, 0, 0, 0, 0.002, 0, 0, 0,
                       0.001, -0.001, 0, -0.002, 0, 0,
                       0.002, 0, 0)

# Produce the plot

require("ggplot2")                               
ggplot(topHitters, aes(x = yearID, y = BA)) +
  geom_point(aes(colour = ba400), size = 2.5) +
  geom_hline(yintercept = 0.400, size = 1, colour = "gray70") +
  geom_text(data = bignames, aes(y = BA + yoffset,
                                 label = nameLast), 
                             size = 3, hjust = 1.2) +
  scale_colour_manual(values = c("FALSE" = "black", "TRUE" = "red")) +
  xlim(1899, 2015) +
  xlab("Year") +
  scale_y_continuous("Batting average",
                     limits = c(0.330, 0.430),
                     breaks = seq(0.34, 0.42, by = 0.02),
                     labels = c(".340", ".360", ".380", ".400", ".420")) +
  geom_smooth() +
  theme(legend.position = "none")

##########################################################
# after Chris Green,
# http://sabr.org/research/baseball-s-first-power-surge-home-runs-late-19th-century-major-leagues

# Total home runs by year
totalHR <- Batting \%>\%
             group_by(yearID) \%>\%
             summarise(HomeRuns = sum(as.numeric(HR), na.rm=TRUE),
                       Games = sum(as.numeric(G), na.rm=TRUE))

# Plot HR by year, pre-1919 (dead ball era)
totalHR \%>\% filter(yearID <= 1918) \%>\%
            ggplot(., aes(x = yearID, y = HomeRuns)) +
               geom_line() +
               geom_point() +
               labs(x = "Year", y = "Home runs hit")

# Take games into account
totalHR \%>\% filter(yearID <= 1918) \%>\%
  ggplot(., aes(x = yearID, y = HomeRuns/Games)) +
     geom_line() +
     geom_point() +
     labs(x = "Year", y = "Home runs per game played")

# Widen perspective to all years from 1871
ggplot(totalHR, aes(x = yearID, y = HomeRuns)) +
  geom_point() +
  geom_path() +
  geom_smooth() +
  labs(x = "Year", y = "Home runs hit")

# Similar plot for HR per game played by year -
# shows several eras with spikes in HR hit
ggplot(totalHR, aes(x = yearID, y = HomeRuns/Games)) +
  geom_point() +
  geom_path() +
  geom_smooth(se = FALSE) +
  labs(x = "Year", y = "Home runs per game played")


}
