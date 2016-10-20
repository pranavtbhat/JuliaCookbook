# Converting R code to Julia

This file contains some of the key differences between R and Julia, and should help you convert your R codebase into Julia.

## Block Termination
R uses the `{}` to denote a block of statements, as opposed to Julia which uses the `end` keyword to terminate a block of statements.
## Assignment

Julia doesn't allow the `<-`, `<<-` and `->` operators that are used commonly in R code.

## Array Creation

R     : `c(1,2,3)`
Julia : `[1,2,3]`

## Matrix Multiplication

R     : `A %*% B`
Julia : `A * B`
