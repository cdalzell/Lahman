\name{Parks}
\alias{Parks}
\docType{data}
\title{
Parks table
}
\description{
Name and location data for baseball stadiums
}
\usage{data(Parks)}
\format{
  A data frame with 252 observations on the following 6 variables.
  \describe{
    \item{\code{park.key}}{unique identifier for each ballpark}
    \item{\code{park.name}}{the name of the ballpark}
    \item{\code{park.alias}}{a semicolon delimited list of other names for the ballpark if they exist}
    \item{\code{city}}{city where the ballpark is located}
    \item{\code{state}}{state where the ballpark is located}
    \item{\code{country}}{country where the ballpark is located}
  }
}
\source{
Lahman, S. (2019) Lahman's Baseball Database, 1871-2018, 2018 version, \url{http://www.seanlahman.com/baseball-archive/statistics/}
}
\examples{
data(Parks)
# how many parks in each state?
table(Parks$state)
}

\keyword{datasets}
