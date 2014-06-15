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


complete <- function(directory, id = 1:332) {
  dataset <- getData(id)    
  #header <- c("id","nobs")
  nobslist<-numeric(length(id))
  df <- data.frame(id=id,nobs=nobslist)
  cntr<- 1
  for(tempid in id){
    data <- subset(dataset,ID==tempid)
    completdatacases <- complete.cases(data)
    completedatacount <- sum(completdatacases)
    df$nobs[cntr]<-completedatacount
    cntr<- cntr+1
  }
  print(df)
}