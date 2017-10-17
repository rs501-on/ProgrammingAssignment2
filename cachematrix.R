## Put comments here that give an overall description of what your
## functions do

# These functions define global functions that take a matrix as well as
# store the inverse of the matrix. It also has four functions that 
# get and set the primary matrix as well as its inverse



makeCacheMatrix <- function(globalx = matrix()) {
    globalm <- NULL
    set <- function(localy) {
        globalx <<- localy
        globalm <<- NULL
    }
    get <- function() {
        globalx
    }
    setinverse <- function(inversedmatrix) {
        globalm <<- inversedmatrix
    }
    getinverse <- function() {
        globalm
    }
    list(setnormal = set, getnormal = get, 
         setinverse = setinverse, 
         getinverse = getinverse)
}


## Write a short comment describing this function
  
## Return a matrix that is the inverse of 'x'

# This function takes a matrix defined globally and either calculates
# the inverse or if previously calculated, then returns if from stored cache

cacheSolve <- function(globalx, ...) {
    globalm <- globalx$getinverse()
    if(!is.null(globalm)) {
        message("getting cached data")
        return(globalm)
    }
    localdata <- globalx$getnormal()
    globalm <- solve(localdata, ...)
    globalx$setinverse(globalm)
    globalm
}
