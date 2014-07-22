\name{HallOfFame}
\alias{HallOfFame}
\docType{data}
\title{
Hall of Fame Voting Data
}
\description{
Hall of Fame table. This is comprised of the voting results for all candidates nominated for the
Baseball Hall of Fame.
}
\usage{data(HallOfFame)}
\format{
  A data frame with 4054 observations on the following 8 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year of ballot}
    \item{\code{votedBy}}{Method by which player was voted upon.  See Details}
    \item{\code{ballots}}{Total ballots cast in that year}
    \item{\code{needed}}{Number of votes needed for selection in that year}
    \item{\code{votes}}{Total votes received}
    \item{\code{inducted}}{Whether player was inducted by that vote or not (Y or N)}
    \item{\code{category}}{Category of candidate; a factor with levels \code{Manager} \code{Pioneer/Executive} \code{Player} \code{Umpire}}
    \item{\code{needed_note}}{Explanation of qualifiers for special elections}
  }
}
\details{
This table links to the \code{\link{Master}} table via the \code{playerID}.

\code{votedBy}: Most Hall of Fame inductees have been elected by the 
Baseball Writers Association of America (\code{BBWAA}).  Rules for election are
described in \url{http://en.wikipedia.org/wiki/National_Baseball_Hall_of_Fame_and_Museum#Selection_process}.

}
\source{
Lahman, S. (2014) Lahman's Baseball Database, 1871-2013, 2014 version, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{
## Some examples for  Hall of Fame induction data

data('HallOfFame')
require('plyr')          ## extensive use of plyr for data manipulation 
require('ggplot2')

############################################################
## Some simple queries

# What are the different types of votedBy?
table(HallOfFame$votedBy)

# What was the first year of Hall of Fame elections?
sort(unique(HallOfFame$yearID))[1]
# Who comprised the original class?
subset(HallOfFame, yearID == 1936 & inducted == 'Y')

# Result of a player's last year on the BBWAA ballot
# Restrict to players voted by BBWAA:
HOFplayers <- subset(HallOfFame, votedBy == 'BBWAA' & category == 'Player')


# Function to calculate number of years as HOF candidate, last pct vote, etc.
# for a given player
HOFun <- function(d) {
    nyears <- nrow(d)
    fy <- d[nyears, ]
    lastPct <- with(fy, 100 * round(votes/ballots, 3))
    data.frame(playerID = fy$playerID, nyears, induct = fy$inducted,
               lastPct, lastYear = fy$yearID)
}

playerOutcomesHOF <- ddply(HOFplayers, .(playerID), HOFun)


############################################################
# How many voting years until election?
inducted <- subset(playerOutcomesHOF,induct == 'Y')
table(inducted$nyears)
barplot(table(inducted$nyears), main="Number of voting years until election",
		ylab="Number of players", xlab="Years")

# What is the form of this distribution?
require('vcd')
goodfit(inducted$nyears)
plot(goodfit(inducted$nyears), xlab='Number of years',
	main="Poissonness plot of number of years voting until election")
Ord_plot(table(inducted$nyears), xlab='Number of years')



# First ballot inductees:
subset(playerOutcomesHOF, nyears == 1L & induct == 'Y')

# Who took at least ten years on the ballot before induction?
# (Doesn't include Bert Blyleven, who was inducted in 2011.)
subset(playerOutcomesHOF, nyears >= 10L & induct == 'Y')

############################################################
## Plots of voting percentages over time for the borderline
## HOF candidates, according to the BBWAA:

# (1) Set up the data:
longTimers <- as.character(unlist(subset(playerOutcomesHOF,
                                         nyears >= 10, select = 'playerID')))
HOFlt <- subset(HallOfFame, playerID \%in\% longTimers & votedBy == 'BBWAA')
HOFlt <- ddply(HOFlt, .(playerID), mutate,
                  elected = ifelse(any(inducted == 'Y'),"Elected", "Not elected"),
                  pct = 100 * round(votes/ballots, 3))

# Plot the voting profiles:
ggplot(HOFlt, aes(x = yearID, y = pct,
                  group = playerID)) +
    ggtitle("Profiles of voting percentage for long-time HOF candidates") +
    geom_line() +
    geom_hline(yintercept = 75, col = 'red') +
    labs(list(x = "Year", y = "Percentage of votes")) +
    facet_wrap(~ elected, ncol = 1)

# Note: All but one of the players whose maximum voting percentage
# was over 60% and was not elected by the BBWAA has eventually been inducted
# into the HOF. Red Ruffing was elected in a 1967 runoff election while
# the others have been voted in by the Veterans Committee. The lone
# exception is Gil Hodges; his profile is the one that flatlines around 60%
# for several years in the late 70s and early 80s.
}

