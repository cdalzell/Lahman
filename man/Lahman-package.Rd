\name{Lahman-package}
\alias{Lahman-package}
\alias{Lahman}
\docType{package}
\title{
Sean Lahman's Baseball Database
}
\description{
This database contains pitching, hitting, and fielding statistics for
Major League Baseball from 1871 through 2012.  It includes data from
the two current leagues (American and National), the four other "major" 
leagues (American Association, Union Association, Players League, and
Federal League), and the National Association of 1871-1875. 

This database was created by Sean Lahman, who pioneered the effort to
make baseball statistics freely available to the general public. What
started as a one man effort in 1994 has grown tremendously, and now a
team of researchers have collected their efforts to make this the
largest and most accurate source for baseball statistics available
anywhere. 

This database, in the form of an R package offers a variety of interesting
challenges and opportunities for data processing and visualization in R.
}

\details{

\tabular{ll}{
Package: \tab Lahman\cr
Type: \tab Package\cr
Version: \tab 2.0-3\cr
Date: \tab 2013-05-29\cr
License: \tab GPL version 2 or newer\cr
LazyLoad: \tab yes\cr
LazyData: \tab yes\cr
}

The main form of this database is a relational database in Microsoft Access format.
The design follows these general principles.  Each player is assigned a
unique code (\code{playerID}).  All of the information in different tables relating to that player
is tagged with his \code{playerID}.  The \code{playerID}s are linked to names and 
birthdates in the \code{\link{Master}} table.  Similar links exist among other tables
via analogous \code{*ID} variables.

The database is comprised of the following main tables:

\describe{
	\item{\code{\link{Master}}}{Player names, dates of birth, death and other biographical info}
	\item{\code{\link{Batting}}}{batting statistics}
	\item{\code{\link{Pitching}}}{pitching statistics}
	\item{\code{\link{Fielding}}}{fielding statistics}
%	\item{\code{\link{Teams}}}{yearly team statistics and standings}
  }


A collection of other tables is also provided:

Teams:

\tabular{rl}{
  \code{\link{Teams}} \tab yearly stats and standings\cr
  \code{\link{TeamsHalf}} \tab split season data for teams\cr
  \code{\link{TeamsFranchises}} \tab franchise information\cr
}

Post-season play:

\tabular{rl}{
  \code{\link{BattingPost}} \tab post-season batting statistics\cr
  \code{\link{PitchingPost}} \tab post-season pitching statistics\cr
  \code{\link{FieldingPost}}\tab post-season fielding data\cr
  \code{\link{SeriesPost}} \tab post-season series information\cr
}

Awards:

\tabular{rl}{
  \code{\link{AwardsManagers}} \tab awards won by managers\cr
  \code{\link{AwardsPlayers}} \tab awards won by players\cr
  \code{\link{AwardsShareManagers}} \tab award voting for manager awards\cr
  \code{\link{AwardsSharePlayers}} \tab award voting for player awards\cr
}

Hall of Fame:  links to Master via \code{hofID}

\tabular{rl}{
  \code{\link{HallOfFame}} \tab Hall of Fame voting data\cr
}


Others tables:

%\preformatted{
  \code{\link{AllstarFull}} - All-Star games appearances;
  \code{\link{Managers}} - managerial statistics;
  \code{\link{FieldingOF}} - outfield position data;
  \code{\link{ManagersHalf}} - split season data for managers;
  \code{\link{Salaries}} - player salary data;
  \code{\link{Appearances}} - data on player appearances;
  \code{\link{Schools}} - Information on schools players attended;
  \code{\link{CollegePlaying}} - Information on schools players attended, by player and year;
%}

Variable label tables are provided for some of the tables:

\code{\link{battingLabels}},
\code{\link{pitchingLabels}},
\code{\link{fieldingLabels}}

}

\author{
Michael Friendly and Dennis Murphy

Maintainer: Michael Friendly <friendly@yorku.ca>
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\source{
Lahman, S. (2012) Lahman's Baseball Database, 1871-2012, Main page, \url{http://baseball1.com/statistics/}

Lahman, S. (2012) Lahman's Baseball Database, 1871-2012, v. 2012, Comma-delimited version,
\url{http://seanlahman.com/files/database/lahman2012-csv.zip}

Lahman, S. (2012) Lahman's Baseball Database, 1871-2012, MS Access version,
\url{http://seanlahman.com/files/database/lahman2012-ms.zip}

}
