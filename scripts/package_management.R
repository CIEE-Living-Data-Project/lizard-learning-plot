# Package management using groundhog will ensure that the correct version of packages is used
  # no matter who is running the script or when. 

# Install groundhog itself if it isn't already installed using code stolen from Joachim Schork's
  # post on Statistics Globe that checks if a list of packages is already present:
my_packages <- c("groundhog")
not_installed <- my_packages[!(my_packages %in% installed.packages()[ , "Package"])]
if(length(not_installed)) install.packages(not_installed) 
rm(not_installed, my_packages)

# Load groundhog now that it is definitely installed
require("groundhog")

# The date for groundhog to use when loading packages, in the format yyyy-mm-dd
date_for_packages <- "2022-09-11"

# Use groundhog to load versions of packages which were available on the given date
groundhog.library("tidyverse", date_for_packages)
rm(date_for_packages, r.need.full)