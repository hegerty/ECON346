Basic R Operations
================
Scott W. Hegerty
ECON 346

Here,we run through some basic R operations to get a sense of what the
syntax looks like. We use more complicated tools in some of the other
examples.

## Creating an Object

Here are three ways to create an object in R. These are simply single
values. These objects are stired for future use.

``` r
v1<-2
v2=9
4->v3
```

Generally the top method is preferred. You can think of it like an
“arrow” that “shoots” the 2 into the new object, v1.

Next, we can try some orders of operation:

``` r
v2-v1
```

    ## [1] 7

``` r
v3/v2
```

    ## [1] 0.4444444

``` r
v3/v2-v1
```

    ## [1] -1.555556

One exercise is to see what formula you could use to turn v1, v2, and v3
into the value **14**.

## Multiple functions

While there are ways to not have to do this (such as *dplyr*), I focus
on the “telescoping” nature of R functions. You start from the inside
(within the most parentheses) and work outward. The parentheses are very
important, so make sure they match (in number, as well as including what
you want to do). For example, there is a difference in order if you add
6 and 4 and multiply by 2.

``` r
(6+4)*2
```

    ## [1] 20

``` r
6+4*2
```

    ## [1] 14

Here divide, add, and multiply – in that order. Then we round the result
to two decimal places. The first two steps are “included” in the final
result (the third line).

``` r
v3/v2-v1
```

    ## [1] -1.555556

``` r
v1*(v3/v2-v1)
```

    ## [1] -3.111111

``` r
round(v1*(v3/v2-v1),2)
```

    ## [1] -3.11

We can also try it a different way:

``` r
v4<-v1*(v3/v2-v1)
round(v4,2)
```

    ## [1] -3.11

A simple exercise is to find out how could you round v4 to three decimal
places. In general, thinking through what you want to do (and modifying
your code to do it) is more important than pure memorization.

## Matrix operations

Now we make a matrix; it has 12 elements. We start with a list of
numbers, 1-12. Note how the series has a start and an end value. This
just fills in the numbers in order.

``` r
m1<-c(1:12)
m1
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12

This isn’t a matrix yet; it’s a 12x1 vector. Remember that matrices are
represented as *(\#rows, \#columns)*

``` r
dim(m1)
```

    ## NULL

Because it’s not a matrix,R says it doesn’t have dimensions: it has a
length.

``` r
length(m1)
```

    ## [1] 12

(Here’s a way to make numbers “skip” by twos. There are a lot of ways to
make different sequences of numbers.) This one starts at 0, ends at 100,
and has a “step” of 2. R functions have parameters that generaly make
sense. Remember that *R cannot read your mind.* It won’t assume
anything, and might not run if you miss something. You need to tell it
exactly what you want it to do.

``` r
seq(0,100,2)
```

    ##  [1]   0   2   4   6   8  10  12  14  16  18  20  22  24  26  28  30  32  34  36
    ## [20]  38  40  42  44  46  48  50  52  54  56  58  60  62  64  66  68  70  72  74
    ## [39]  76  78  80  82  84  86  88  90  92  94  96  98 100

One exercise is, how could you get the exact sequence
*4,7,10,13,16,19,22*?

Going back to the object we saved, *m1*, we can convert it into a matrix
using the *as.matrix()* function. There are others, especially
*as.dataframe* and *as.character*. Now it has dimensions.

``` r
m2<-as.matrix(x=m1)
m2
```

    ##       [,1]
    ##  [1,]    1
    ##  [2,]    2
    ##  [3,]    3
    ##  [4,]    4
    ##  [5,]    5
    ##  [6,]    6
    ##  [7,]    7
    ##  [8,]    8
    ##  [9,]    9
    ## [10,]   10
    ## [11,]   11
    ## [12,]   12

``` r
dim(m2)
```

    ## [1] 12  1

We can change these dimensions by assigning new numbers for the rows and
columns:

``` r
dim(m2)<-c(4,3)
m2
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    5    9
    ## [2,]    2    6   10
    ## [3,]    3    7   11
    ## [4,]    4    8   12

How would you make a 2 x 6 matrix using these commands?

## Selecting Matrix Elements

One important set of procedures involves selecting part of a dataset.
This can be a single row or column, or only some of the columns, for
example. Or, you can choose only rows with values above a certain value.

Here, we extract a vector ftom our new matrix– the middle column. Notice
the brackets in the command. This again is written as *(rows, columns)*.
The “blank” row number means “all.” So this gives all rows for the
second column.

