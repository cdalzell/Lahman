\name{CollegePlaying}
\alias{CollegePlaying}
\docType{data}
\title{
CollegePlaying table
}
\description{
Information on schools players attended, by player
}
\usage{data(CollegePlaying)}
\format{
  A data frame with 17350 observations on the following 3 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{schoolID}}{school ID code}
    \item{\code{yearID}}{Year player attended school}
  }
}
\details{
This data set reflects a change in the Lahman schema for the 2015 version.
The old \code{SchoolsPlayers} table was replaced with
this new table called \code{CollegePlaying}.

According to the documentation,
this change reflects advances in the compilation of this data, largely led by
Ted Turocy. The old table reported college attendance for major league
players by listing a start date and end date.  The new version has a 
separate record for each year that a player attended.  This allows
us to better account for players who attended multiple colleges or
skipped a season, as well as to identify teammates.
}
\source{
Lahman, S. (2015) Lahman's Baseball Database, 1871-2014, 2015 version, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{
data(CollegePlaying)
head(CollegePlaying)

## Q: What are the top universities for producing MLB players?
SPcount <- table(CollegePlaying$schoolID)
SPcount[SPcount>50]

library('lattice')
dotplot(SPcount[SPcount>50])
dotplot(sort(SPcount[SPcount>50]))

## Q: How many schools are represented in this dataset?
length(table(CollegePlaying$schoolID))

# Histogram of the number of players from each school who played in MLB:
with(CollegePlaying, hist(table(schoolID), xlab = 'Number of players',
                           main = ""))
}
