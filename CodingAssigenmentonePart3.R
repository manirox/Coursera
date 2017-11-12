rm(list=ls())

pollutantmean <- function(specdata,x)
{
  filenames <- list.files(specdata, pattern="*.csv", full.names=TRUE)
  
  
  
  #temprbind  =0
  #List1=list()
  List1 = numeric()
  List2=numeric()
  
  #List2=list()
  for(i in x)
  {
    
    #print(x)
    resvvalue1 <- filenames[i]
    #print(resvvalue1)
    
    ldf <- lapply(resvvalue1, read.csv)
   
    
    ldf <- (na.omit(data.frame(ldf)))
    
    Countnull <-(nrow(ldf))
    #print(Countnull)
    #List1[[length(List1)+1]] =  i
    #List2[[length(List2)+1]] = Countnull
    List2 = c(List2,Countnull)
    List1 = c(List1,i)
    #print(List1)
    
    
    
  }
  
  
  #print(List1)
  #print(List2)
  
  #df <- data.frame(matrix(unlist(List1), nrow = length(x), byrow  = FALSE))
  df <- data.frame(List1,List2)
  
 
  
  
  #print(df)
  
  print("RRrrRRRRRRRRRRRRRRRRRRRRRRR$$$$$$$$$$$$$$FFFFFFFFFFF")
  
  #print(ComboRet$2)
  print("end ***********************************")
  return(df)
  
}

CaliculatingThreshold <- function(Dir,threshold)
{
  Currentdf <- pollutantmean(Dir,1:322)
  #dataframe <- Currentdf()
  print("XXXXXXXX")
  print(length(Currentdf$List1))
  print("_____")
  corelation =numeric()
  
  for(i in 1:length(Currentdf$List2))
  {
    if(Currentdf$List2[i] > threshold)
    { 
      
      FileId <- Currentdf$List1[i]
      FileValue <- Currentdf$List2[i]
      filenames <- list.files(Dir, pattern="*.csv", full.names=TRUE)
      resvvalue1 <- filenames[FileId]
      ldf <- lapply(resvvalue1, read.csv)
      ldf <- (na.omit(data.frame(ldf)))
      #print(ldf)
      corelation<- c(corelation,cor(ldf$sulfate,ldf$nitrate))
      
      
    }
    
    
  }
  print(corelation)
  #print(corelation)
  
  }

CaliculatingThreshold("/Users/manishreddybendhi/Desktop/Fun/RProgrammingCoursera/specdata",400)
head(CaliculatingThreshold("/Users/manishreddybendhi/Desktop/Fun/RProgrammingCoursera/specdata",400))