``` r
m2[,2]
```

    ## [1] 5 6 7 8

If we want all rows *but* the second one, we can use the - sign for
“not.”

``` r
m2[,-2]
```

    ##      [,1] [,2]
    ## [1,]    1    9
    ## [2,]    2   10
    ## [3,]    3   11
    ## [4,]    4   12

We can also extract the bottom left corner of our original matrix: This
is the fourth row, third column:

``` r
m2
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    5    9
    ## [2,]    2    6   10
    ## [3,]    3    7   11
    ## [4,]    4    8   12

``` r
m2[4,3]
```

    ## [1] 12

Transposing the matrix switches the rows and columns, so (4,3) becomes
(3,4):

``` r
t(m2)
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    2    3    4
    ## [2,]    5    6    7    8
    ## [3,]    9   10   11   12

We can also apply a function to every element in a matrix. Here, we
double every value in our original m2:

``` r
2*m2
```

    ##      [,1] [,2] [,3]
    ## [1,]    2   10   18
    ## [2,]    4   12   20
    ## [3,]    6   14   22
    ## [4,]    8   16   24

There are a lot of other operations that we will see elsewhere.

## Subsetting based on a condition

One important set of tools involves selecting elements that meet a
certain condition. You could “eyeball” a dataset and choose the rows
and/or columns you need, but that gets really hard, really quick. We
want R to choose the rows and columns for us.

In our original matrix *m2*, we can turn it into a dataframe amd note
how it looks:

``` r
m2<-as.data.frame(m2)
m2
```

    ##   V1 V2 V3
    ## 1  1  5  9
    ## 2  2  6 10
    ## 3  3  7 11
    ## 4  4  8 12

The numbers on the left are row names, not numbers. It is not an
additional variable. This is a coincidence that they match the numbers
in the first actual column of data. In time series, these could be
dates.

In this format, we can also select columns using the *$* sign. (This
doesn’t work in time series, though, so I use the brackets a lot more.).
In this example, the first column is assigned the label “V1.”

``` r
m2$V1
```

    ## [1] 1 2 3 4

We can choose only the rows where V1 is greater than 2. Eyeballing it
tells us that it’s Rows 3 and 4, but we can only do that because the
dataset is so small. So while we *could* just write *m2\[c(3,4),\]*,
that only works in one particular case.

``` r
m2[c(3,4),]
```

    ##   V1 V2 V3
    ## 3  3  7 11
    ## 4  4  8 12

We can break the procedure down into steps, by first stating the
condition:

``` r
m2$V1>2
```

    ## [1] FALSE FALSE  TRUE  TRUE

This gives us a TRUE/FALSE (Boolean) list of rows that show where the
condition is/is not met.

To get the corresponding row numbers, we use the *which()* command:

``` r
which(m2$V1>2)
```

    ## [1] 3 4

The next step replaces the numbers *c(3,4)* (the one-time case) with
what R calculated. This would work on any matrix, no matter what the
numbers or the order.

``` r
m2[m2$V1>2,]
```

    ##   V1 V2 V3
    ## 3  3  7 11
    ## 4  4  8 12

We can do multiple conditions as well. If we want to see which rows have
the third column less than 12, we simply can enter:

``` r
m2[which(m2$V3<12),]
```

    ##   V1 V2 V3
    ## 1  1  5  9
    ## 2  2  6 10
    ## 3  3  7 11

For both conditions to be true, we want the *overlap*. First we had Rows
3 and 4; here we have 1, 2, and 3. This command gives us the one row
that matches both:

``` r
m2[which(m2$V3<12 & m2$V1>2),]
```

    ##   V1 V2 V3
    ## 3  3  7 11

You can also do the Union (where either condition is met) with the \|
sign, but here that would give us all the rows!

Onother good way to find the largest or smallest numbers in a dataset
are *which.max()* and *which.min()*:

``` r
which.max(m2$V3)
```

    ## [1] 4

That gives the *position*, not the *value*. So it has to be placed in
the matrix:

``` r
m2[which.max(m2$V3),]
```

    ##   V1 V2 V3
    ## 4  4  8 12

If you just want the second column from that, you can put it in the
column position of *(rows, columns)*

``` r
m2[which.max(m2$V3),2]
```

    ## [1] 8

The next step is do open and work with “real” data; the other examples
do a lot of this.
