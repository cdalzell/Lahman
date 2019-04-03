## Test environments
* local Windows 10 x64 install, R version 3.5.2 (2018-12-20)
* Win builder, R version 3.5.3 (2019-03-11)

## R CMD check results
There were no ERRORs or WARNINGs
There was one NOTE; this is expected because Lahman is a large data package:
> checking installed package size ... NOTE
    installed size is  9.0Mb
    sub-directories of 1Mb or more:
      data   8.4Mb
[All data files were compressed using `tools::resaveRdaFiles("data", compress="bzip2")`]

## Reverse dependencies

Lahman has reverse dependencies of the following packages:

library(devtools)
rev_pkgs <- revdep("Lahman")

# [1] "baseballDBR"   "broom"         "dbplyr"        "dplyr"         "dtplyr"       
# [6] "implyr"        "mdsr"          "pinnacle.data" "poplite"       "raw"          
# [11] "sparklyr"      "teamcolors"   

`revdepcheck::revdep_check()` reported all packages passed, except for `poplite` Version: 0.99.21
which failed for some reason unrelated to Lahman.

## Comments
This is a major release, bringing the Lahman R package up to the current 2018
version of the Lahman Database. A collection of vignettes has also been added.

