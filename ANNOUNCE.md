## Lahman package v. 11.0.0 released to CRAN

Team Lahman is pleased to announce that v. 11.0.0 of the Lahamn package is now
on CRAN.  It contains the data from Sean Lahman's Baseball Database,
https://www.seanlahman.com/baseball-archive/statistics/
as a collection of data frames covering nearly all aspects of baseball
statistics from 1871-2022.

In this release,

* All data sets have been updated with data for the 2022 baseball season.  In
  addition, numerous corrections of data errors and inconsistencies discovered
  in previous year tables were applied.

* Documentation examples are now provided for all data tables.

* Documentation examples were rewritten to make extensive use of dplyr for data manipulation
  and ggplot2 for graphics.

### Development

All development of the package takes place on Github, https://github.com/cdalzell/Lahman.
Major versions of the R package are released only once a year, following the release of a
new archive update on Sean Lahman's site.  This R release occurs after sufficient time has 
elapsed to correct errors in the source data for a new season. Minor versions may be 
released from time to time to correct errors in the R version or add functionality.

Please report any problems or issues with this new version as an issue on this site,
https://github.com/cdalzell/Lahman/issues

There exists an old pseudo-wiki on R-Forge, https://lahman.r-forge.r-project.org/ that
collects some additional analyses and visualizations.

-- Team Lahman: Chris Dalzell (maintainer), Michael Friendly (author), Denis Murphy, Martin Monkman, Sean Lahman
