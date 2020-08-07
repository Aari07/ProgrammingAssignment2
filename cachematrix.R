makeCacheMatrix <- function(x = matrix()) {
        n1<-NULL
        ## define the 4 different behaviors or functions for object of type
        ## makeCacheMatrix as follows:
        ## 1. set() takes an argument named m1 or any object name other
        ## than x. m1 is assumed to be a matrix.
        set<-function(m1){
                ## Use the <<- operator to assign a value to an object in an
                ## environment that is different from the current environment.
                ## When set executes, first, this assigns the input argument
                ## to the x object in the parent environment,
                x<<-m1
                ## and second, this assigns a value of NULL to the n1 object
                ## in the parent environment.
                ## this line, clears any value of n1 that had been cached by a
                ## prior execution of cacheSolve()
                n1<<-NULL
        }
        
        
        ## 2. getter for the matrix x:
        get<-function()x
        ## 3 the setter for the inverse n1
        setinverse<-function(solve) n1<<-solve
        ## 4 the getter for the inverse n1
        getinverse<-function()n1
        ## Create the new special "matrix" object by returning a list()
        ## to assign each of these functions as an element within a list ()
        ## and returns it to the parent environment. Here we're naming the
        ## list elements, which allows to use the $ form of the extract
        ## operator to access the functions by name rather than by [[
        list(set=set, get=get,
             setinverse = setinverse,
             getinverse = getinverse)
}
