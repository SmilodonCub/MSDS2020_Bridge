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

