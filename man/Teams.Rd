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
  A data frame with 2775 observations on the following 48 variables.
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
Lahman, S. (2015) Lahman's Baseball Database, 1871-2014, 2015 version, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(Teams)

# subset on a few variables
teams <- subset(Teams, lgID \%in\% c("AL", "NL"))
teams <- subset(teams, yearID>1900)
# drop some variables
teams <- subset(teams, select=-c(Ghome,divID,DivWin:WSWin,name,park,teamIDBR:teamIDretro))
teams <- subset(teams, select=-c(HBP,CS,BPF,PPF))

# subset to remove infrequent teams
tcount <- table(teams$teamID)
teams <- subset(teams, teams$teamID \%in\% names(tcount)[tcount>15], drop=TRUE)
teams$teamID <- factor(teams$teamID, levels=names(tcount)[tcount>15])

# relevel lgID
teams$lgID <- factor(teams$lgID, levels= c("AL", "NL"))
# create new variables

teams <- within(teams, {
   WinPct = W / G    ## Winning percentage
   })

library(lattice)
xyplot(attendance/1000 ~ WinPct|yearID, groups=lgID, data=subset(teams, yearID>1980), 
	type=c("p", "r"), col=c("red","blue"))

\dontrun{
if(require(googleVis)) {
motion1 <- gvisMotionChart(teams, idvar='teamID', timevar='yearID',
	chartid="gvisTeams", options=list(width=700, height=600))
plot(motion1)
#print(motion1, file="gvisTeams.html")

#### merge with ave salary, for those years where salary is available

avesal <- aggregate(salary ~ yearID + teamID, data=Salaries, FUN=mean)

# salary data just starts after 1980
teamsSal <- subset(teams, yearID>=1980)

# add salary to team data
teamsSal <- merge(teamsSal, 
                 avesal[,c("yearID", "teamID", "salary")], 
                 by=c("yearID", "teamID"), all.x=TRUE)

motion2 <- gvisMotionChart(teamsSal, idvar='teamID', timevar='yearID',
  xvar="attendance", yvar="salary", sizevar="WinPct",
	chartid="gvisTeamsSal", options=list(width=700, height=600))
plot(motion2)
#print(motion2, file="gvisTeamsSal.html")

}
}
}

\keyword{datasets}
