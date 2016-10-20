# Appending/Concatenating Arrays

Julia provides multiple methods to concatenate, combine or append arrays.

## Appending arrays

The `append!` function can be used to append two arrays. For example:

```julia
julia> append!([1,2,3], [4,5,6])
6-element Array{Int64,1}:
 1
 2
 3
 4
 5
 6
```

The `append!` function mutates the first array. The elements of the second array are copied into the first one, so the second array can be altered subsequently without affecting the first array.


## Vertical Concatenation

Arrays can be stacked vertically using the `vcat` function.

```julia
julia> vcat([1,2,3], [4,5,6])
6-element Array{Int64,1}:
 1
 2
 3
 4
 5
 6
```

`vcat` works on 2D arrays too. The input arrays must have the same number of columns.

```julia
julia> vcat([1 5 9; 2 6 10], [3 7 11; 4 8 12])
4×3 Array{Int64,2}:
 1  5   9
 2  6  10
 3  7  11
 4  8  12
```

## Horizontal Concatenation
Arrays can be stacked horizontally using the `hcat` function. The input arrays must have the same of rows.

```julia
julia> hcat([1,2,3], [4,5,6])
3×2 Array{Int64,2}:
 1  4
 2  5
 3  6

julia> hcat([1 2 3; 7 8 9], [4 5 6; 10 11 12])
2×6 Array{Int64,2}:
 1  2  3   4   5   6
 7  8  9  10  11  12
```
