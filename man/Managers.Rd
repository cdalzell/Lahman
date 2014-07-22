\name{Managers}
\alias{Managers}
\docType{data}
\title{
Managers table
}
\description{
Managers table: information about individual team managers, teams they managed and some basic statistics
for those teams in each year.
}
\usage{data(Managers)}
\format{
  A data frame with 3337 observations on the following 10 variables.
  \describe{
    \item{\code{playerID}}{Manager (player) ID code}
    \item{\code{yearID}}{Year}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{inseason}}{Managerial order.  Zero if the individual managed the team
                 the entire year.  Otherwise denotes where the manager appeared
                 in the managerial order (1 for first manager, 2 for second, etc.)}
    \item{\code{G}}{Games managed}
    \item{\code{W}}{Wins}
    \item{\code{L}}{Losses}
    \item{\code{rank}}{Team's final position in standings that year}
    \item{\code{plyrMgr}}{Player Manager (denoted by 'Y'); a factor with levels \code{N} \code{Y}}

  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Lahman, S. (2014) Lahman's Baseball Database, 1871-2013, 2014 version, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{
####################################
# Basic career summaries by manager
####################################

library('plyr')
mgrsumm <- function(d) {
    df <- data.frame(with(d,
              nyear = length(unique(yearID)),
              yearBegin = min(yearID),
              yearEnd = max(yearID),
              nTeams = length(unique(teamID)),
              nfirst = sum(rank == 1L),
              W = sum(W),
              L = sum(L),
              WinPct = round(W/(W + L), 3)))
    df
}

mgrTotals <- ddply(Managers, .(playerID), summarise,
                  nyear = length(unique(yearID)),
                  yearBegin = min(yearID),
                  yearEnd = max(yearID),
                  nTeams = length(unique(teamID)),
                  nfirst = sum(rank == 1L),
                  games = sum(W + L),
                  W = sum(W),
                  L = sum(L),
                  WinPct = round(sum(W)/sum(W + L), 3))
mgrTotals <- merge(mgrTotals,
                   subset(Master, !is.na(playerID),
                          select = c('playerID', 'nameLast', 'nameFirst')),
                   by = 'playerID')

##########################
# Some basic queries
##########################

# Top 20 managers in terms of years of service:
head(arrange(mgrTotals, -nyear), 20)

# Top 20 winningest managers (500 games minimum)
head(arrange(subset(mgrTotals, games >= 500), -WinPct), 20)

# Hmm. Most of these are 19th century managers.
# How about the modern era?
head(arrange(subset(mgrTotals, yearBegin >= 1900 & games >= 500), -WinPct), 20)

# Top 10 managers in terms of percentage of titles (league or divisional) -
# should bias toward managers post-1970 since more first place finishes
# are available
head(arrange(subset(mgrTotals, yearBegin >= 1900 & games >= 500),
                -round(nfirst/nyear, 3)), 10)

# How about pre-1969?
head(arrange(subset(mgrTotals,
                    yearBegin >= 1900 & yearEnd <= 1969 & games >= 500),
                    -round(nfirst/nyear, 3)), 10)

##############################################
# Density plot of the number of games managed:
##############################################

library('ggplot2')
ggplot(mgrTotals, aes(x = games)) + geom_density(fill = 'red', alpha = 0.3) +
    labs(x = 'Number of games managed')

# Who managed more than 4000 games?
subset(mgrTotals, games >= 4000)
# Connie Mack had an advantage: he owned the Philadelphia A's :)

# Table of Tony LaRussa's team finishes:
with(subset(Managers, playerID == 'larusto01'), table(rank))

# To include zero frequencies, one alternative is the tabulate() function:
with(subset(Managers, playerID == 'larusto01'), tabulate(rank, 7))


##############################################
# Scatterplot of winning percentage vs. number of games managed (min 100)
##############################################

ggplot(subset(mgrTotals, yearBegin >= 1900 & games >= 100),
       aes(x = games, y = WinPct)) + geom_point() + geom_smooth() +
    labs(x = 'Number of games managed')

############################################
# Division titles
############################################

# Plot of number of first place finishes by managers with at least 8 years
# of experience in the divisional era (>= 1969):

divMgr <- subset(mgrTotals, yearBegin >= 1969 & nyear >= 8)

# Response is the number of titles
ggplot(divMgr, aes(x = nyear, y = nfirst)) +
    geom_point(position = position_jitter(w = 0.2)) +
    labs(x = 'Number of years', y = 'Number of divisional titles') +
    geom_smooth()

# Response is the proportion of titles
ggplot(divMgr, aes(x = nyear, y = round(nfirst/nyear, 3))) +
    geom_point(position = position_jitter(w = 0.2)) +
    labs(x = 'Number of years', y = 'Proportion of divisional titles') +
    geom_smooth()

}
