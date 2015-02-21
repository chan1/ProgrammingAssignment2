## My basic ghetto unit tests:

m <- matrix(c(4,2,7,6), nrow=2, ncol=2)
y <- makeCacheMatrix(m)

## 1)
y$get()

## Expected
## [,1] [,2]
## [1,]    4    7
## [2,]    2    6

## 2)
y$setinverse(solve(m))
y$getinverse()

## Expected
## [,1] [,2]
## [1,]  0.6 -0.7
## [2,] -0.2  0.4 

## 3)
y$set(m)
y$getinverse()

## Expected
NULL

## 4)
cacheSolve(y)

## Expected
     [,1] [,2]
[1,]  0.6 -0.7
[2,] -0.2  0.4

## 5) 
cacheSolve(y)

## Expected
getting cached matrix data
     [,1] [,2]
[1,]  0.6 -0.7
[2,] -0.2  0.4