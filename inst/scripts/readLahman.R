# Script to read the Lahman data base .csv files & create Rdata files
library("archive")
source("D:/Dev/Projects/Lahman/inst/scripts/dataMapping.R")

# directory where the .csv files will be created
indir <- "D:/Dev/Projects/Lahman/source-data"

# directory where the .RData files will be created
outdir <- "D:/Dev/Projects/Lahman/data"

setwd(indir)

# local data location
dataFile <- "lahman_1871-2023_csv.7z"

# no need to download if we already have the file
if (!file.exists(dataFile)) {
  # dataset url obtained from http://www.seanlahman.com/
  zipfile <- "https://www.dropbox.com/scl/fi/hy0sxw6gaai7ghemrshi8/lahman_1871-2023_csv.7z?rlkey=edw1u63zzxg48gvpcmr3qpnhz&dl=1"
  download.file(zipfile, dataFile)
}

archive_extract(dataFile, dir=indir)

# Read the Lahman MLB .csv files and create .RData and .Rd files
indir <- paste0(indir, "/lahman_1871-2023_csv")
setwd(indir)

files <- list.files(indir, pattern="csv", full.names=TRUE)

for (i in 1:length(files)) {
	inp <- read.csv(file=files[i], header=TRUE, stringsAsFactors=FALSE, na.strings="", encoding="latin1")
	cat("Read:", files[i], "\trows: ", nrow(inp), " cols: ", ncol(inp), "\n")

	# make a few variables factors
	if("lgID" %in% names(inp)) inp$lgID <- factor(inp$lgID)
	if("teamID" %in% names(inp)) inp$teamID <- factor(inp$teamID)
	if("inducted" %in% names(inp)) inp$inducted <- factor(inp$inducted)
	if("category" %in% names(inp)) inp$category <- factor(inp$category)
	if("plyrMgr" %in% names(inp)) inp$plyrMgr <- factor(inp$plyrMgr)
	if("franchID" %in% names(inp)) inp$franchID <- factor(inp$franchID)
	if("lgIDwinner" %in% names(inp)) inp$lgIDwinner <- factor(inp$lgIDwinner)
	if("lgIDloser" %in% names(inp)) inp$lgIDloser <- factor(inp$lgIDloser)
	if("teamIDwinner" %in% names(inp)) inp$teamIDwinner <- factor(inp$teamIDwinner)
	if("teamIDloser" %in% names(inp)) inp$teamIDloser <- factor(inp$teamIDloser)

	name <- sub(".csv", "", basename(files[i]))
	assign(name, inp)
}

# HallOfFame uses both empty strings and "NA"
HallOfFame[HallOfFame == 'NA'] <- NA
hofNumCols <- c("ballots", "needed", "votes")
HallOfFame[hofNumCols] <- sapply(HallOfFame[hofNumCols], as.numeric)

# Date variables

# $ debut       : chr  "4/13/1954 0:00:00" "4/10/1962 0:00:00" "7/26/1977 0:00:00" "9/10/2001 0:00:00" ...
# $ finalGame   : chr  "10/3/1976 0:00:00" "9/26/1971 0:00:00" "10/3/1990 0:00:00" "4/13/2006 0:00:00" ...
 
##################
# Convert debut/finalGame from character to Date class
# The format in the as.Date() function is the 'informat', 
# in SASspeak; the output format is a calendar date in 
# yyyy-mm-dd format.
People <- within(People, {
#    debut = as.Date(debut, 
#                    format = '%m/%d/%Y %H:%M:%s',
#                    origin = '1970-01-01')
#    finalGame = as.Date(finalGame, 
#                        format = '%m/%d/%Y %H:%M:%s',
#                        origin = '1970-01-01')
   birthDate = as.Date(paste(birthYear, birthMonth, birthDay, sep = '-'),
                       format = '%Y-%m-%d')
   deathDate = as.Date(paste(deathYear, deathMonth, deathDay, sep = '-'),
                       format = '%Y-%m-%d')
   bats = factor(bats)
   throws = factor(throws)
})

# do some data remapping due to minor schema drift
Batting <- mapBatting(Batting)
HallOfFame <- mapHallOfFame(HallOfFame)
HomeGames <- mapHomeGames(HomeGames)
Parks <- mapParks(Parks)
People <- mapPeople(People)

