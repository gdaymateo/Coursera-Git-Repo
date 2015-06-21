complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    allids <- list.files(directory, full.names=TRUE) 
    good <- data.frame(id = integer(0), nobs = integer(0))
    names(good) <- c("id", "nobs")
    for (i in id){ 
       nobs <- sum(as.numeric(complete.cases(read.csv((allids[i])))))
       good <- rbind(good, data.frame(id = i, nobs = nobs))
    } 
    return(good)
   }
