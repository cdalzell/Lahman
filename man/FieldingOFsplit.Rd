\name{FieldingOFsplit}
\alias{FieldingOFsplit}
\docType{data}
\title{
FieldingOFsplit table
}
\description{
Outfield position data: information about positions played in the outfield
}
\usage{data(FieldingOFsplit)}
\format{
  A data frame with 35315 observations on the following 18 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year}
    \item{\code{stint}}{player's stint (order of appearances within a season)}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{POS}}{Position}
    \item{\code{G}}{Games }
    \item{\code{GS}}{Games Started}
    \item{\code{InnOuts}}{Time played in the field expressed as outs }
    \item{\code{PO}}{Putouts}
    \item{\code{A}}{Assists}
    \item{\code{E}}{Errors}
    \item{\code{DP}}{Double Plays}
    \item{\code{PB}}{Passed Balls (by catchers)}
    \item{\code{WP}}{Wild Pitches (by catchers)}
    \item{\code{SB}}{Opponent Stolen Bases (by catchers)}
    \item{\code{CS}}{Opponents Caught Stealing (by catchers)}
    \item{\code{ZR}}{Zone Rating}
  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Lahman, S. (2023) Lahman's Baseball Database, 1871-2022, 2022 version, \url{https://www.seanlahman.com/baseball-archive/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
require("dplyr")
require("tidyr")

## Data set starts in 1954
## Can get a more complete record from the Fielding data frame
## or from the Appearances data (see below)

## Output directly from the FieldingOFsplit data

## Joe DiMaggio (no records: pre-1954 player)
FieldingOFsplit \%>\% 
   filter(playerID == "dimagjo01") 

## Willie Mays (all but his first few years)
FieldingOF \%>\% 
  filter(playerID == "mayswi01") 

## Mike Trout (complete)
FieldingOF \%>\% 
  filter(playerID == "troutmi01")
}
\keyword{datasets}
