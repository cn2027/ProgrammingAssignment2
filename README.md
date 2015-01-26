##Cousera R Programming: Programming Assignment 2
========================================================
###This code shows how to use the functions in the ProgrammingAssignment2.R Script:

###The function makeCacheMatrix() creates a list containing a function "set()" that creates a square matrix compatible with the "solve()" function, gets its value, sets the value of the inverse, and then gets the value of the inverse. 

###Use the following example below to test the function.

matrix <- makeCacheMatrix( matrix(rbind(c(-sqrt(2),-sqrt(4)),c(-sqrt(4),-sqrt(2))), nrow = 2, ncol = 2))

summary(matrix)
```{r}
#           Length Class  Mode    
#set        1      -none- function
#get        1      -none- function
#setInverse 1      -none- function
#getInverse 1      -none- function
```
matrix$get()
```{r}
#          [,1]      [,2]
#[1,] -1.414214 -2.000000
#[2,] -2.000000 -1.414214
```
matrix$getInverse()
```{r}
#           [,1]       [,2]
#[1,]  0.7071068 -1.0000000
#[2,] -1.0000000  0.7071068
```

###The following function calculates the inverse of the square matrix.

cacheSolve(matrix)
```{r}
#           [,1]       [,2]
#[1,]  0.7071068 -1.0000000
#[2,] -1.0000000  0.7071068
```

Run the function again to get the cached value.

```{r}
cacheSolve(matrix)
#getting cached data
#           [,1]       [,2]
#[1,]  0.7071068 -1.0000000
#[2,] -1.0000000  0.7071068
```




