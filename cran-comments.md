## Test environments
* local Windows 10 x64 install, R version 4.0.3 (2021-01-11)
* ubuntu 20.04, R version 4.0.3 (2021-01-11)
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

## Comments
This is a minor release to resolve an incompatibility with dplyr that was causing
issues with automated checks in their development process.
