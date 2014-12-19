test.examples <- function()
{
  # Prepare a matrix
  x <- matrix(c(2,1,5,3),nrow=2,ncol=2)
  # Prepare the inverse matrix
  xinverse <- matrix(c(3,-1,-5,2),nrow=2,ncol=2)
  
  z <- makeCacheMatrix(x)
  checkIdentical("list", class(z))
  print("nocache test")
  checkEquals(xinverse, cacheSolve(z))
  print("cached test ")
  checkEquals(xinverse, cacheSolve(z))
  z1 <- makeCacheMatrix(xinverse)
  print("nocache test")
  checkEquals(x, cacheSolve(z1))
  print("cached test")
  checkEquals(x, cacheSolve(z1))
}

test.deactivation <- function()
{
  DEACTIVATED('Deactivating this test function')
}