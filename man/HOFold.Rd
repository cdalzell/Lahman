\name{HOFold}
\alias{HOFold}
\docType{data}
\title{
HOFold table
}
\description{
Old Hall of Fame table
}
\usage{data(HOFold)}
\format{
  A data frame with 289 observations on the following 7 variables.
  \describe{
    \item{\code{hofID}}{Player ID code}
    \item{\code{yearid}}{Year of ballot}
    \item{\code{votedBy}}{Method by which player was voted upon}
    \item{\code{ballots}}{Total ballots cast in that year}
    \item{\code{votes}}{Total votes received}
    \item{\code{inducted}}{Whether player was inducted by that vote or not (Y or N); a factor with levels \code{Y}}
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
