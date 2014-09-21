There are two functions in this code. The functions together is used to compute the inverse of a matrix. It is also sophisticated to cache the matrix inverse and avoid repeated computation of the inverse of a mtrix.

The below function is used to get the matrix for inverse computation, set the matrix variable to the given matrix. It is also used to compute the inverse of a matrix and set the value of the computed inverse to the inverse matrix variable.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(inv) m <<- inv
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


The below function is used to inverse of the special matrix, which is cached. It checks if the inverse has already been calculated and if so, returns the inverse. If it is not calculated yet, it uses the above function to get the inverse.

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinv(m)
  m
}
