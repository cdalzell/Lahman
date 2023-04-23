#### Version 11.0-0 (2023-04-16)
- Updated with data for the 2022 season

#### Version 10.0-1 (2022-04-07)
- Updated with data for the 2021 season
- Removed `Master` table which has been replaced by the `People` table

#### Version 9.0-0 (2021-04-09)

- Updated with data for the 2020 season

#### Version 8.0-1 (2021-01-20)

- RData files now compressed with `version=2` to avoid dplyr warnings

#### Version 8.0-0 (2020-06-06)

- Updated with data for the 2019 season
- Added the `FieldingOFsplit` and `HomeTeams` tables

#### Version 7.0-1 (2019-05-01)

- Updated with data for the 2017 and 2018 seasons
- Added the `People` table. The `Master` table is now the `People` table in the Lahman dataset. Master is now a copy of People and is being retained for backward compatibility
- Added the `Parks` table
- Added introductory and example vignettes
- Added ability to check reverse dependencies

#### Version 6.0-0 (2017-08-07)

- Updated with data for the 2016 season

#### Version 5.0-0 (2016-08-08)

- Updated with data for the 2015 season, plus numerous corrections of errors
  and inconsistencies discovered in previous tables.

- Documentation examples are now provided for all data tables [Martin Monkman]

- Documentation examples were rewritten to make extensive use of dplyr for data manipulation
  and ggplot2 for graphics [Denis Murphy]


#### Version 4.0-1 (2015-09-04)

- Updated with data for the 2014 season
- Changes to reflect alterations in the 2014 schema:
  - Removed from `Batting`: `G_batting`, `G_old`
  - Replaced `SchoolsPlayers` with `CollegePlaying`

#### Version 3.0-0 (2014-07-20)

- Updated with data for the 2013 season
- Changes to reflect alterations in the 2013 schema:
  - `HallOfFame$hofID` is now `HallOfFame$playerID`
  - `managerID` is now `playerID` in all tables
  - Removed from `Master`: `managerID, hofID, holtzID, lahmanID, lahman40ID, lahman45ID, nameNote, nameNick, and college`

#### Version 2.0-3 (2013-05-29)

- largest RData files are now compressed via `R CMD build --resave-data`

#### Version 2.0-2 (2013-05-23)
- Fixed problems with the `Teams*.RData `files not having been updated to the 2012 Versions.
- The project for this package now has a web page at http://lahman.r-forge.r-project.org/

#### Version 2.0-1 (2013-04-18)

- Added `Label()` and data frames for variable labels
- Added more examples and plots to Salaries, Pitching, etc. from Dennis Murphy
- `Master$bats`, `Master$throw`s` made into factors
- Added some examples to `Schools.Rd`

#### Version 2.0-0 (2013-04-08)

- New major version, now reflecting the 2012 Lahman database.  Some deprecated or defunct
  tables were dropped.
- readLahman.R added to inst/scripts for documentation of how the data files were created.
  The scripts there can be used to simplify future updates.
- More examples added to various datasets

#### Version 1.0-10 (2012-10-04)

- Fixed deprecated warnings stemming from changes in ggplot2

#### Version 1.0-8 (2011-10-02)
- Added examples in `HallOfFame.Rd`
- Fixed definitions of BABIP and OBP in `battingStats()`
- Added examples in `Manager.Rd`

#### Version 1.0-7 (2011-09-27)
- Extended examples in `Batting.Rd`
- Initial release to CRAN

#### Version 1.0-6 (2011-09-26)
- Added `battingStats()` function to calculate BA and friends

#### Version 1.0-5 (2011-09-25)
- Added Authors@R in `DESCRIPTION` for R 2.14.x
- Fixed `Appearances` table
- Added `demo/batting-summstats.R`
- Added a few examples to various files
- Initial export to R-Forge
