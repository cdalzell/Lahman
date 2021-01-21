## Test environments
* local Windows 10 x64 install, R version 4.0.3 (2021-01-20)
* ubuntu 20.04, R version 4.0.3 (2021-01-20)
* win-builder, devel & release (2021-01-20)
* macOS 10.13.6 High Sierra, R-release, CRAN's setup (2021-01-20)

## R CMD check results
There were no ERRORs or WARNINGs. 

There was 1 NOTE; this is expected because Lahman is a large data package:  

> checking installed package size ... NOTE
>    installed size is  9.5Mb
>    sub-directories of 1Mb or more:
>      data   8.9Mb
>[All data files were compressed using the maximum known compression `tools::resaveRdaFiles(outdir, compress="xz", compression_level=9)`]

The intent of this data package is that it is only updated once per year (last published on June 8th, 2020)
with data updates for the previous year. The reason for the additional release is
that there was a data format incompatibility with dplyr that showed up and is causing
issues with their build process.

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
