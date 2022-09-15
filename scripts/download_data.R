# Script to download the data from Dryad and put it in the data folder, in a destination
  # file named with a download date stamp. This might not be very important in this case 
  # because the files are associated with a doi and won't be changing, but I wanted to
  # practice. The implication of this is that running the download again on another day
  # wouldn't overwrite these specific files, and one would have to change the names of the
  # files in downstream scripts to switch to using a new file.

# The data being downloaded is from: Age-dependent social learning in a lizard (Noble et al. 2014)
  # The doi is https://doi.org/10.5061/dryad.6rj28

download.file(url="https://datadryad.org/stash/downloads/file_stream/49770",
              method="wget",
              quiet=FALSE,
              destfile=paste0('data/', 'data_T1_final_', 'downloaded_', Sys.Date(), '.csv'))
              
download.file(url="https://datadryad.org/stash/downloads/file_stream/49771",
              method="wget",
              quiet=FALSE,
              destfile=paste0('data/', 'data_T2_final_', 'downloaded_', Sys.Date(), '.csv'))