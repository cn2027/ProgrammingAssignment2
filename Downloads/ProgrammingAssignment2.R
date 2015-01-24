#The function makeCacheMatrix() creates a list containing a function set() to creates a square matrix compatible with solve() function, get its value, set the value of the inverse, and then get the value of the inverse.
makeCacheMatrix <- function(x = numeric()) {
        I <- NULL
        set <- function(y) {
                x <<- y
                I <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) I <<- solve
        getInverse <- function() I
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}
#The following function calculates the inverse of the square matrix.
cacheSolve <- function(x, ...) {
        I <- x$getInverse()
        if(!is.null(I)) {
                message("getting cached data")
                return(I)
        }
        data <- x$get()
        I <- solve(data, ...)
        x$setInverse(I)
        I
}

