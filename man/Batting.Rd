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
  A data frame with 97889 observations on the following 24 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year}
    \item{\code{stint}}{player's stint (order of appearances within a season)}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{G}}{Games: number of games in which a player played}
    \item{\code{G_batting}}{Game as batter}
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
    \item{\code{G_old}}{Old version of games (deprecated)}
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
\seealso{
\code{\link{battingStats}} for calculating batting average (BA) and other derived statistics

\code{\link[plyr]{baseball}} for a similar dataset, but a subset of players who played 15 or more seasons.

\code{\link[vcd]{Baseball}} for data on batting in the 1987 season.

}

\keyword{datasets}

\examples{
data(Batting)
head(Batting)
require('plyr')

# calculate batting average and other stats
batting <- battingStats()

# add salary to Batting data; need to match by player, year and team
batting <- merge(batting, 
                 Salaries[,c("playerID", "yearID", "teamID", "salary")], 
                 by=c("playerID", "yearID", "teamID"), all.x=TRUE)

# Add name, age and bat hand information:
masterInfo <- Master[, c('playerID', 'birthYear', 'birthMonth',
                          'nameLast', 'nameFirst', 'bats')]
batting <- merge(batting, masterInfo, all.x = TRUE)
batting$age <- with(batting, yearID - birthYear -
                             ifelse(birthMonth < 10, 0, 1))

batting <- arrange(batting, playerID, yearID, stint)

## Generate a ggplot similar to the NYT graph in the story about Ted
## Williams and the last .400 MLB season 
# http://www.nytimes.com/interactive/2011/09/18/sports/baseball/WILLIAMS-GRAPHIC.html

# Restrict the pool of eligible players to the years after 1899 and
# players with a minimum of 450 plate appearances (this covers the
# strike year of 1994 when Tony Gwynn hit .394 before play was suspended
# for the season - in a normal year, the minimum number of plate appearances is 502)
eligibleHitters <- subset(batting, yearID >= 1900 & PA > 450)

# Find the hitters with the highest BA in MLB each year (there are a
# few ties).  Include all players with BA > .400
topHitters <- ddply(eligibleHitters, .(yearID), subset, (BA == max(BA))|BA > .400)

# Create a factor variable to distinguish the .400 hitters
topHitters$ba400 <- with(topHitters, BA >= 0.400)

# Sub-data frame for the .400 hitters plus the outliers after 1950
# (averages above .380) - used to produce labels in the plot below
bignames <- rbind(subset(topHitters, ba400),
                  subset(topHitters, yearID > 1950 & BA > 0.380))
# Cut to the relevant set of variables
bignames <- subset(bignames, select = c('playerID', 'yearID', 'nameLast',
                                        'nameFirst', 'BA'))

# Ditto for the original data frame
topHitters <- subset(topHitters, select = c('playerID', 'yearID', 'BA', 'ba400'))

# Positional offsets to spread out certain labels
#                     NL TC JJ TC GS TC RH GS HH RH RH BT TW TW  RC GB TG 
bignames$xoffset <- c(0, 0, 0, 0, 0, 0, 0, 0, -8, 0, 3, 3, 0, 0, -2, 0, 0)
bignames$yoffset <- c(0, 0, -0.003, 0, 0, 0, 0, 0, -0.004, 0, 0, 0, 0, 0, -0.003, 0, 0)  +  0.002

require('ggplot2')                               
ggplot(topHitters, aes(x = yearID, y = BA)) +
    geom_point(aes(colour = ba400), size = 2.5) +
    geom_hline(yintercept = 0.400, size = 1) +
    geom_text(data = bignames, aes(x = yearID + xoffset, y = BA + yoffset,
                                   label = nameLast), size = 3) +
    scale_colour_manual(values = c('FALSE' = 'black', 'TRUE' = 'red')) +
    ylim(0.330, 0.430) +
    xlab('Year') +
    scale_y_continuous('Batting average',
                       breaks = seq(0.34, 0.42, by = 0.02),
                       labels = c('.340', '.360', '.380', '.400', '.420')) +
    geom_smooth() +
    theme(legend.position = 'none')

##########################################################
# after Chris Green,
# http://sabr.org/research/baseball-s-first-power-surge-home-runs-late-19th-century-major-leagues

# Total home runs by year
totalHR <- ddply(Batting, .(yearID), summarise,
                       HomeRuns = sum(as.numeric(HR), na.rm=TRUE),
                       Games = sum(as.numeric(G_batting), na.rm=TRUE)
                       )

plot(HomeRuns ~ yearID, data=subset(totalHR, yearID<=1918))
# take games into account?
plot(HomeRuns/Games ~ yearID, data=subset(totalHR, yearID<=1918))

# long term trend?
plot(HomeRuns ~ yearID, data=totalHR)
plot(HomeRuns/Games ~ yearID, data=totalHR)


}
