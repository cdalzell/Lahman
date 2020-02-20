\name{playerInfo}
\alias{playerInfo}
\alias{teamInfo}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Lookup Information for Players and Teams
}
\description{
These functions use \code{grep} to lookup information about players
(from the \code{\link{People}} file)
and teams (from the \code{\link{Teams}} file).
}
\usage{

playerInfo(playerID, nameFirst, nameLast, data = Lahman::People, extra = NULL, ...)

teamInfo(teamID, name, data = Lahman::Teams, extra = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{playerID}{
pattern for \code{playerID}
}
  \item{nameFirst}{
pattern for first name
}
  \item{nameLast}{
pattern for last name
}
  \item{data}{
The name of the dataset to search
}
  \item{extra}{
A character vector of other fields to include in the result
}
  \item{\dots}{
other arguments passed to \code{\link[base]{grep}}
}

  \item{teamID}{
pattern for \code{teamID} 
}
  \item{name}{
pattern for team name
}
}
%\details{
%%%  ~~ If necessary, more details than the description above ~~
%}
\value{
Returns a data frame for unique matching rows from \code{data}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
%\references{
%%% ~put references to the literature/web site here ~
%}
\author{
Michael Friendly
}
%\note{
%%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{\link[base]{grep}}, ~~~
}
\examples{
	playerInfo("aaron")

  teamInfo("CH", extra="park")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
