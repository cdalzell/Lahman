\name{SchoolsPlayers}
\alias{SchoolsPlayers}
\docType{data}
\title{
SchoolsPlayers table
}
\description{
Information on schools players attended, by player
}
\usage{data(SchoolsPlayers)}
\format{
  A data frame with 6147 observations on the following 4 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{schoolID}}{school ID code}
    \item{\code{yearMin}}{year player's college career started}
    \item{\code{yearMax}}{year player's college career ended}
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
data(SchoolsPlayers)
head(SchoolsPlayers)

## Q: What are the top universities for producing MLB players?
SPcount <- table(SchoolsPlayers$schoolID)
SPcount[SPcount>50]

library('lattice')
dotplot(SPcount[SPcount>50])
dotplot(sort(SPcount[SPcount>50]))

## Q: How many schools are represented in this dataset?
length(table(SchoolsPlayers$schoolID))

# Histogram of the number of players from each school who played in MLB:
with(SchoolsPlayers, hist(table(schoolID), xlab = 'Number of players',
                           main = ""))

}
