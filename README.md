[![](http://www.r-pkg.org/badges/version/Lahman)](https://cran.r-project.org/package=Lahman) [![](http://cranlogs.r-pkg.org/badges/grand-total/Lahman)](https://cran.r-project.org/package=Lahman)

R Library for Sean Lahman's Baseball Database
========================================================

Version: 5.0-0
Date: 2016-08-08

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

This is an R, pre-CRAN-release version of the 2015 edition of Sean Lahman's Baseball Database,
http://www.seanlahman.com/baseball-archive/statistics/

For testing purposes, this version can be installed in your R library via

    library(devtools)
    install_github("cdalzell/Lahman", ref="feature/2015-data-update")

If you wish to preserve your original version of `Lahman_4.0-1`, use `dev_mode()`.

    dev_mode()
    install_github("cdalzell/Lahman", ref="feature/2015-data-update")
    #  ...test ...
    dev_mode()  # revert to previous


Please report any problems or issues with this new version as an issue on this site.


