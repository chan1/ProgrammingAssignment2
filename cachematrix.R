## Put comments here that give an overall description of what your
## functions do

## This function creates a special matrix object that
## can cache it's own inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL

  ## resets the stored inverse to null, sets matrix w/
  ## provided value
  set <- function(y) {
    m <<- y
    i <<- NULL
  }

  ## Basic getters and setters:
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## This function calculates the inverse of the special
## matrix generated above. It uses the cached value if
## available.
cacheSolve <- function(x, ...) {
  i <- x$getinverse()

  ## check for cache, and return if avaialable
  if(!is.null(i)) {
    message("getting cached matrix data")
    return(i)
  }
  
  ## manual calculation for non-cached case
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}