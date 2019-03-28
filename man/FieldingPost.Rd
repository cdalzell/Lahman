\name{FieldingPost}
\alias{FieldingPost}
\docType{data}
\title{
FieldingPost data
}
\description{
Post season fielding data
}
\usage{data(FieldingPost)}
\format{
  A data frame with 13534 observations on the following 17 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{NL}}
    \item{\code{round}}{Level of playoffs }
    \item{\code{POS}}{Position}
    \item{\code{G}}{Games }
    \item{\code{GS}}{Games Started}
    \item{\code{InnOuts}}{Time played in the field expressed as outs }
    \item{\code{PO}}{Putouts}
    \item{\code{A}}{Assists}
    \item{\code{E}}{Errors}
    \item{\code{DP}}{Double Plays}
    \item{\code{TP}}{Triple Plays}
    \item{\code{PB}}{Passed Balls}
    \item{\code{SB}}{Stolen Bases allowed (by catcher)}
    \item{\code{CS}}{Caught Stealing (by catcher)}
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
require("dplyr")

## World Series fielding record for Yogi Berra
FieldingPost \%>\%
  filter(playerID == "berrayo01" & round == "WS")

## Yogi's career efficiency in throwing out base stealers 
## in his WS appearances and CS as a percentage of his 
## overall assists
FieldingPost \%>\%
  filter(playerID == "berrayo01" & round == "WS" & POS == "C") \%>\%
  summarise(cs_pct = round(100 * sum(CS)/sum(SB + CS), 2),
            cs_assists = round(100 * sum(CS)/sum(A), 2))

## Innings per error for several selected shortstops in the WS
FieldingPost \%>\%
  filter(playerID \%in\% c("belanma01", "jeterde01", "campabe01",
                         "conceda01", "bowala01"), round == "WS") \%>\%
  group_by(playerID) \%>\%
  summarise(G = sum(G),
            InnOuts = sum(InnOuts),
            Eper9 = round(27 * sum(E)/sum(InnOuts), 3))


## Top 10 center fielders in innings played in the WS
FieldingPost \%>\%
  filter(POS == "CF" & round == "WS") \%>\%
  group_by(playerID) \%>\%
  summarise(inn_total = sum(InnOuts)) \%>\%
  arrange(desc(inn_total)) \%>\%
  head(., 10)

## Most total chances by position
FieldingPost \%>\%
  filter(round == "WS" & !(POS \%in\% c("DH", "OF", "P"))) \%>\%
  group_by(POS, playerID) \%>\%
  summarise(TC = sum(PO + A + E)) \%>\%
  arrange(desc(TC)) \%>\%
  do(head(., 1))    # provides top player by position

}
\keyword{datasets}
