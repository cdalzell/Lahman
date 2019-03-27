\name{Fielding}
\alias{Fielding}
\docType{data}
\title{
Fielding table
}
\description{
Fielding table
}
\usage{data(Fielding)}
\format{
  A data frame with 140921 observations on the following 18 variables.
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
Lahman, S. (2019) Lahman's Baseball Database, 1871-2018, 2018 version, \url{http://www.seanlahman.com/baseball-archive/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{
data(Fielding)
# Basic fielding data

require("dplyr")


# Roberto Clemente's fielding profile
# pitching and catching related data removed
# subset(Fielding, playerID == "clemero01")[, 1:13]
Fielding \%>\% 
   filter(playerID == "clemero01") \%>\%
   select(1:13)
   
# Yadier Molina's fielding profile
# PB, WP, SP and CS apply to catchers
Fielding \%>\% 
  subset(playerID == "molinya01") \%>\%
  select(-WP, -ZR)

# Pedro Martinez's fielding profile
Fielding \%>\% subset(playerID == "martipe02")

# Table of games played by Pete Rose at different positions
with(subset(Fielding, playerID == "rosepe01"), xtabs(G ~ POS))

# Career total G/PO/A/E/DP for Luis Aparicio
Fielding \%>\%
    filter(playerID == "aparilu01") \%>\% 
    select(G, PO, A, E, DP) \%>\%
    summarise_each(funs(sum))


# Top ten 2B/SS in turning DPs
Fielding \%>\%
    subset(POS \%in\% c("2B", "SS")) \%>\%
    group_by(playerID) \%>\%
    summarise(TDP = sum(DP, na.rm = TRUE)) \%>\%
    arrange(desc(TDP)) \%>\%
    head(., 10)

# League average fielding statistics, 1961-present
Fielding \%>\% 
   filter(yearID >= 1961 & POS != "DH") \%>\%
   select(yearID, lgID, POS, InnOuts, PO, A, E) \%>\%
   group_by(yearID, lgID) \%>\%
   summarise_at(vars(InnOuts, PO, A, E), funs(sum), na.rm = TRUE) \%>\%
   mutate(fpct = round( (PO + A)/(PO + A + E), 3), 
          OPE = round(InnOuts/E, 3))


}
