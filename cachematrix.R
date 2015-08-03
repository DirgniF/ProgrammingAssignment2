## Below functions can be used to cache the inverse of a matrix rather than to compute it repeatedly. 


## makeCacheMatrix creates a list containing 4 functions with following purpose:
## getmatrix: set the value of the matrix 
## setmatrix: set the value of the vector
## setinverse: set the value of the inverse of the matrix
## getinverse: get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inversematrix<-NULL
  setmatrix<-function(y){
    x<<-y
    inversematrix<<-NULL
  }
  getmatrix<-function()x
  setinverse<-function(y) inversematrix<<-y
  getinverse<-function() inversematrix
  list(setmatrix=setmatrix,getmatrix=getmatrix,setinverse=setinverse,getinverse=getinverse)
}


## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated, then the cachesolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inversematrix<-x$getinverse()
  if(!is.null(inversematrix)){
    message("getting cached inverse matrix")
    return(inversematrix)
    }
  matrix<-x$getmatrix()
  inversematrix<-solve(matrix,...)
  x$setinverse(inversematrix)
  inversematrix
}
