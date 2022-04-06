## Test environments
* local Windows 10 x64 install, R version 4.1.3 (2022-03-10)
* ubuntu 20.04, R version 4.0.5 (2021-04-07)
* win-builder, R version 4.2.0 alpha (2022-03-29 r82022 ucrt)
* macOS 10.13.6 High Sierra, R-release, CRAN's setup (2021-04-07)

## R CMD check results
There were no ERRORs or WARNINGs or NOTEs on win-builder 

The local Windows check gave 1 NOTE; this is expected because Lahman is a large data package:  

> checking installed package size
>    installed size is  6.3Mb
>    sub-directories of 1Mb or more:
>      data   5.5Mb
>[All data files were compressed using the maximum known compression `tools::resaveRdaFiles(outdir, compress="xz", compression_level=9)`]

Added `LazyDataCompression: xz` to the DESCRPITION file, which should prevent this on CRAN

## Reverse dependencies

Lahman has reverse dependencies of the following packages:

> devtools::revdep("Lahman")
 [1] "baseballDBR"   "broom"         "dados"         "datos"         "dbplyr"        "dplyr"        
 [7] "ibawds"        "implyr"        "mdsr"          "pinnacle.data" "raw"           "sparklyr"     
[13] "teamcolors"   

## revdepcheck results

We checked 14 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages


## Comments
This is an annual release, updating the data tables to the 2021 baseball season.

