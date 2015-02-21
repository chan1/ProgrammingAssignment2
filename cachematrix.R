## Put comments here that give an overall description of what your
## functions do

## This function creates a special matrix object that
## can cache it's own inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
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

  if(!is.null(i)) {
    message("getting cached matrix data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i

}