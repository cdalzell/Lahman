# compress the data sets in data/
# see: http://r-pkgs.had.co.nz/data.html

tools::checkRdaFiles("data")
tools::resaveRdaFiles("data", compress="bzip2")