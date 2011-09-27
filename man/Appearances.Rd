\name{Appearances}
\alias{Appearances}
\docType{data}
\title{
Appearances table
}
\description{
Data on player appearances
}

\usage{data(Appearances)}
\format{
  A data frame with 94157 observations on the following 20 variables.
  \describe{
    \item{\code{yearID}}{Year}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{playerID}}{Player ID code}
    \item{\code{career_year}}{Player ID code}
    \item{\code{G_all}}{Total games played}
    \item{\code{G_start}}{Games started}
    \item{\code{G_batting}}{Games in which player batted}
    \item{\code{G_defense}}{Games in which player appeared on defense}
    \item{\code{G_p}}{Games as pitcher}
    \item{\code{G_c}}{Games as catcher}
    \item{\code{G_1b}}{Games as firstbaseman}
    \item{\code{G_2b}}{Games as secondbaseman}
    \item{\code{G_3b}}{Games as thirdbaseman}
    \item{\code{G_ss}}{Games as shortstop}
    \item{\code{G_lf}}{Games as leftfielder}
    \item{\code{G_cf}}{Games as centerfielder}
    \item{\code{G_rf}}{Games as right fielder}
    \item{\code{G_of}}{Games as outfielder}
    \item{\code{G_dh}}{Games as designated hitter}
%    \item{\code{G_ph}}{Games as pinch hitter}
%    \item{\code{G_pr}}{Games as pinch runner}
  }
}
\details{
The Appearances table in the original version has some incorrect variable names.
In particular, the 5th column is \code{career_year}.
}
\source{
Lahman, S. (2010) Lahman's Baseball Database, 1871-2010, v.5.8, \url{http://baseball1.com/statistics/}
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\keyword{datasets}

\examples{
data(Appearances)

# some test cases
# Henry Aaron spent the last two years of his career as DH in Milwaukee
subset(Appearances, playerID == 'aaronha01')
# Herb Washington, strictly a pinch runner for Oakland in 1974-5
subset(Appearances, playerID == 'washihe01')
subset(Appearances, playerID == 'thomeji01')
subset(Appearances, playerID == 'hairsje02')

}

