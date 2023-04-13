\name{Schools}
\alias{Schools}
\docType{data}
\title{
Schools table
}
\description{
Information on schools players attended, by school
}
\usage{data(Schools)}
\format{
  A data frame with 1207 observations on the following 5 variables.
  \describe{
    \item{\code{schoolID}}{school ID code}
    \item{\code{name_full}}{school name}
    \item{\code{city}}{city where school is located}
    \item{\code{state}}{state where school's city is located}
    \item{\code{country}}{country where school is located}
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

# How many different schools are listed in each state?
table(Schools$state)
 
# How many different schools are listed in each country?
table(Schools$country)

# Top 20 schools 
schoolInfo <- Schools \%>\% select(-country)

schoolCount <- CollegePlaying \%>\%
                 group_by(schoolID) \%>\%
                 summarise(players = length(schoolID)) \%>\%
                 left_join(schoolInfo, by = "schoolID") \%>\%
                 arrange(desc(players)) 
head(schoolCount, 20)

# sum counts by state
schoolStates <- schoolCount \%>\%
                  group_by(state) \%>\%
                  summarise(players = sum(players),
                            schools = length(state))
str(schoolStates)
summary(schoolStates)
}

\keyword{datasets}
