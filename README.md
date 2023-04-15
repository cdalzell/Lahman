Lahman <img src="man/figures/Lahman_hex.png" align="right" />
==========================================================

[![](https://www.r-pkg.org/badges/version/Lahman)](https://cran.r-project.org/package=Lahman) [![](https://cranlogs.r-pkg.org/badges/grand-total/Lahman)](https://cran.r-project.org/package=Lahman)
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Travis build status](https://travis-ci.com/cdalzell/Lahman.svg?branch=master)](https://travis-ci.com/cdalzell/Lahman)
[![License](https://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](https://www.gnu.org/licenses/gpl-2.0.html) 


R Library for Sean Lahman's Baseball Database
========================================================

Version: 11.0-0
Date: 2023-04-16

Authors:

* Chris Dalzell
* Michael Friendly
* Dennis Murphy
* Martin Monkman
* Vanessa Foot & Justeena Zaki-Azat [vignettes]
    
Maintainer: Chris Dalzell

Copyright: Sean Lahman

Required: R (>= 3.5.0)

URL: https://CRAN.R-project.org/package=Lahman

## Current Version

This is the R version of the 2022 edition of Sean Lahman's Baseball Database, https://www.seanlahman.com/baseball-archive/statistics/.

* It now fully reflects the reorganization of data tables in Lahman's source,
the most notable was the renaming of the old `Master` table, to `People` in the
Lahman Database. 

The current database schema is shown in the figure below:

![](man/figures/Lahnan-db-diagram.jpg)

* A collection of vignettes has been added, illustrating various data manipulation
tasks and analyses to explore some baseball questions.  Try: `browseVignettes("Lahman")`

* In addition, the documentation
has been updated to use `dplyr` and `tidyr` tools for database manipulation and `ggplot2` for plots.

## Installation

For the current CRAN version, simply use:

    install.packages("Lahman")

If you wish to use a non-release version of `Lahman`, use `dev_mode()`.

    dev_mode()
    install_github("cdalzell/Lahman", ref="insert_branch_name_here")
    #  ...test ...
    dev_mode()  # revert to previous


Please report any problems or issues with this new version as an [issue](https://github.com/cdalzell/Lahman/issues) on this site.

## Related

* A MySQL version of the Lahman database is provided by Nat Dunn: https://github.com/WebucatorTraining/lahman-baseball-mysql

* The [BaseballDBR](https://cran.r-project.org/package=baseballDBR) package
works with `Lahman` & other baseball databases and provides some functions
to compute other baseball metrics.

* The [Baseball with R](https://baseballwithr.wordpress.com/) blog contains
analyses of baseball data stemming from the book _Analyzing Baseball Data with R_ (CRC Press, 2014).


