corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## Load all files
  file_list <- list.files(pattern="*.csv")  
  
  index <- 1
  corrdata<- numeric()
  for (file in file_list){
    # if the merged dataset doesn't exist, create it
    
    dataset <- read.csv(file, header=TRUE, sep=",")
    completecasescnt<- sum(complete.cases(dataset))
    if(completecasescnt > threshold){
      sulfatedata <- dataset$sulfate
      nitratedata <- dataset$nitrate
      corrdata[index]<- cor(sulfatedata,nitratedata,use="na.or.complete")
      index<-index+1
    }
  }
  
  corrdata
}