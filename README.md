[![](http://www.r-pkg.org/badges/version/Lahman)](http://cran.r-project.org/web/packages/Lahman) [![](http://cranlogs.r-pkg.org/badges/grand-total/Lahman)](http://cran.rstudio.com/web/packages/Lahman/index.html)

R Library for Sean Lahman's Baseball Database
========================================================

Version: 4.0-0
Date: 2015-09-04

Authors:

* Chris Dalzell
* Michael Friendly
* Dennis Murphy
* Martin Monkman
    
Maintainer: Chris Dalzell

Required: R (>= 2.10)

Suggests: lattice, ggplot2, googleVis, data.table, vcd, plyr, reshape2, zipcode

License: GPL

URL: http://lahman.r-forge.r-project.org/

This is an R, pre-CRAN-release version of the 2014 edition of Sean Lahman's Baseball Database,
http://www.seanlahman.com/baseball-archive/statistics/

For testing purposes, this version can be installed in your R library via

    library(devtools)
    install_github("cdalzell/Lahman", ref="feature/v4.0-0")

If you wish to preserve your original version of `Lahman_3.0-1`, use `dev_mode()`.

    dev_mode()
    install_github("cdalzell/Lahman", ref="feature/v4.0-0")
    #  ...test ...
    dev_mode()  # revert to previous


Please report any problems or issues with this new version as an issue on this site.


