\name{Appearances}
\alias{Appearances}
\docType{data}
\title{
Appearances table
}
\description{
Data on player appearances
}

\usage{data(Appearances)}
\format{
  A data frame with 105789 observations on the following 21 variables.
  \describe{
    \item{\code{yearID}}{Year}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{playerID}}{Player ID code}
    \item{\code{G_all}}{Total games played}
    \item{\code{GS}}{Games started}
    \item{\code{G_batting}}{Games in which player batted}
    \item{\code{G_defense}}{Games in which player appeared on defense}
    \item{\code{G_p}}{Games as pitcher}
    \item{\code{G_c}}{Games as catcher}
    \item{\code{G_1b}}{Games as firstbaseman}
    \item{\code{G_2b}}{Games as secondbaseman}
    \item{\code{G_3b}}{Games as thirdbaseman}
    \item{\code{G_ss}}{Games as shortstop}
    \item{\code{G_lf}}{Games as leftfielder}
    \item{\code{G_cf}}{Games as centerfielder}
    \item{\code{G_rf}}{Games as right fielder}
    \item{\code{G_of}}{Games as outfielder}
    \item{\code{G_dh}}{Games as designated hitter}
    \item{\code{G_ph}}{Games as pinch hitter}
    \item{\code{G_pr}}{Games as pinch runner}
  }
}
\details{
The Appearances table in the original version has some incorrect variable names.
In particular, the 5th column is \code{career_year}.
}
\source{
Lahman, S. (2019) Lahman's Baseball Database, 1871-2018, 2018 version, \url{http://www.seanlahman.com/baseball-archive/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{
data(Appearances)
library("dplyr")
library("tidyr")

# Henry Aaron's last two years as a DH in Milwaukee
Appearances \%>\%
   filter(playerID == "aaronha01" & teamID == "ML4") \%>\%
   select(yearID:G_batting, G_of:G_ph)  # subset variables
   
# Herb Washington, strictly a pinch runner for Oakland in 1974-5
Appearances \%>\%
   filter(playerID == "washihe01") 

# A true utility player - Jerry Hairston, Jr.
Appearances \%>\%
  filter(playerID == "hairsje02")

# Appearances for the 1984 Cleveland Indians
Appearances \%>\%
  filter(teamID == "CLE" & yearID == 1984)

# Pete Rose's primary position each year of his career
Appearances \%>\% 
   filter(playerID == "rosepe01") \%>\%
   group_by(yearID, teamID) \%>\%
   gather(pos, G, G_1b:G_rf) \%>\%
   filter(G == max(G)) \%>\%
   select(yearID:G_all, pos, G) \%>\%
   mutate(pos = substring(as.character(pos), 3, 4)) \%>\%
   arrange(yearID, teamID)


# Most pitcher appearances each year since 1950
Appearances \%>\%
   filter(yearID >= 1950) \%>\%
   group_by(yearID) \%>\%
   summarise(maxPitcher = playerID[which.max(G_p)],
             maxAppear = max(G_p))

# Individuals who have played all 162 games since 1961
all162 <- Appearances \%>\%
              filter(yearID > 1960 & G_all == 162) \%>\% 
              arrange(yearID, playerID) \%>\%
              select(yearID:G_all)
# Number of all-gamers by year (returns a vector)
table(all162$yearID)

# Players with most pinch hitting appearances in a year
Appearances \%>\%
  arrange(desc(G_ph)) \%>\%
  select(playerID, yearID, teamID, lgID, G_all, G_ph) \%>\%
  head(., 10)

# Players with most pinch hitting appearances, career
Appearances \%>\%
  group_by(playerID) \%>\%
  select(playerID, G_all, G_ph) \%>\%
  summarise(G = sum(G_all), PH = sum(G_ph)) \%>\%
  arrange(desc(PH)) \%>\%
  head(., 10)

# Players with most career appearances at each position
Appearances \%>\%
  select(playerID, G_c:G_rf) \%>\%
  rename(C = G_c, `1B` = G_1b, `2B` = G_2b, SS = G_ss,
         `3B` = G_3b, LF = G_lf, CF = G_cf, RF = G_rf) \%>\%
  gather(pos, G, C:RF) \%>\%
  group_by(pos, playerID) \%>\%
  summarise(G = sum(G)) \%>\%
  arrange(desc(G)) \%>\%
  do(head(., 1))
}

