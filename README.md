Lahman <img src="hex/Lahman_hex.png" align="right" />
==========================================================



[![](http://www.r-pkg.org/badges/version/Lahman)](https://cran.r-project.org/package=Lahman) [![](http://cranlogs.r-pkg.org/badges/grand-total/Lahman)](https://cran.r-project.org/package=Lahman)
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

R Library for Sean Lahman's Baseball Database
========================================================

Version: 7.0-0
Date: 2019-03-27

Authors:

* Chris Dalzell
* Michael Friendly
* Dennis Murphy
* Martin Monkman
    
Maintainer: Chris Dalzell

Required: R (>= 2.10)

Suggests: lattice, ggplot2, googleVis, data.table, vcd, dplyr, tidyr, reshape2, zipcode

License: GPL

URL: http://lahman.r-forge.r-project.org/

This is an R version of the 2016 edition of Sean Lahman's Baseball Database,
http://www.seanlahman.com/baseball-archive/statistics/.  In addition, the documentation
has been updated to use `dplyr` for database manipulation and `ggplot2` for plots.

For testing purposes, the pre-CRAN release version can be installed in your R library via:

    library(devtools)
    install_github("cdalzell/Lahman", ref="develop")

If you wish to use a non-release version of `Lahman`, use `dev_mode()`.

    dev_mode()
    install_github("cdalzell/Lahman", ref="insert_branch_name_here")
    #  ...test ...
    dev_mode()  # revert to previous


Please report any problems or issues with this new version as an [issue](https://github.com/cdalzell/Lahman/issues) on this site.


