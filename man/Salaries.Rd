\name{Salaries}
\alias{Salaries}
\docType{data}
\title{
Salaries table
}
\description{
Player salary data.  
}
\usage{data(Salaries)}
\format{
  A data frame with 23956 observations on the following 5 variables.
  \describe{
    \item{\code{yearID}}{Year}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor}
    \item{\code{playerID}}{Player ID code}
    \item{\code{salary}}{Salary}
  }
}
\details{
There is no real coverage of player's salaries until 1985.
}
\source{
Lahman, S. (2015) Lahman's Baseball Database, 1871-2014, 2015 version, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{
# what years are included?
summary(Salaries$yearID)
# how many players included each year?
table(Salaries$yearID)

# Team salary data

require(plyr)

# Total team salaries by league, team and year
teamSalaries <- ddply(Salaries, .(lgID, teamID, yearID), summarise,
                       Salary = sum(as.numeric(salary)))

# Arrange in decreasing order within year and league:
teamSalaries <- ddply(teamSalaries, .(yearID, lgID), arrange, desc(Salary))

#######################################
# Highest paid players each year:
maxSal <- ddply(Salaries, .(yearID), subset, salary == max(salary))
names <- apply(t(sapply(maxSal$playerID, playerInfo))[,2:3], 2, paste)
maxSal <- cbind(maxSal, names)
maxSal
plot(salary/100000 ~ yearID, data=maxSal, type='b', ylab='Salary (100,000$)')
# see the whole distribution
boxplot(salary/100000 ~ yearID, data=Salaries, col="lightblue")

# add salary to Batting data
batting <- merge(Batting, 
                 Salaries[,c("playerID", "yearID", "teamID", "salary")], 
                 by=c("playerID", "yearID", "teamID"), all.x=TRUE)
str(batting)

#######################################
# Average salaries by teams, over years
#######################################

require(plyr)
avesal <- ddply(Salaries, .(yearID, teamID, lgID), summarise, 
	salary= mean(salary)/100000)

# remove infrequent teams
tcount <- table(avesal$teamID)
avesal <- subset(avesal, avesal$teamID \%in\% names(tcount)[tcount>=15], drop=TRUE)
avesal$teamID <- factor(avesal$teamID, levels=names(tcount)[tcount>=15])

require(lattice)
xyplot(salary ~ yearID | teamID, data=avesal, ylab="Salary (100,000$)")

}

