## Test environments
* local Windows 10 x64 install, R version 4.0.3 (2021-01-11)
* win-builder, release (2021-01-11)

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs

## Reverse dependencies

Lahman has reverse dependencies of the following packages:

>library(devtools)
>rev_pkgs <- revdep("Lahman")
>
> [1] "baseballDBR"  "broom"  "dbplyr"  "dplyr"  "implyr"  "mdsr"  "pinnacle.data"  "poplite"  "raw"          
>[10] "sparklyr"     "teamcolors"`

`revdepcheck::revdep_check()` reported all packages passed,

*Wow, no problems at all. :)*

## Comments
This is a major release, bringing the Lahman R package up to the current 2019
version of the Lahman Database. A collection of vignettes has also been added.
