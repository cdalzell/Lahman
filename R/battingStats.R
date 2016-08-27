# The function battingStats() calculates the following
# statistics for each line of a player's career as a hitter:

#   * batting average (BA)
#   * plate appearances (PA)
#   * total bases (TB)
#   * slugging percentage (SlugPct)
#   * on-base percentage (OBP)
#   * on-base percentage + slugging (OPS)
#   * batting average on balls in play (BABIP)
#

#' @export
battingStats <- function(data=Lahman::Batting, 
	idvars=c("playerID","yearID","stint","teamID","lgID"),
	cbind=TRUE) {
#    require('plyr')
    NA2zero <- function(x) {
    # Takes a column vector and replaces NAs by zeros
        x[is.na(x)] <- 0
        x
      }
	# keep R CMD check happy
	AB <- R <- H <- X2B <- X3B <- HR <- RBI <- SH <- BB <- HBP <- SF <- TB <- PA <- OBP <- SlugPct <- SO <- NA
	#   standard batting variables
    vars <- c('AB', 'R', 'H', 'X2B', 'X3B',
              'HR', 'RBI', 'SB', 'CS', 'BB', 'SO', 'IBB', 'HBP',
              'SH', 'SF', 'GIDP')
    d2 <- apply(data[, vars], 2, NA2zero)
    d2 <- if(is.vector(d2)) {as.data.frame(as.list(d2)) } else {
                as.data.frame(d2) }
    d2 <- dplyr::mutate(d2,
      BA = ifelse(AB > 0, round(H/AB, 3), NA),
      PA = AB + BB + HBP + SH + SF,
      TB = H + X2B + 2 * X3B + 3 * HR,
      SlugPct = ifelse(AB > 0, round(TB/AB, 3), NA),
	  OBP = ifelse(PA > 0,
			  round((H + BB + HBP)/(PA - SH), 3), NA),
	  OPS = round(OBP + SlugPct, 3),
	  BABIP = ifelse(AB > 0, round((H - HR)/(AB - SO - HR + SF), 3), NA)
	  )
    d2 <- d2[, (length(vars)+1):ncol(d2)]
    if (cbind) data.frame(data, d2) else data.frame(data[,idvars], d2)
}

