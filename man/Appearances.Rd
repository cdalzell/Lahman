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
  A data frame with 99466 observations on the following 21 variables.
  \describe{
    \item{\code{yearID}}{Year}
    \item{\code{teamID}}{Team; a factor}
    \item{\code{lgID}}{League; a factor with levels \code{AA} \code{AL} \code{FL} \code{NL} \code{PL} \code{UA}}
    \item{\code{playerID}}{Player ID code}
    \item{\code{G_all}}{Total games played}
    \item{\code{GS}}{Games started}
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
    \item{\code{G_ph}}{Games as pinch hitter}
    \item{\code{G_pr}}{Games as pinch runner}
  }
}
\details{
The Appearances table in the original version has some incorrect variable names.
In particular, the 5th column is \code{career_year}.
}
\source{
Lahman, S. (2015) Lahman's Baseball Database, 1871-2014, 2015 version, \url{http://baseball1.com/statistics/}
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

# Appearances for the 1984 Cleveland Indians
subset(Appearances, teamID == "CLE" & yearID == 1984)


if (require(reshape2) & require(plyr)) {
# Appearances for Pete Rose during his career:
prose <- subset(Appearances, playerID == "rosepe01")


# What was Pete Rose's primary position each year 
# of his career?

prose_melt <- melt(prose, id = c("yearID", "teamID"),
                          measure = 9:17)
# Split out the position from variable
prose_melt <- cbind(prose_melt, colsplit(prose_melt$variable, 
                                         "_", names = c("G", "pos")))

# Two grouping variables because of an in-season trade in 1984
primary_pos <- ddply(prose_melt, .(yearID, teamID), summarise,
                         top_pos = pos[which.max(value)],
                         games = max(value))
primary_pos

# Most pitcher appearances each year since 1950
ddply(subset(Appearances, yearID >= 1950), .(yearID), summarise,
                              maxPitcher = playerID[which.max(G_p)],
                              maxAppear = max(G_p))

# Individuals who have played all 162 games since 1961
all162 <- ddply(subset(Appearances, yearID > 1960), .(yearID), summarise,
                      allGamers = playerID[G_all == 162])
# Number of all-gamers by year
table(all162$yearID)
}

}

