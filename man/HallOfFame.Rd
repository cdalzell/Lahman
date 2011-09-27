\name{HallOfFame}
\alias{HallOfFame}
\docType{data}
\title{
Hall of Fame table
}
\description{
Hall of Fame table
}
\usage{data(HallOfFame)}
\format{
  A data frame with 3913 observations on the following 8 variables.
  \describe{
    \item{\code{hofID}}{Player ID code}
    \item{\code{yearID}}{Year of ballot}
    \item{\code{votedBy}}{Method by which player was voted upon}
    \item{\code{ballots}}{Total ballots cast in that year}
    \item{\code{needed}}{Number of votes needed for selection in that year}
    \item{\code{votes}}{Total votes received}
    \item{\code{inducted}}{Whether player was inducted by that vote or not (Y or N)}
    \item{\code{category}}{Category of candidate; a factor with levels \code{Manager} \code{Pioneer/Executive} \code{Player} \code{Umpire}}
  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Lahman, S. (2010) Lahman's Baseball Database, 1871-2010, v.5.8, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}
