\name{Teams}
\alias{Teams}
\docType{data}
\title{
Teams table
}
\description{
Yearly statistics and standings for teams
}
\usage{data(Teams)}
\format{
  A data frame with 2895 observations on the following 48 variables.
  \describe{
    \item{\code{yearID}}{Year}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{franchID}}{Franchise (links to \code{\link{TeamsFranchises}} table)}
    \item{\code{divID}}{Team's division; a factor with levels \code{} \code{C} \code{E} \code{W}}
    \item{\code{Rank}}{Position in final standings}
    \item{\code{G}}{Games played}
    \item{\code{Ghome}}{Games played at home}
    \item{\code{W}}{Wins}
    \item{\code{L}}{Losses}
    \item{\code{DivWin}}{Division Winner (Y or N)}
    \item{\code{WCWin}}{Wild Card Winner (Y or N)}
    \item{\code{LgWin}}{League Champion(Y or N)}
    \item{\code{WSWin}}{World Series Winner (Y or N)}
    \item{\code{R}}{Runs scored}
    \item{\code{AB}}{At bats}
    \item{\code{H}}{Hits by batters}
    \item{\code{X2B}}{Doubles}
    \item{\code{X3B}}{Triples}
    \item{\code{HR}}{Homeruns by batters}
    \item{\code{BB}}{Walks by batters}
    \item{\code{SO}}{Strikeouts by batters}
    \item{\code{SB}}{Stolen bases}
    \item{\code{CS}}{Caught stealing}
    \item{\code{HBP}}{Batters hit by pitch}
    \item{\code{SF}}{Sacrifice flies}
    \item{\code{RA}}{Opponents runs scored}
    \item{\code{ER}}{Earned runs allowed}
    \item{\code{ERA}}{Earned run average}
    \item{\code{CG}}{Complete games}
    \item{\code{SHO}}{Shutouts}
    \item{\code{SV}}{Saves}
    \item{\code{IPouts}}{Outs Pitched (innings pitched x 3)}
    \item{\code{HA}}{Hits allowed}
    \item{\code{HRA}}{Homeruns allowed}
    \item{\code{BBA}}{Walks allowed}
    \item{\code{SOA}}{Strikeouts by pitchers}
    \item{\code{E}}{Errors}
    \item{\code{DP}}{Double Plays}
    \item{\code{FP}}{Fielding  percentage}
    \item{\code{name}}{Team's full name}
    \item{\code{park}}{Name of team's home ballpark}
    \item{\code{attendance}}{Home attendance total}
    \item{\code{BPF}}{Three-year park factor for batters}
    \item{\code{PPF}}{Three-year park factor for pitchers}
    \item{\code{teamIDBR}}{Team ID used by Baseball Reference website}
    \item{\code{teamIDlahman45}}{Team ID used in Lahman database version 4.5}
    \item{\code{teamIDretro}}{Team ID used by Retrosheet}

  }
}
\details{
Variables \code{X2B} and \code{X3B} are named \code{2B} and \code{3B} in the original database
}
\source{
Lahman, S. (2019) Lahman's Baseball Database, 1871-2018, 2018 version, \url{http://www.seanlahman.com/baseball-archive/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(Teams)
library("dplyr")
library("tidyr")

# Add some selected measures to the Teams data frame
# Restrict to AL and NL in modern era
teams <- Teams \%>\% 
  filter(yearID >= 1901 & lgID \%in\% c("AL", "NL")) \%>\%
  group_by(yearID, teamID) \%>\%
  mutate(TB = H + X2B + 2 * X3B + 3 * HR,
         WinPct = W/G,
         rpg = R/G,
         hrpg = HR/G,
         tbpg = TB/G,
         kpg = SO/G,
         k2bb = SO/BB,
         whip = 3 * (H + BB)/IPouts)

# Function to create a ggplot by year for selected team stats
# Both arguments are character strings
yrPlot <- function(yvar, label)
{
    require("ggplot2")
    ggplot(teams, aes_string(x = "yearID", y = yvar)) +
       geom_point(size = 0.5) +
       geom_smooth(method="loess") +
       labs(x = "Year", y = paste(label, "per game"))
}

## Run scoring in the modern era by year
yrPlot("rpg", "Runs")

## Home runs per game by year
yrPlot("hrpg", "Home runs")

## Total bases per game by year
yrPlot("tbpg", "Total bases")

## Strikeouts per game by year
yrPlot("kpg", "Strikeouts")

## Plot win percentage vs. run differential (R - RA)
ggplot(teams, aes(x = R - RA, y = WinPct)) +
   geom_point(size = 0.5) +
   geom_smooth(method="loess") + 
   geom_hline(yintercept = 0.5, color = "orange") +
   geom_vline(xintercept = 0, color = "orange") +
   labs(x = "Run differential", y = "Win percentage")

## Plot attendance vs. win percentage by league, post-1980
teams \%>\%  filter(yearID >= 1980) \%>\%
ggplot(., aes(x = WinPct, y = attendance/1000)) +
   geom_point(size = 0.5) +
   geom_smooth(method="loess", se = FALSE) +
   facet_wrap(~ lgID) +
   labs(x = "Win percentage", y = "Attendance (1000s)")

## Teams with over 4 million attendance in a season
teams \%>\% 
  filter(attendance >= 4e6) \%>\%
  select(yearID, lgID, teamID, Rank, attendance) \%>\%
  arrange(desc(attendance))

## Average season HRs by park, post-1980
teams \%>\% 
   filter(yearID >= 1980) \%>\%
   group_by(park) \%>\%
     summarise(meanHRpg = mean((HR + HRA)/Ghome), nyears = n()) \%>\%
     filter(nyears >= 10) \%>\%
     arrange(desc(meanHRpg)) \%>\%
     head(., 10)

## Home runs per game at Fenway Park and Wrigley Field,
## the two oldest MLB parks, by year. Fenway opened in 1912.
teams \%>\% 
  filter(yearID >= 1912 & teamID \%in\% c("BOS", "CHN")) \%>\%
  mutate(hrpg = (HR + HRA)/Ghome) \%>\%
  ggplot(., aes(x = yearID, y = hrpg, color = teamID)) +
    geom_line(size = 1) +
    geom_point() +
    labs(x = "Year", y = "Home runs per game", color = "Team") +
    scale_color_manual(values = c("red", "blue"))

## Ditto for total strikeouts per game
teams \%>\% 
  filter(yearID >= 1912 & teamID \%in\% c("BOS", "CHN")) \%>\%
  mutate(kpg = (SO + SOA)/Ghome) \%>\%
  ggplot(., aes(x = yearID, y = kpg, color = teamID)) +
  geom_line(size = 1) +
  geom_point() +
  labs(x = "Year", y = "Strikeouts per game", color = "Team") +
  scale_color_manual(values = c("red", "blue"))  


\dontrun{
if(require(googleVis)) {
motion1 <- gvisMotionChart(as.data.frame(teams), 
             idvar="teamID", timevar="yearID", chartid="gvisTeams",
	           options=list(width=700, height=600))
plot(motion1)
#print(motion1, file="gvisTeams.html")

# Merge with avg salary for years where salary is available

teamsal <- Salaries \%>\%
                group_by(yearID, teamID) \%>\%
                summarise(Salary = sum(salary, na.rm = TRUE)) \%>\%
                select(yearID, teamID, Salary)

teamsSal <- teams \%>\%
                filter(yearID >= 1985) \%>\%
                left_join(teamsal, by = c("yearID", "teamID")) \%>\%
                select(yearID, teamID, attendance, Salary, WinPct) \%>\%
                as.data.frame(.)

motion2 <- gvisMotionChart(teamsSal, idvar="teamID", timevar="yearID",
  xvar="attendance", yvar="salary", sizevar="WinPct",
	chartid="gvisTeamsSal", options=list(width=700, height=600))
plot(motion2)
#print(motion2, file="gvisTeamsSal.html")

}
}
}

\keyword{datasets}
