Lahman <img src="inst/hex/Lahman_hex.png" align="right" />
==========================================================

[![](https://www.r-pkg.org/badges/version/Lahman)](https://cran.r-project.org/package=Lahman) [![](https://cranlogs.r-pkg.org/badges/grand-total/Lahman)](https://cran.r-project.org/package=Lahman)
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

R Library for Sean Lahman's Baseball Database
========================================================

Version: 7.0-1  
Date: 2019-05-01

Authors:

* Chris Dalzell
* Michael Friendly
* Dennis Murphy
* Martin Monkman
* Vanessa Foot & Justeena Zaki-Azat [vignettes]
    
Maintainer: Chris Dalzell

Required: R (>= 2.10)

Suggests: lattice, ggplot2, googleVis, data.table, vcd, dplyr, tidyr, reshape2, zipcode

License: GPL

URL: http://lahman.r-forge.r-project.org/

## This version

This is the R version of the 2019 edition of Sean Lahman's Baseball Database, http://www.seanlahman.com/baseball-archive/statistics/.

* A notable change is that the old `Master` table, has been renamed `People` in the
Lahman Database. To avoid breaking old scripts or examples, the `People` table
has been copied to `Master`. In the next annual release, it is likely that `Master`
will be removed.

* A collection of vignettes has been added, illustrating various data manipulation
tasks and analyses to explore some baseball questions.  Try:

    browseVignettes("Lahman")

* In addition, the documentation
has been updated to use `dplyr` and `tidyr` tools for database manipulation and `ggplot2` for plots.

## Installation

For the current CRAN version, simply use:

    install.packages("Lahman")

The current up to date pre-CRAN release version can be installed in your R library via:

    library(devtools)
    install_github("cdalzell/Lahman", ref="master")

If you wish to use a non-release version of `Lahman`, use `dev_mode()`.

    dev_mode()
    install_github("cdalzell/Lahman", ref="insert_branch_name_here")
    #  ...test ...
    dev_mode()  # revert to previous


Please report any problems or issues with this new version as an [issue](https://github.com/cdalzell/Lahman/issues) on this site.

## Related
A MySQL version of the Lahman database is provided by Nat Dunn: https://github.com/WebucatorTraining/lahman-baseball-mysql
