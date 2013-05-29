## function for accessing variable labels

Label <- function(var, labels=rbind(battingLabels, pitchingLabels, fieldingLabels)) {
	wanted <- which(labels[,1]==var)
	if (length(wanted)) labels[wanted[1],2] else var
}
