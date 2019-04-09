\name{People}
\alias{People}
\docType{data}
\title{
People table
}
\description{
People table - Player names, DOB, and biographical info.  This file is to be used to get details
about players listed in the \code{\link{Batting}}, \code{\link{Pitching}}, and other files
where players are identified only by \code{playerID}.
}

\usage{data(People)}
\format{
  A data frame with 19617 observations on the following 26 variables.
  \describe{
    \item{\code{playerID}}{A unique code assigned to each player.  The \code{playerID} links
                 the data in this file with records on players in the other files.}
    \item{\code{birthYear}}{Year player was born}
    \item{\code{birthMonth}}{Month player was born}
    \item{\code{birthDay}}{Day player was born}
    \item{\code{birthCountry}}{Country where player was born}
    \item{\code{birthState}}{State where player was born}
    \item{\code{birthCity}}{City where player was born}
    \item{\code{deathYear}}{Year player died}
    \item{\code{deathMonth}}{Month player died}
    \item{\code{deathDay}}{Day player died}
    \item{\code{deathCountry}}{Country where player died}
    \item{\code{deathState}}{State where player died}
    \item{\code{deathCity}}{City where player died}
    \item{\code{nameFirst}}{Player's first name}
    \item{\code{nameLast}}{Player's last name}
%    \item{\code{nameNote}}{Note about player's name (usually signifying that they changed
%                 their name or played under two differnt names)}
    \item{\code{nameGiven}}{Player's given name (typically first and middle)}
 %   \item{\code{nameNick}}{Player's nickname}
    \item{\code{weight}}{Player's weight in pounds}
    \item{\code{height}}{Player's height in inches}
    \item{\code{bats}}{a factor: Player's batting hand (left (L), right (R), or both (B))         }
    \item{\code{throws}}{a factor: Player's throwing hand (left(L) or right(R))}
    \item{\code{debut}}{Date that player made first major league appearance}
    \item{\code{finalGame}}{Date that player made first major league appearance (blank if still active)}
    \item{\code{retroID}}{ID used by retrosheet, \url{http://www.retrosheet.org/}}
    \item{\code{bbrefID}}{ID used by Baseball Reference website, \url{http://www.baseball-reference.com/}}
    \item{\code{birthDate}}{Player's birthdate, in \code{as.Date} format}
    \item{\code{deathDate}}{Player's deathdate, in \code{as.Date} format}
  }
}
\details{
\code{debut}, \code{finalGame} were converted from character strings with \code{as.Date}.
}
\source{
Lahman, S. (2019) Lahman's Baseball Database, 1871-2018, 2018 version, \url{http://www.seanlahman.com/baseball-archive/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{
data(People); data(Batting)

## add player's name to Batting data
People$name <- paste(People$nameFirst, People$nameLast, sep=" ")
batting <- merge(Batting, 
                 People[,c("playerID","name")], 
                 by="playerID", all.x=TRUE)

## batting and throwing
# right-handed batters are much less ambidexterous in throwing than left-handed batters
# (should only include batters)

BT <- with(People, table(bats, throws))
require(vcd)
structable(BT)
mosaic(BT, shade=TRUE)

## Who is Shoeless Joe Jackson?
subset(People, nameLast=="Jackson" & nameFirst=="Joe")
subset(People, nameLast=="Jackson" & nameFirst=="Shoeless Joe")

joeID <-c(subset(People, nameLast=="Jackson" & nameFirst=="Shoeless Joe")["playerID"])

subset(Batting, playerID==joeID)
subset(Fielding, playerID==joeID)
}
