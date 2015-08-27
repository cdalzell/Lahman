\name{Pitching}
\alias{Pitching}
\docType{data}
\title{
Pitching table
}
\description{
Pitching table
}
\usage{data(Pitching)}
\format{
  A data frame with 43330 observations on the following 30 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year}
    \item{\code{stint}}{player's stint (order of appearances within a season)}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{W}}{Wins}
    \item{\code{L}}{Losses}
    \item{\code{G}}{Games}
    \item{\code{GS}}{Games Started}
    \item{\code{CG}}{Complete Games }
    \item{\code{SHO}}{Shutouts}
    \item{\code{SV}}{Saves}
    \item{\code{IPouts}}{Outs Pitched (innings pitched x 3)}
    \item{\code{H}}{Hits}
    \item{\code{ER}}{Earned Runs}
    \item{\code{HR}}{Homeruns}
    \item{\code{BB}}{Walks}
    \item{\code{SO}}{Strikeouts}
    \item{\code{BAOpp}}{Opponent's Batting Average}
    \item{\code{ERA}}{Earned Run Average}
    \item{\code{IBB}}{Intentional Walks}
    \item{\code{WP}}{Wild Pitches}
    \item{\code{HBP}}{Batters Hit By Pitch}
    \item{\code{BK}}{Balks}
    \item{\code{BFP}}{Batters faced by Pitcher}
    \item{\code{GF}}{Games Finished}
    \item{\code{R}}{Runs Allowed}
    \item{\code{SH}}{Sacrifices by opposing batters}
    \item{\code{SF}}{Sacrifice flies by opposing batters}
    \item{\code{GIDP}}{Grounded into double plays by opposing batter}
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
# Pitching data

require(plyr)

###################################
# cleanup, and add some other stats
###################################

# Restrict to AL and NL data, 1901+
# All data re SH, SF and GIDP are missing, so remove
# Intentional walks (IBB) not recorded until 1955
pitching <- subset(Pitching, yearID >= 1901 & lgID \%in\% c("AL", "NL"))[, -(28:30)]

# Approximate missing BAOpp values (most common remaining missing value)
pitching$BAOpp <- with(pitching, round(H/(BFP - BB - HBP), 3))
# Compute WHIP (hits + walks per inning pitched -- lower is better)
pitching <- mutate(pitching, 
                   WHIP = round((H + BB) * 3/IPouts, 2),
                   KperBB = round(ifelse(yearID >= 1955, 
                                         SO/(BB - IBB), SO/BB), 2))

#####################
# some simple queries
#####################

# Team pitching statistics, Toronto Blue Jays, 1993
tor93 <- subset(pitching, yearID == 1993 & teamID == "TOR")
arrange(tor93, ERA)

# Career pitching statistics, Greg Maddux
subset(pitching, playerID == "maddugr01")

# Best ERAs for starting pitchers post WWII
postwar <- subset(pitching, yearID >= 1946 & IPouts >= 600)
head(arrange(postwar, ERA), 10)

# Best K/BB ratios post-1955 among starters (excludes intentional walks)
post55 <- subset(pitching, yearID >= 1955 & IPouts >= 600)
post55 <- mutate(post55, KperBB = SO/(BB - IBB))
head(arrange(post55, desc(KperBB)), 10)

# Best K/BB ratios among relievers post-1950 (min. 20 saves)
head(arrange(subset(pitching, yearID >= 1950 & SV >= 20), desc(KperBB)), 10)

###############################################
# Winningest pitchers in each league each year:
###############################################

# Add name & throws information:
masterInfo <- Master[, c('playerID',
                         'nameLast', 'nameFirst', 'throws')]
pitching <- merge(pitching, masterInfo, all.x=TRUE)

wp <- ddply(pitching, .(yearID, lgID), subset, W == max(W), 
         select = c("playerID", "teamID", "W", "throws"))

anova(lm(formula = W ~ yearID + I(yearID^2) + lgID + throws, data = wp))

# an eye-catching, but naive, specious graph 

require('ggplot2') 
# compare loess smooth with quadratic fit                              
ggplot(wp, aes(x = yearID, y = W)) +
    geom_point(aes(colour = throws, shape=lgID), size = 2) +
    geom_smooth(method="loess", size=1.5, color="blue") +
    geom_smooth(method = "lm", se=FALSE, color="black", formula = y ~ poly(x,2)) +
    ylab("Maximum Wins") + xlab("Year") +
    ggtitle("Why can't pitchers win 30+ games any more?")


}

\keyword{datasets}
