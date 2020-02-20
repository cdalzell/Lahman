# check reverse dependencies

library(devtools)
rev_pkgs <- revdep("Lahman")

# [1] "baseballDBR"   "broom"         "dbplyr"        "dplyr"         "dtplyr"       
# [6] "implyr"        "mdsr"          "pinnacle.data" "poplite"       "raw"          
# [11] "sparklyr"      "teamcolors"   

# devtools::revdep_check() - deprecated

# see: https://github.com/r-lib/revdepcheck

source("https://install-github.me/r-lib/revdepcheck")
revdepcheck::revdep_check()

# or maybe
usethis::use_revdep()
