# lookup functions for players and teams

playerInfo <- function(playerID, nameFirst, nameLast, data=Lahman::Master, extra=NULL, ...) {
	wanted <- NULL
	if(!missing(playerID)) wanted <- c(wanted, grep(playerID, data$playerID, ...))
	if(!missing(nameFirst)) wanted <- c(wanted, grep(nameFirst, data$nameFirst, ...))
	if(!missing(nameLast)) wanted <- c(wanted, grep(nameLast, data$nameLast, ...))
	data[unique(wanted), c("playerID", "nameFirst", "nameLast", extra)]
}

teamInfo <- function(teamID, name, data=Lahman::Teams, extra=NULL, ...) {
	wanted <- NULL
	if(!missing(teamID)) wanted <- c(wanted, grep(teamID, data$teamID, ...))
	if(!missing(name)) wanted <- c(wanted, grep(name, data$name, ...))
	res <- data[unique(wanted), c("teamID", "name", extra)]
	res[!duplicated(res$teamID),]
}
