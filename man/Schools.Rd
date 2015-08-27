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
  A data frame with 749 observations on the following 5 variables.
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
Lahman, S. (2015) Lahman's Baseball Database, 1871-2014, 2015 version, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{

require(plyr)

# How many different schools are listed in each state?
table(Schools$state)
 
# How many different schools are listed in each country?
table(Schools$country)

# Top 20 schools 
schoolInfo <- Schools[, c("schoolID", "name_full", "city", "state")]

schoolCount <- ddply(CollegePlaying, .(schoolID), summarise,
                       players = length(schoolID))
schoolCount <- merge(schoolCount, schoolInfo, by="schoolID", all.x=TRUE)

# Arrange in decreasing order:
schoolCount <- arrange(schoolCount, desc(players))
head(schoolCount, 20)

# sum counts by state
schoolStates <- ddply(schoolCount, .(state), summarise,
                       players = sum(players),
                       schools = length(state))
str(schoolStates)
summary(schoolStates)

\dontrun{
if(require(zipcode)) {
  # in lieu of more precise geocoding via schoolName, 
  # find lat/long of Schools from zipcode file
  zips <- ddply(zipcode, .(city, state), summarize,
                latitude=mean(latitude), longitude=mean(longitude))
  colnames(zips)[1:2] <- c("city", "state")
  str(zips)

  # merge lat/long from zips
  schoolsXY <- merge(Schools, zips, by=c("city", "state"), all.x=TRUE)
  str(schoolsXY)

  # plot school locations
  with(subset(schoolsXY, schoolState != 'HI'),
    plot(jitter(longitude), jitter(latitude))
  )
}
}

}

\keyword{datasets}
