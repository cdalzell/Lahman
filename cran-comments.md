## Test environments
* local Windows 10 x64 install, R version 3.6.3 (2020-06-06)
* ubuntu 16.04 (on travis-ci), R version 3.6.2 (2020-06-06)
* win-builder, release (2020-06-06)

## R CMD check results
There were no ERRORs or WARNINGs  
There was one NOTE in Windows; this is expected because Lahman is a large data package:  

> checking installed package size ... NOTE  
>    installed size is  9.5Mb  
>    sub-directories of 1Mb or more:  
>      data   8.9Mb  
>[All data files were compressed using the maximum known compression `tools::resaveRdaFiles(outdir, compress="xz", compression_level=9)`]

This note did not occur under win-builder, R version 4.0.0.

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
