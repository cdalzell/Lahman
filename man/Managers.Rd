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
  A data frame with 3504 observations on the following 10 variables.
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
Lahman, S. (2019) Lahman's Baseball Database, 1871-2018, 2018 version, \url{http://www.seanlahman.com/baseball-archive/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{
####################################
# Basic career summaries by manager
####################################

library("dplyr")
mgrSumm <- Managers \%>\%
            group_by(playerID) \%>\%
            summarise(nyear = length(unique(yearID)),
                      yearBegin = min(yearID),
                      yearEnd = max(yearID),
                      nTeams = length(unique(teamID)),
                      nfirst = sum(rank == 1L),
                      W = sum(W),
                      L = sum(L),
                      WinPct = round(W/(W + L), 3))

MgrInfo <- People \%>\%
            filter(!is.na(playerID)) \%>\%
            select(playerID, nameLast, nameFirst)

# Merge names into the table
mgrTotals <- right_join(MgrInfo, mgrSumm, by = "playerID")

# add total games managed
mgrTotals <- mgrTotals \%>\%
              mutate(games = W + L)

##########################
# Some basic queries
##########################

# Top 20 managers in terms of years of service:
mgrTotals \%>\%
   arrange(desc(nyear)) \%>\%
   head(., 20)

# Top 20 winningest managers (500 games minimum)
mgrTotals \%>\%
   filter((W + L) >= 500) \%>\%
   arrange(desc(WinPct)) \%>\%
   head(., 20)

# Most of these are 19th century managers.
# How about the modern era?
mgrTotals \%>\%
   filter(yearBegin >= 1901 & (W + L) >= 500) \%>\%
   arrange(desc(WinPct)) \%>\%
   head(., 20)

# Top 10 managers in terms of percentage of titles 
# (league or divisional) - should bias toward managers
#  post-1970 since more first place finishes are available
mgrTotals \%>\%
   filter(yearBegin >= 1901 & (W + L) >= 500) \%>\%
   arrange(desc(round(nfirst/nyear, 3))) \%>\%
   head(., 10)

# How about pre-1969?
mgrTotals \%>\%
  filter(yearBegin >= 1901 & yearEnd <= 1969 &
          (W + L) >= 500) \%>\%
  arrange(desc(round(nfirst/nyear, 3))) \%>\%
  head(., 10)

## Tony LaRussa's managerial record by team
Managers \%>\%
  filter(playerID == "larusto01") \%>\%
  group_by(teamID) \%>\%
  summarise(nyear = length(unique(yearID)),
            yearBegin = min(yearID),
            yearEnd = max(yearID),
            games = sum(G),
            nfirst = sum(rank == 1L),
            W = sum(W),
            L = sum(L),
            WinPct = round(W/(W + L), 3))

##############################################
# Density plot of the number of games managed:
##############################################

library("ggplot2")

ggplot(mgrTotals, aes(x = games)) + 
    geom_density(fill = "red", alpha = 0.3) +
    labs(x = "Number of games managed")

# Who managed more than 4000 games?
mgrTotals \%>\% 
  filter(W + L >= 4000) \%>\%
  arrange(desc(W + L))
# Connie Mack's advantage: he owned the Philadelphia A's :)

# Table of Tony LaRussa's team finishes (rank order):
Managers \%>\%
   filter(playerID == "larusto01") \%>\%
   count(rank)



##############################################
# Scatterplot of winning percentage vs. number 
# of games managed (min 100)
##############################################

ggplot(subset(mgrTotals, yearBegin >= 1900 & games >= 100),
       aes(x = games, y = WinPct)) + 
  geom_point() + geom_smooth() +
  labs(x = "Number of games managed")

############################################
# Division titles
############################################

# Plot of number of first place finishes by managers who
# started in the divisional era (>= 1969) with 
# at least 8 years of experience

mgrTotals \%>\% 
  filter(yearBegin >= 1969 & nyear >= 8) \%>\%
  ggplot(., aes(x = nyear, y = nfirst)) +
     geom_point(position = position_jitter(width = 0.2)) +
     labs(x = "Number of years", 
          y = "Number of divisional titles") +
     geom_smooth()


# Change response to proportion of titles relative
# to years managed
mgrTotals \%>\% 
  filter(yearBegin >= 1969 & nyear >= 8) \%>\%
  ggplot(., aes(x = nyear, y = round(nfirst/nyear, 3))) +
     geom_point(position = position_jitter(width = 0.2)) +
     labs(x = "Number of years", 
          y = "Proportion of divisional titles") +
     geom_smooth()

}
