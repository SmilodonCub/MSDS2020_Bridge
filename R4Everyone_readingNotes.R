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

#reading data into R
#oh the joys of CSV files!
#reading CSV using read.table or read.csv to create a new dataframe
theURL <- 'http://www.jaredlander.com/data/TomatoFirst.csv'
#specifying the arguments is good practice. Bonnie you should do moar of this
#header = TRUE indicates that the first row is column names
tomato <- read.table( file = theURL, header = TRUE, sep = ',' )
tomato
head( tomato )
#stringAsFactors
theDF <- data.frame( First = x, Second = y, Sport = q, stringsAsFactors = FALSE )
theDF
theDF$Sport
#there are many useful read in fxns from various r packages:
#read.table, read.csv, read.csv2, read.delim, read.delim2 etc.
library( readr )
tomato2 <- read_delim( file = theURL, delim = ',' )
tomato2
library( data.table )
tomato3 <- fread( input = theURL, sep = ',', header = TRUE )
head( tomato3 )

#Excel Data
#COULDN'T GET THIS TO WORK. NEED TO UNZIP XLSX. MOVING ON INSTEAD OF FINISHING....
library( readxl )
download.file(url='http://www.jaredlander.com/data/ExcelExample.xlsx', destfile='ExcelExample.xlsx', method = 'curl' )
excel_sheets('ExcelExample.xlsx')
tomatoXL <-read_excel('/home/bonzilla/Desktop/MSDS2020/MSDS2020_Bridge/RBridge_R4Everyone/ExcelExample.xlsx')

#Reading from databases
download.file("http://www.jaredlander.com/data/diamonds.db", destfile = "diamonds.db", mode='wb')
library( RSQLite )
drv <- dbDriver('SQLite') #specify the driver
class( drv )
con <- dbConnect( drv, 'diamonds.db' )#establishing the connection with the driver
class( con )
dbListTables( con ) #get the names of tables in the database
dbListFields( con, name = 'diamonds' )
dbListFields( con, name = 'DiamondColors' )
diamondsTable <- dbGetQuery( con, "SELECT * FROM diamonds", stringsAsFactors=FALSE)
head( diamondsTable )
colorTable <- dbGetQuery( con, "SELECT * FROM DiamondColors", stringsAsFactors=FALSE)
head( colorTable )
longQuery <- "SELECT * FROM diamonds, DiamondColors WHERE diamonds.color = DiamondColors.Color"
diamondsJoin <- dbGetQuery( con, longQuery, stringsAsFactors=FALSE )
head( diamondsJoin )
dbDisconnect( con, 'diamonds.db' )
#data from other statistical tools
#R Binary Files
save( tomato, file="tomato.rdata" )
rm( tomato )
head( tomato )
load( 'tomato.rdata' )
head( tomato ) #the object is restored to the working environment with the same name as before
#this is why we do not assign the result of load fxn to an object

#Extracting data from websites
library( XML ) #this library DID NOT COOPERATE!....DIDNT BOTHER TO TROUBLE SHOOT
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable( theURL, which=1, header=FALSE, stringsAsFactors=FALSE )

library( rvest )
ribalta <- read_html('http://www.jaredlander.com/data/ribalta.html')
class( ribalta )
ribalta %>% html_nodes( 'ul' ) %>% html_nodes( 'span' )
ribalta %>% html_nodes( '.street' )
ribalta %>% html_nodes('.street') %>% html_text()
ribalta %>% html_nodes('#longitude') %>% html_attr('value')
ribalta %>% 
  html_nodes('table.food-items') %>% 
  migrittr::extract2( 5 ) %>% 
  html_table()


#Chapter 8 Functions
say.hello <- function()
{
  print( "Hello, World!" )
}
say.hello()
#sprintf
sprintf( "Hello %s", "Jared")
sprintf( "Hello %s, today is %s", "Jared", "Sunday")
hello.person <- function( name )
{
  print( sprintf( "Hello %s", name ) )
}
hello.person( 'Jared' )
hello.person( 'Bonnie' )

hello.person <- function( first, last )
{
  print( sprintf( "Hello %s %s", first, last ) )
}
hello.person( "Bonnie", "Cooper" )
hello.person( last = 'Blackburn', f = 'Zach' )

hello.janedoe <- function( first = 'jane', second = 'doe' )
{
  print( sprintf( "Hello %s %s", first, second ) )
}
hello.janedoe( 'Bonnie' )

hello.niceday <- function( first = 'Bonnie', last = 'Cooper', ... )
{
  print( sprintf( "Hello %s %s", first, last ) )
}
hello.niceday( first = 'Zach', last = 'Blackburn', extra = 'Have a nice day' )

run.this <- function( x, func=mean )
{
  do.call( func, args=list( x ) )
}
run.this( 1:10 )
run.this( 1:20, mean )
run.this( 1:40, sum )

#Control Statements
#if and else. the most basic checks are ==, <, <=, >, >=, and !=
toCheck <- 1
if(toCheck == 1)
{
  print('hello')
}
check.bool <- function(x)
{
  if(x == 1)
  {
    print('hello')
  }
  else if(x ==0)
  {
    print('goodbye')
  }
  else
  {
    print('confused')
  }
}
check.bool(5)
check.bool(FALSE)
check.bool(1)
#switch
use.switch <- function(x)
{
 switch(x,
        'a' = 'first',
        'b' = 'second',
        'c' = 'third',
        'd' = 'fourth',
        'e' = 'fifth',
        'z' = 'last',
        'other') 
}
use.switch('a')
use.switch('z')
use.switch(2)
use.switch('p')
#IFELSE
ifelse(1 == 1, 'Yes','No')
ifelse(1 == FALSE, 'Yes','No')
toTest <- c( 1,1,0,1,0,1 )
ifelse(toTest ==1, 'Yes', 'No')
ifelse(toTest == 1, toTest*3, toTest)
ifelse(toTest == 1, toTest*5, 'Zero')
toTest[2] <- NA
toTest
ifelse(toTest == 1, 'Yes', 'No')
ifelse(toTest == 1, toTest*7, 'Zero')
#compound tests: & && | ||.
#the double forms are best used in an if
#the single forms are necessary for ifelse
#the double form compares only one element from each side, while the single form compares each element of each side
a <- c(1,1,0,1)
b <- c(2,1,0,1)
ifelse(a ==1 & b == 1, 'yes', 'no')
ifelse(a == 1 && b == 1, 'yes', 'no')

#LOOPS
#for loops
for(i in 1:10 ){print(i)}
fruit <- c('apple', 'banana', 'pear')
fruitlength <- rep(NA, length(fruit))
fruitlength
names(fruitlength) <- fruit
fruitlength
for(a in fruit){fruitlength[a] <- nchar(a)}
fruitlength
fruitlength2 <- nchar(fruit)
fruitlength2
names(fruitlength2) <- fruit
fruitlength2
identical(fruitlength, fruitlength2)
#while
x <- 1
while(x <= 5){
  print(x)
  x <- x + 1
  }
for(i in 1:10){
  if(i == 3)
  {
    next
  }
  print(i)
}
for(i in 1:10){
  if(i == 4){
    break
  }
  print(i)
}
