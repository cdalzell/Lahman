\name{FieldingOF}
\alias{FieldingOF}
\docType{data}
\title{
FieldingOF table
}
\description{
Outfield position data: information about positions played in the outfield
}
\usage{data(FieldingOF)}
\format{
  A data frame with 12028 observations on the following 6 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year}
    \item{\code{stint}}{player's stint (order of appearances within a season)}
    \item{\code{Glf}}{Games played in left field}
    \item{\code{Gcf}}{Games played in center field}
    \item{\code{Grf}}{Games played in right field}
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
require("tidyr")

## Data set only goes through 1955
## Can get a more complete record from the Fielding data frame
## or from the Appearances data (see below)

## Output directly from the FieldingOF data

## Barry Bonds (no records: post-1955 player)
FieldingOF \%>\% 
   filter(playerID == "bondsba01") 

## Willie Mays (first few years)
FieldingOF \%>\% 
  filter(playerID == "mayswi01") 

## Ty Cobb (complete)
FieldingOF \%>\% 
  filter(playerID == "cobbty01") 

## One way to get OF game information from the Fielding data
## Note: OF games != sum(LF, CF, RF) because players can switch
## OF positions within a game. Players can also switch from
## other positions to outfield during a game. OF represents
## the number of games a player started in the outfield.
Fielding \%>\%
   select(playerID, yearID, stint, POS, G) \%>\%
   filter(POS \%in\% c("LF", "CF", "RF", "OF")) \%>\%
   tidyr::spread(POS, G, fill = 0) \%>\%
   filter(playerID == "trumbma01")

## Another way is through the Appearances data (no stint).
## Provides a somewhat nicer table than the above.

## Mark Trumbo (active player)
Appearances \%>\%
   select(playerID, yearID, G_lf, G_cf, G_rf, G_of) \%>\%
   filter(playerID == "trumbma01")

## A slightly better format, perhaps
Appearances \%>\%
  select(playerID, yearID, G_lf, G_cf, G_rf, G_of) \%>\%
  rename(LF = G_lf, CF = G_cf, RF = G_rf, OF = G_of) \%>\%
  filter(playerID == "trumbma01")

## Willie Mays (1951-1973)
Appearances \%>\%
  select(playerID, yearID, G_lf, G_cf, G_rf, G_of) \%>\%
  filter(playerID == "mayswi01")

## Joe DiMaggio (1936-1951)
Appearances \%>\%
  select(playerID, yearID, G_lf, G_cf, G_rf, G_of) \%>\%
  filter(playerID == "dimagjo01")

}
\keyword{datasets}
