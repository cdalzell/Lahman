\name{AllstarFull}
\alias{AllstarFull}
\docType{data}
\title{
AllstarFull table
}
\description{
All Star appearances by players
}
\usage{data(AllstarFull)}
\format{
  A data frame with 5291 observations on the following 8 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year}
    \item{\code{gameNum}}{Game number (for years in which more than one game was played)}
    \item{\code{gameID}}{Game ID code}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{NL}}
    \item{\code{GP}}{Game played (zero if player did not appear in game)}
    \item{\code{startingPos}}{If the player started, what position he played}
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
data(AllstarFull)

# find number of appearances by players in the All Star games
player_appearances <- with(AllstarFull, rev(sort(table(playerID))))

# How many All-Star players, in total?
length(player_appearances)

# density plot of the whole distribution
plot(density(player_appearances), main="Player appearances in All Star Games")
rug(jitter(player_appearances))

# who has played in more than 10 ASGs?
player_appearances[player_appearances > 10]
hist(player_appearances[player_appearances > 10])


# Hank Aaron's All-Star record:
subset(AllstarFull, playerID == "aaronha01")

# Years that Stan Musial played in the ASG:
with(AllstarFull, yearID[playerID == "musiast01"])

# Starting positions he played (NA means did not start)
with(AllstarFull, startingPos[playerID == "musiast01"])

# All-Star rosters from the 1966 ASG
subset(AllstarFull, gameID == "NLS196607120")

# All-Stars from the Washington Nationals
subset(AllstarFull, teamID == "WAS")

# Teams with the fewest All-Stars
rare <- names(which(table(AllstarFull$teamID) < 10))

# Records associated with the 'rare' teams:
# (There are a few teamID typos: can you spot them?)
subset(AllstarFull, teamID \%in\% rare)
}

\keyword{datasets}
