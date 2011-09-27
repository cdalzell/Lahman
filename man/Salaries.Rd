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
  A data frame with 21464 observations on the following 5 variables.
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
Lahman, S. (2010) Lahman's Baseball Database, 1871-2010, v.5.8, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{
# what years are included?
summary(Salaries$year)
# how many players included each year?
table(Salaries$year)

# add salary to Batting data
batting <- merge(Batting, 
                 Salaries[,c("playerID", "yearID", "teamID", "salary")], 
                 by=c("playerID", "yearID", "teamID"), all.x=TRUE)
str(batting)
}

