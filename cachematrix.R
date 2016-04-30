## The following two functions can be used to cache inverse of a matrix,
## which is a very computation intensive operation.

## The first function makeCacheMatrix carries out the following four steps:
## 1. set the matrix
## 2. get the matrix
## 3. set the inverse of the matrix
## 4. get the inverse of the matrix
## Sample call of this function:
## m<-makeCacheMatrix (x)
## Where x is a square matrix


makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y)
{
x <<- y
m <<- NULL
}
get <- function() x
setinverse <- function(inverse) m <<- inverse
getinverse <- function() m
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}



## The below funcation calculates the inverse of the matrix and stores the result in cache
##Sample call:
## i<-cacheSolve(m)   : First time call
## i1<-cacheSolve(m)  : Second call and the result will be fetched from cache. The message ""getting cached data" will be 
## displayed.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
m <- x$getinverse()
if(!is.null(m)) {
## The below message will be displayed while fetching cached result..
message("getting cached data")
return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
}
