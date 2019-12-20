#Basics of R

#Basic maths
1 + 1
1 + 2 + 3
3 * 7 * 2
4 / 2
4 / 3
4 * 6 + 5
( 4 * 6 ) + 5
4 * ( 6 + 5 )
#Variables
x <- 2
x
x2 = 4
x2
8 -> x3
x3
x5 <- x4 <- 16
x5
x4
assign( 'x6',32 )
x6
#removing variables
rm( x6 )
remove( x5 )
#garbage collection (release unused memory to the operating system)
gc
#find out what data type a variable is
class( x4 )
is.numeric( x3 )
is.integer( x3 )
x5 <- 5L
is.integer( x5 )
is.numeric( x5 )
#ack! integers & numerics
class( 4L )
class( 2.8 )
class( 4L * 2.8 )
class( 5L )
class( 2L )
class( 5L/2L )
#character data
y <- 'data'
y
y2<- factor ( 'data' )
y2
nchar( y )
nchar( y2 )
nchar( 'R for Everyone' )
nchar( x4 )
nchar( 1984 )
#dates
date1 <- as.Date( "2012-06-28" )
date1
class( date1 )
as.numeric( date1 )
date2 <- as.POSIXct( '1980-01-25 5:30' )
class( date2 )
as.numeric( date2 )
date2
class( date1 )
class( as.numeric( date1 ) )
#logical
TRUE * 5
FALSE *5
k <- TRUE
class( k )
is.logical( k )
T
class( T ) 
T <- 7
T
class( T )
2 == 4
2 == 2
2 != 2
2 != 4
2 > 4
#vectors. a vector is a collection of elements, all of the same type.
z <- c ( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 )
z
z * 3
z + 2
z - 3
z / 4 
z ^ 2
sqrt( z )
z2 = 1:10
z2
10:1
-2:3
5:-7
a <- 1:10
b <- -5:4
a + b
b-a
a*b
a/b
a^b
length( a )
length( b )
#weeeeird: if vectors are of uneven length, the shorter vector gets recycled 
#-that is, its elements are repeated, in order, until they have been matched up 
#with every element of the longer vector.
a + c( 1, 2 )
a + c( 1, 2, 3 )
a <= 5
a > b
a < b
c <- 10:1
d <- -4:5
any( c < d )
all( c < d )
q <- c( 'hockey', 'football', 'baseball', 'curling', 'rugby', 'lacrosse', 'basketball', 'tennis', 'cricket', 'soccer' )
q
nchar( q )
nchar( d )
#indexing
q[ 1 ]
q[ 1:2 ]
q[ c( 1,4 ) ]
c( One='a', Two='y', Last='r')
w <- 1:3
names( w ) <-c( 'a', 'b', 'c' )
w
#factor vectors
q2 <-c( q, 'hockey', 'lacrosse', 'hockey', 'water polo', 'hockey', 'lacrosse' )
q2
q2Factor <- as.factor( q2 )
q2Factor
as.numeric( q2Factor )
factor( x=c( 'high school', 'college', 'masters', 'doctorate' ), 
        levels=c( 'high school', 'college', 'masters', 'doctorate' ), 
        ordered=TRUE  )
#calling functions
mean( a )
?mean
apropos( 'mea' )
#representing missing data with 'NA' & 'NULL'
w <- c( 1,  2, NA, 8, 3, NA, 3 )
w
is.na( w )
mean( w )
length( w )
mean( w, na.rm=TRUE )
w2 <- c( 1, NULL, 3 )
w2
length( w2 )
is.null( w2 )
#pipes
library( magrittr )
x <- 1:10
mean( x )
x %>% mean
sum( is.na( w ) )
w %>% is.na %>% sum

