# check reverse dependencies

library(devtools)
rev_pkgs <- revdep("Lahman")

# > rev_pkgs
# [1] "baseballDBR"   "broom"         "dados"         "datos"         "dbplyr"        "dplyr"         "ibawds"        "implyr"       
# [9] "mdsr"          "pinnacle.data" "raw"           "sparklyr"      "teamcolors"  

# devtools::revdep_check() - deprecated

# see: https://github.com/r-lib/revdepcheck

#source("https://install-github.me/r-lib/revdepcheck")
revdepcheck::revdep_check()

# or maybe
usethis::use_revdep()
