makeCacheMatrix <- function(x = matrix()) {
  set <- function(y) {
    x <<- y
  }
  get <- function() x

  list(set = set, get = get)
}