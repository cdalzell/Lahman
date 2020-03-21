\name{HomeGames}
\alias{HomeGames}
\docType{data}
\title{
HomeGames table
}
\description{
Data mapping teams to the baseball stadiums they played in as the home team.
}
\usage{data(HomeGames)}
\format{
  A data frame with 3108 observations on the following 9 variables.
  \describe{
    \item{\code{year.key}}{Year}
    \item{\code{league.key}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{team.key}}{Team; a factor}
    \item{\code{park.key}}{Unique identifier for each ballpark}
    \item{\code{span.first}}{First date the park began acting as home field for the team}
    \item{\code{span.last}}{Last date the park began acting as home field for the team}
    \item{\code{games}}{Total games in this time span}
    \item{\code{openings}}{Total opening in this time span}
    \item{\code{attendance}}{Total attendance in this time span}
  }
}
\source{
Lahman, S. (2020) Lahman's Baseball Database, 1871-2019, 2019 version, \url{http://www.seanlahman.com/baseball-archive/statistics/}
}
\keyword{datasets}
\examples{

}
