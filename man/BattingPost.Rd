\name{BattingPost}
\alias{BattingPost}
\docType{data}
\title{
BattingPost table
}
\description{
Post season batting statistics
}
\usage{data(BattingPost)}
\format{
  A data frame with 9840 observations on the following 22 variables.
  \describe{
    \item{\code{yearID}}{Year}
    \item{\code{round}}{Level of playoffs }
    \item{\code{playerID}}{Player ID code}
    \item{\code{teamID}}{Team}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{NL}}
    \item{\code{G}}{Games}
    \item{\code{AB}}{At Bats}
    \item{\code{R}}{Runs}
    \item{\code{H}}{Hits}
    \item{\code{X2B}}{Doubles}
    \item{\code{X3B}}{Triples}
    \item{\code{HR}}{Homeruns}
    \item{\code{RBI}}{Runs Batted In}
    \item{\code{SB}}{Stolen Bases}
    \item{\code{CS}}{Caught stealing}
    \item{\code{BB}}{Base on Balls}
    \item{\code{SO}}{Strikeouts}
    \item{\code{IBB}}{Intentional walks}
    \item{\code{HBP}}{Hit by pitch}
    \item{\code{SH}}{Sacrifices}
    \item{\code{SF}}{Sacrifice flies}
    \item{\code{GIDP}}{Grounded into double plays}
  }
}
\details{
Variables \code{X2B} and \code{X3B} are named \code{2B} and \code{3B} in the original database
}
\source{
Lahman, S. (2010) Lahman's Baseball Database, 1871-2010, v.5.8, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}
