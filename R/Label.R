## function for accessing variable labels
#' @export
Label <- function(var, labels=rbind(Lahman::battingLabels, Lahman::pitchingLabels, Lahman::fieldingLabels)) {
	wanted <- which(labels[,1]==var)
	if (length(wanted)) labels[wanted[1],2] else var
}
