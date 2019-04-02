# check reverse dependencies

library(devtools)
rev_pkgs <- revdep("Lahman")

# [1] "baseballDBR"   "broom"         "dbplyr"        "dplyr"         "dtplyr"       
# [6] "implyr"        "mdsr"          "pinnacle.data" "poplite"       "raw"          
# [11] "sparklyr"      "teamcolors"   

# revdep_check() - deprecated