## Mario Gordillo
## GUATEMALA
## Examinig the code, I found the answer by substituting the mean function
## by the solve function

## This function creates an "object" of the type matrix() and stores it in
## scope/memory

makeCacheMatrix <- function(x = matrix()) {
	  m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}


## This function uses the "object" created by the previous function and
## "invert it" with the solve() function.  If the object exists, it only
## takes the value (to avoid re-processing).  If not, then, it does the 
## processing

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	  m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setmean(m)
        m	
}
