# Fix data files where the fields don't match the docs

# Batting
# Fields in Batting.csv
#   playerID,yearID,stint,teamID,lgID,G,AB,R,H,2B,3B,HR,RBI,SB,CS,BB,SO,IBB,HBP,SH,SF,GIDP

# > names(Batting)
# [1] "playerID"  "yearID"    "stint"     "teamID"    "lgID"      "G"         "G_batting" "AB"        "R"        
# [10] "H"         "X2B"       "X3B"       "HR"        "RBI"       "SB"        "CS"        "BB"        "SO"       
# [19] "IBB"       "HBP"       "SH"        "SF"        "GIDP"      "G_old"

# R check warning:
# checking for code/documentation mismatches (1.5s)
# Data codoc mismatches from documentation object 'Batting':
#   Variables in data frame 'Batting'
# Code: AB BB CS G GIDP G_batting G_old H HBP HR IBB R RBI SB SF SH SO
# X2B X3B lgID playerID stint teamID yearID
# Docs: AB BB CS G GIDP H HBP HR IBB R RBI SB SF SH SO X2B X3B lgID
# playerID stint teamID yearID

# check what's in the pkg in 2024-update branch
data(Batting, package ="Lahman")
names(Batting)
nrow(Batting)

# > names(Batting)
# [1] "playerID"  "yearID"    "stint"     "teamID"    "lgID"      "G"         "G_batting" "AB"        "R"        
# [10] "H"         "X2B"       "X3B"       "HR"        "RBI"       "SB"        "CS"        "BB"        "SO"       
# [19] "IBB"       "HBP"       "SH"        "SF"        "GIDP"      "G_old"    
# > nrow(Batting)
# [1] 113799


library(readr)
Batting <- read_csv(here::here("source-data", "baseballdatabank-master/core/Batting.csv"))
names(Batting)
nrow(Batting)

# > names(Batting)
# [1] "playerID" "yearID"   "stint"    "teamID"   "lgID"     "G"        "AB"       "R"        "H"        "2B"      
# [11] "3B"       "HR"       "RBI"      "SB"       "CS"       "BB"       "SO"       "IBB"      "HBP"      "SH"      
# [21] "SF"       "GIDP"    
# > nrow(Batting)
# [1] 107429