setwd(outdir)

# compress mightily on save
#options(save.defaults=list(compress="xz", compression_level=9))

save(AllstarFull,         file="AllstarFull.RData", version = 3)        
save(Appearances,         file="Appearances.RData", version = 3)        
save(AwardsManagers,      file="AwardsManagers.RData", version = 3)     
save(AwardsPlayers,       file="AwardsPlayers.RData", version = 3)      
save(AwardsShareManagers, file="AwardsShareManagers.RData", version = 3)
save(AwardsSharePlayers,  file="AwardsSharePlayers.RData", version = 3) 
save(Batting,             file="Batting.RData", version = 3)
save(BattingPost,         file="BattingPost.RData", version = 3)
save(CollegePlaying,      file="CollegePlaying.RData", version = 3)
save(Fielding,            file="Fielding.RData", version = 3)
save(FieldingOF,          file="FieldingOF.RData", version = 3)
save(FieldingOFsplit,     file="FieldingOFsplit.RData", version = 3)
save(FieldingPost,        file="FieldingPost.RData", version = 3)
save(HallOfFame,          file="HallOfFame.RData", version = 3)
save(HomeGames,           file="HomeGames.RData", version = 3)
save(Managers,            file="Managers.RData", version = 3)
save(ManagersHalf,        file="ManagersHalf.RData", version = 3)
save(Parks,               file="Parks.RData", version = 3)
save(People,              file="People.RData", version = 3)
save(Pitching,            file="Pitching.RData", version = 3)
save(PitchingPost,        file="PitchingPost.RData", version = 3)
save(Salaries,            file="Salaries.RData", version = 3)
save(Schools,             file="Schools.RData", version = 3)
save(SeriesPost,          file="SeriesPost.RData", version = 3)
save(Teams,               file="Teams.RData", version = 3)
save(TeamsFranchises,     file="TeamsFranchises.RData", version = 3)
save(TeamsHalf,           file="TeamsHalf.RData", version = 3)

# version currently still defaults to 2 here
tools::resaveRdaFiles(outdir, compress="xz", compression_level=9, version = 3)

# only ran this once, since all .Rd files were extensively edited
# TODO: come up with a better way to automatically update Rd files with count/year/etc updates
if (FALSE) {
  promptData(Allstar,             filename="Allstar.Rd")            
  promptData(AllstarFull,         filename="AllstarFull.Rd")        
  promptData(Appearances,         filename="Appearances.Rd")        
  promptData(AwardsManagers,      filename="AwardsManagers.Rd")     
  promptData(AwardsPlayers,       filename="AwardsPlayers.Rd")      
  promptData(AwardsShareManagers, filename="AwardsShareManagers.Rd")
  promptData(AwardsSharePlayers,  filename="AwardsSharePlayers.Rd") 
  promptData(Batting,             filename="Batting.Rd")            
  promptData(BattingPost,         filename="BattingPost.Rd")
  promptData(CollegePlaying,      filename="CollegePlaying.Rd") 
  promptData(Fielding,            filename="Fielding.Rd")           
  promptData(FieldingOF,          filename="FieldingOF.Rd")         
  promptData(FieldingPost,        filename="FieldingPost.Rd")       
  promptData(HallOfFame,          filename="HallOfFame.Rd")         
  promptData(HOFold,              filename="HOFold.Rd")             
  promptData(Managers,            filename="Managers.Rd")           
  promptData(ManagersHalf,        filename="ManagersHalf.Rd")
  promptData(Pitching,            filename="Pitching.Rd")           
  promptData(PitchingPost,        filename="PitchingPost.Rd")       
  promptData(Salaries,            filename="Salaries.Rd")           
  promptData(Schools,             filename="Schools.Rd")
  promptData(SeriesPost,          filename="SeriesPost.Rd")         
  promptData(Teams,               filename="Teams.Rd")              
  promptData(TeamsFranchises,     filename="TeamsFranchises.Rd")    
  promptData(TeamsHalf,           filename="TeamsHalf.Rd")          
  promptData(Xref_Stats,          filename="Xref_Stats.Rd")         
}
