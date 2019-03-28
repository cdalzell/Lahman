\name{TeamsFranchises}
\alias{TeamsFranchises}
\docType{data}
\title{
TeamFranchises table
}
\description{
Information about team franchises
}
\usage{data(TeamsFranchises)}
\format{
  A data frame with 120 observations on the following 4 variables.
  \describe{
    \item{\code{franchID}}{Franchise ID; a factor}
    \item{\code{franchName}}{Franchise name}
    \item{\code{active}}{Whether team is currently active (Y or N)}
    \item{\code{NAassoc}}{ID of National Association team franchise played as}
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
data(TeamsFranchises)

# Which of the active Major League Baseball teams had a National Association predecessor?

# Notes: 
# - the National Association was founded in 1871, and continued through the
# 1875 season. In 1876, six clubs from the National Association and two other
# independent clubs formed the National League, which exists to this day.
# - the `active` field has "NA" for the National Association franchises
# - where appropriate, the `NAassoc` field has the `franchID` of the successor National League team

# using the dplyr data manipulation package
library("dplyr")

NatAssoc_active_table <- TeamsFranchises \%>\%
  filter(active == "Y") \%>\%
  filter(!is.na(NAassoc))
NatAssoc_active_table

# Merge current team IDs with franchise IDs
currentTeams <- Teams \%>\% 
                  filter(yearID == 2014) \%>\%
                  select(teamID, franchID, lgID, park)

# Merge TeamsFranchises with currentTeams
TeamsFranchises \%>\%
    filter(active == "Y") \%>\%
    select(-active, -NAassoc) \%>\%
    left_join(currentTeams, by = "franchID")
}

\keyword{datasets}
