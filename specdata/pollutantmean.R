
pollutantmean <- function(directory, pollutant, id=1:332) {
  dataset <- getData(id)
  mean <- mean(dataset[,pollutant],na.rm=TRUE)
  print(mean)
}

getData <- function(id){
  ## Load all files
  file_list <- list.files(pattern="*.csv")  
  for (file in file_list[id]){
    # if the merged dataset doesn't exist, create it
    if (!exists("dataset")){
      dataset <- read.csv(file, header=TRUE, sep=",")
    }
    
    # if the merged dataset does exist, append to it
    else{
      temp_dataset <-read.csv(file, header=TRUE, sep=",")
      dataset<-rbind(dataset, temp_dataset)
      rm(temp_dataset)
    }    
  }
  dataset
}

