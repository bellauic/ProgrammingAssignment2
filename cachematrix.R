## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix is used to make a cache matrix to store get/set get/setinverse
makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {    
                x <<- y        ##<<- means to assign a value to an object
                i <<- NULL 
                
        }
        get <- function()x      
        setinverse <- function(solve) i <<- solve
        getinverse <- function() i
        list(set = set, get = get, setinverse = setinverse,getinverse = getinverse)
        
}


## cacheSolve is used to run the info compared with calculation

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()    
        if(!is.null(i)){
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
