pollutantmean <- function(directory, pollutant = "nitrate", id= 1:332)            
{                 if(grep("specdata",directory) ==1) 
{
  directory <- ("D:/Learn/DA/R_coursera/Rcoursera/specdata")
}
  mean_polldata <- c()
  specdatafiles <- as.character(list.files(directory))
  specdatapaths <- paste(directory, specdatafiles, sep="/")
  for(i in id) 
  {
    curr_file <- read.csv(specdatapaths[i], header=T, sep=",")
    head(curr_file)
    pollutant
    remove_na <- curr_file[!is.na(curr_file[, pollutant]), pollutant]
    mean_polldata <- c(mean_polldata, remove_na)
  }
  {
    mean_results <- mean(mean_polldata)
    return(round(mean_results, 3))
  }
} 


print(R.version.string)
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)


## Calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors.
## The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'.
## Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data
## from the directory specified in the 'directory' argument and returns the mean of the pollutant
## across all of the monitors, ignoring any missing values coded as NA.
pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  ## Get a list of filenames
  filenames <- list.files(path=directory, pattern="*.csv")
  
  ## Initialize a vector to hold values
  vals <- vector()
  
  ## Loop over the passed id's
  for(i in id) {
    
    ## Pad the i to create a filename
    filename <- sprintf("%03d.csv", i)
    filepath <- paste(directory, filename, sep="/")
    
    ## Load the data
    data <- read.csv(filepath)
    
    ## Select our column
    d <- data[,pollutant]
    
    ## Ignore NAs
    d <- d[!is.na(d)]
    
    ## append to our vector
    vals <- c(vals, d)
  }
  
  ## Return the value rounded to 3 dec places
  round(mean(vals), 3)
}

print(R.version.string)
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)