#Advanced Data Structures
#dataframes: each column is a variable (and a vector). each row is an observation.
the_DataFrame <- data.frame( x, y, q )
the_DataFrame
the_DataFrame <- data.frame( First = x, Second = y, Sport = q )
the_DataFrame
nrow( the_DataFrame )
ncol( the_DataFrame )
dim( the_DataFrame )
names( the_DataFrame )
names( the_DataFrame )[ 3 ]
rownames( the_DataFrame )
rownames( the_DataFrame ) <- c( 'adam', 'ben', 'carl', 'dave', 'eric', 'fred', 'greg', 'harry', 'ian', 'john' )
rownames( the_DataFrame )
rownames( the_DataFrame ) <- NULL
rownames( the_DataFrame )
head( the_DataFrame )
head( the_DataFrame, n=7 )
tail( the_DataFrame )
class( the_DataFrame )
the_DataFrame$Sport
the_DataFrame[ 3,2 ]
the_DataFrame[ 3, 2:3 ]
the_DataFrame[ c( 3,5 ), 2:3 ]
the_DataFrame[ ,3 ]
the_DataFrame[ , 2:3 ]
the_DataFrame[ 2, ]
the_DataFrame[ 2:4, ]
the_DataFrame[ , c( 'First', 'Sport' ) ]
the_DataFrame[ , 'Sport' ]
class( the_DataFrame[ , 'Sport' ] )
the_DataFrame[ 'Sport' ]
class( the_DataFrame[ 'Sport' ] )
the_DataFrame[['Sport']] 
class( the_DataFrame[['Sport']] )
the_DataFrame[ , 'Sport', drop=FALSE ]
class( the_DataFrame[ , 'Sport', drop=FALSE ] )
newFactor <- factor( c( 'Pennsylvania', 'New York', 'New Jersey', 'New York', 'Tennessee', 'Massachusetts', 'Pennsylvania', 'New York' ) )
model.matrix( ~ newFactor - 1 )
#Lists:a container to hold mixed type data
list( 1,2,3 )
list( c( 1,2,3 ), c( 4,5,6 ), c( 7,8,9 ) )
#enclosing the expression in parenthesis displays the results after execution
( list3 <- list( c( 1,2,3 ), 3:7 ) ) 
list3
list( the_DataFrame, 1:10 )
list5 <- list( the_DataFrame, 1:10, list3 )
list5
names( list5 )
names( list5 ) <- c( 'data.frame', 'vector', 'list' )
names( list5 )
list5
list6 <- list( TheDataFrame = the_DataFrame, TheVector = 1:10, TheList = list3 )
list6
#create an empty list with specific dimentions
( emptyList <- vector( mode='list', length=4 ) )
#need to use double square brackets to index lists
list5[[ 1 ]]
list5[[ 'data.frame' ]]
#need to index the level before you can access the element
list5[[ 1 ]]$Sport
list6[[ 1 ]][, "Second"]
list5[[ 1 ]][, 'Second', drop=FALSE ]
#appending to a list
length( list5 )
list5[[ 4 ]] <- 2
length( list5 )
list5
list5[[ 'NewElement' ]] <- 3:6
length( list5 )
list5
names( list5 )
#STYLE ALERT: appending to a list (say, in a for loop) is comutationally expensive.
#So, it is best practice to create a list as long as its final desired size and then fill it in using the appropriate indices.

#Matices: rectangular with rows and columns. Every single element, regardless of column, must be the same data type.
amat <- matrix( 1:10, nrow=5 )
amat
bmat <- matrix( 21:30, nrow=5 )
bmat
cmat <- matrix( 21:40, nrow=2 )
cmat
nrow( amat )
ncol( bmat )
dim( cmat )
amat + bmat
dmat <- amat + bmat
dmat
dmat <- amat * bmat
dmat
#this is cool, you can get a boolmat back of matching elements
amat == bmat
emat <- amat %*% t( bmat )
emat
colnames( amat )
rownames( amat )
colnames( amat ) <- c( 'left', 'right' )
rownames( amat ) <- c( '1st', '2nd', '3rd', '4th', '5th' )
amat 
colnames( bmat ) <- c( 'First', 'Second' )
rownames( bmat ) <- c( 'one', 'two', 'three', 'four', 'five' )
bmat
colnames( cmat ) <- LETTERS[ 1:10 ]
rownames( cmat ) <- c( 'Top', 'Bottom')
cmat
t( amat )
amat %*% cmat
#Arrays: essentially multidimentional vectors. behave samesame
#the only difference between arrays and matrices is that matrices are restricted to 2 dimensions
theArray <- array( 1:12, dim = c( 2,3,2 ) )
theArray
