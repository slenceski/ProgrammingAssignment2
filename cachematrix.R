##Coursera Class R-Programming
##COurse 2 of Data Science Specialization
##Programming Assignment 2 (01/23/2016)

## Put comments here that give an overall description of what your
## functions do

##Functions should cache computation of matrix inverse rather than re-compute
##everytime in order to save time. 

##defining cached inverses in global(?) environment rather than local(?)
##allows the computation to be recalled even if function is run 
##on multiple matrices

##makeCacheMatrix creates a special type of matrix
##It is a list of four functions
  
  ##set() should define matrix x in the global(?) environment 
  ## and reset m (the inverse) to Null
  ##get() should retrieve matrix
  ##setInverse() should define inverse m with second function - cacheSolve
  ##getInverse()

makeCacheMatrix <- function(x = matrix()) {
  m <-NULL
  set <-function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() {
    x
  }
  setInverse <- function(inverse) {
    m <<-inverse
  }
  getInverse <- function() {
    m
  }
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

##cacheSolve uses a matrix created by the function makeCacheMatrix
  ##should check to see whether the inverse, m, is null 
  ##if not null, use getInverse to recalled saved inverse
  ##if null, solve for matrix inverse using solve() and store with SetInverse()

cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if (!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}

