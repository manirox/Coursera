## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

rm(list=ls())
#matrix for function to get the inverse 
MatrixCheFunction <- function(x = matrix()) {
  inverse1 <- NULL
  #Set function to set the values 
  Setfun <- function(y) {
    x <<- y
    inverse1 <<- NULL
  }
  #Returns the value of the function x
  GetFun1 <- function() x
  #Setes the value to the inverse varible 
  SetInverseFun <- function(inverse) inverse1 <<- inverse
  #Retutns the inverse values 
  GetInverseFun <- function() inverse1
  #Used to assign the values 
  list(Setfun=Setfun, GetFun1=GetFun1, SetInverseFun=SetInverseFun, GetInverseFun=GetInverseFun)
}

#Cache function to caliculatethe invrsve value of a matrix 
cacheSolFuction <- function(x, ...) {
  inverse1 <- x$GetInverseFun()
  #if it already has the values of inverse they are returned and if not new onces are calicuated 
  if(!is.null(inverse1)) {
    message("getting cached data.")
    return(inverse1)
  }
  ##Here we are assigning the values 
  data <- x$GetFun1()
  inverse1 <- solve(data)
  x$SetInverseFun(inverse1)
  inverse1
}
#Creating a 4*4 matrix for sending the values 
Mat1 = rbind(c(1, -1/4,5,7), c(-1/4, 1,9,2),c(3,9,5,2),c(7,2,9,9))
#Calling the function of matrix  
UseChe = MatrixCheFunction(Mat1)
UseChe$GetInverseFun()
#Getting a function 
UseChe$GetFun1()
#Caling th cache funtion 
cacheSolFuction(UseChe)
cacheSolFuction(UseChe)

 
