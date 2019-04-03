\name{Parks}
\alias{Parks}
\docType{data}
\title{
Parks table
}
\description{
Name and location data for baseball stadiums. 

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
\details{
This dataset apparently includes all ballparks that were ever used in baseball. There is no
indication of the years they were used, nor the teams that played there.

The ballparks can be associated with teams through the \code{park} variable in the 
\code{\link{Teams}} table.
 
}
\seealso{\code{\link{Teams}}}
\source{
Lahman, S. (2019) Lahman's Baseball Database, 1871-2018, 2018 version, \url{http://www.seanlahman.com/baseball-archive/statistics/}
}
\examples{
data(Parks)
library(dplyr)
# how many parks in each country?
table(Parks$country)

# how many parks in each US state?
Parks \%>\% 
  filter(country=="US") \%>\% 
  count(state, sort=TRUE)

# ballparks in NYC
Parks \%>\% 
  filter(state=="NY") \%>\% 
  filter(city \%in\% c("New York", "Brooklyn", "Queens"))

# ballparks in Canada
Parks \%>\% 
  filter(country=="CA") \%>\% 
  count(state, sort=TRUE)

# what are the Canadian parks?
Parks \%>\% 
  dplyr::filter(country=="CA")
}

\keyword{datasets}
