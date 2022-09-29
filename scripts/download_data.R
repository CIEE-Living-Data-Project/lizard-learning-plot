# Script to download the data from Dryad and put it in the data folder, in a destination
  # file named with a download date stamp. This might not be very important in this case 
  # because the files are associated with a doi and won't be changing, but I wanted to
  # practice. The implication of this is that running the download again on another day
  # wouldn't overwrite these specific files, and one would have to change the names of the
  # files in downstream scripts to switch to using a new file.

# Check to see if the data directory exists, and create it otherwise. If someone clones the
  # repository from Git, it won't include the data folder since I don't want to include the 
  # data in my repository, and empty directories aren't tracked by Git. Therefore, it should 
  # be created. There is a potential problem here since RStudio projects automatically have 
  # the project directory as the working directory, when I would otherwise expect the working 
  # directory to be the scripts directory. I suppose the easiest way to solve that problem 
  # would just be keeping the scripts in the main repository directory. Otherwise, I have to
  # somehow check which case is true. I will return to this issue later, but for now will 
  # assume the user has an RStudio project like me.

if (dir.exists("data")==FALSE) {
  dir.create("data")
}

# Download files with names and date stamps
  # The data being downloaded is from: Age-dependent social learning in a lizard (Noble 
  # et al. 2014). The doi is https://doi.org/10.5061/dryad.6rj28

data_date <- Sys.Date()

data_names <- c(paste0('data/', 'data_T1_final_', 'downloaded_', data_date, '.csv'),
                paste0('data/', 'data_T2_final_', 'downloaded_', data_date, '.csv'))

download.file(url="https://datadryad.org/stash/downloads/file_stream/49770",
              method="wget",
              quiet=FALSE,
              destfile=data_names[1])
              
download.file(url="https://datadryad.org/stash/downloads/file_stream/49771",
              method="wget",
              quiet=FALSE,
              destfile=data_names[2])

# Print downloaded file names to text files so that they can be accessed in the
  # manuscript R markdown script. The fact that I put Sys.Date in a variable at
  # the beginning means that it will be the same as above even if it is midnight.

write(data_names,
      file="data/data_names.txt")
