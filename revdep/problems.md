# poplite

Version: 0.99.21

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in 'tests/testthat.R' failed.
    Last 13 lines of output:
      
      x[24]: "NUMERIC"
      y[24]: "INTEGER"
      
      x[25]: "NUMERIC"
      y[25]: "INTEGER"
      
      == testthat results  ==========================================================================================================================
      OK: 156 SKIPPED: 0 FAILED: 1
      1. Failure: Create and work with TBSL and Database objects in a basic sense (@test-poplite.R#66) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

## In both

*   checking whether package 'poplite' can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package 'dplyr' was built under R version 3.5.3
      Warning: package 'DBI' was built under R version 3.5.3
    See 'C:/R/projects/Lahman/revdep/checks/poplite/new/poplite.Rcheck/00install.out' for details.
    ```

*   checking running R code from vignettes ...
    ```
       'poplite.Rnw' using 'UTF-8' ... failed
     WARNING
    Errors in running code in vignettes:
    when running code in 'poplite.Rnw'
      ...
    
    The following object is masked from 'package:base':
    
        strsplit
    
    
      When sourcing 'poplite.R':
    Error: package or namespace load failed for 'VariantAnnotation' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called 'GenomicFeatures'
    Execution halted
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    ...
    
    Loading required package: Rsamtools
    Loading required package: Biostrings
    Loading required package: XVector
    
    Attaching package: 'Biostrings'
    
    The following object is masked from 'package:DelayedArray':
    
        type
    
    The following object is masked from 'package:base':
    
        strsplit
    
    
    Error: processing vignette 'poplite.Rnw' failed with diagnostics:
     chunk 15 
    Error : package or namespace load failed for 'VariantAnnotation' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called 'GenomicFeatures'
    Execution halted
    ```

