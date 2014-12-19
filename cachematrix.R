##  
##
##  -- Corresponding unit tests --
##  install.package('RUnit')
##  source('run_tests.R')


#' Prepare a special matrix who's inverse can be cached.
#' @examples
#' x <- matrix(c(2,1,5,3),nrow=2,ncol=2)
#' z <- makeCacheMatrix(x)
#'
#' @param x A matrix
#' @return a special matrix (actually a list) \
#' to set and get the value and to set and get the inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


#' Calculate the inverse of a matrix. Use the cached version if possible.
#' 
#' @param x A matrix
#' @return The inversed matrix. Print if a cached result is used.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
