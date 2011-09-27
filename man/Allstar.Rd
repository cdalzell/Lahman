\name{Allstar}
\alias{Allstar}
\docType{data}
\title{
All-Star table
}
\description{
All-Star table: players who appeared in All-Star games
}
\usage{data(Allstar)}
\format{
  A data frame with 4475 observations on the following 3 variables.
  \describe{
    \item{\code{playerID}}{Player ID code}
    \item{\code{yearID}}{Year}
    \item{\code{lgID}}{League; a factor with levels \code{AL} \code{NL}}

  }
}
%\details{
%%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
Lahman, S. (2010) Lahman's Baseball Database, 1871-2010, v.5.8, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{

data(Allstar)

## Q: How many players from each league played in All Star games over time?

allstars <- as.data.frame(with(Allstar, table(yearID, lgID)))
# yearID is now a factor, so convert to numeric
allstars$yearID <- as.numeric(as.character(allstars$yearID))


# Same basic plot in two packages with user-defined options
library('lattice')
mykey <- list(corner = c(0, 1),
              title = 'League',
              cex.title = 1.2,
              text = list(c('American', 'National')),
              lines = list(col = c('blue', 'red'), lwd = 2))
xyplot(Freq ~ yearID, data = allstars, group = lgID, type = c('p', 'l'),
          lwd = 2, col = c('blue', 'red'), col.lines = c('blue', 'red'),
          pch = 16, xlab = 'Year', ylab = 'Number of players',
          key = mykey)

library('ggplot2')
ggplot(allstars, aes(x = yearID, y = Freq, colour = lgID)) +
    geom_point(size = 2.5) + geom_path(size = 1) +
    labs(x = 'Year', y = 'Number of players', colour = 'League') +
    scale_colour_manual(breaks = c('AL', 'NL'),
                        values = c('red', 'blue'),
                        labels = c('American', 'National')) +
    opts(legend.position = c(0.17, 0.88),
         legend.title = theme_text(size = 15, hjust = 0),
         legend.text = theme_text(size = 12))

## Three questions regarding this plot:
## (1) Why the temporary jump circa 1960?
## (2) Why is there a level change starting in about 1970?
## (3) Why has the number of players increased dramatically since 2000?

## The answer to (1) can be ascertained in the AllstarFull data frame.
## The other two questions cannot be answered with the data. (2) has to
## do with who votes in the All-Stars; what changed, and when? (3) has
## to do with how the All-Star game has changed in importance and how
## teams release their players to participate in the game.

}