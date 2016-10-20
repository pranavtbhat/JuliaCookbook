# Creating an array

## 1 Dimensional Arrays
Julia provides multiple methods to create arrays. An array can be created by specifying all elements in a comma separated list.

```julia
julia> [1, 2, 3, 4, 5]
5-element Array{Int64,1}:
 1
 2
 3
 4
 5
```

An array of type `Any` can support elements of all types:
```julia
julia> Any[1, 1.0, "1", true]
4-element Array{Any,1}:
 1   
 1.0
 "1"
 true
```

An uninitialized array of type T can be created using the `Array` constructor:

```julia
julia> Array(Any, 5)
5-element Array{Any,1}:
 #undef
 #undef
 #undef
 #undef
 #undef
```

An array of zero valued elements can be created using the `zeros` function. The function can
be called as `zeros(T, n)` where `T` is a type and `n` is the size of the array:

```julia
julia> zeros(Float64, 5)
5-element Array{Float64,1}:
 0.0
 0.0
 0.0
 0.0
 0.0
```

 Similarly, an array of ones can be created using the `ones` function:

 ```julia
 julia> ones(Bool, 5)
5-element Array{Bool,1}:
 true
 true
 true
 true
 true
```
An array of random numbers can be created using the `rand` function. The function can be called as `rand(T, n)` where `T` is a numeric type and `n` is the size of the array.

```julia
julia> rand(Int, 3)
rand(Int, 3)
3-element Array{Int64,1}:
  337280521677695220
 9086787289687117354
 7160428826622140198
```

To create an array with elements in a specific range:
```julia
julia> rand(1 : 10, 3)
3-element Array{Int64,1}:
  4
 10
  4
```

## 2 Dimensional Arrays

A 2D array can be created by specifying all elements in blank separated columns and semicolon separated rows:

```julia
julia> [1 2 3 4 ; 5 6 7 8]
2×4 Array{Int64,2}:
 1  2  3  4
 5  6  7  8
```

An uninitialized 2D array of type `T` can be created as `Array(T, m, n)`, where `m` is the number of rows, and `n` is the number of columns:

```julia
julia> Array(Bool, 3, 3)
3×3 Array{Bool,2}:
 false  false  false
 false   true  false
 false  false  false
```

The `zeros`, `ones` and `rand` function can be used to produce 2D arrays, by supplying the length of the second dimension.

```julia
julia> zeros(Float64, 3, 3)
3×3 Array{Float64,2}:
 0.0  0.0  0.0
 0.0  0.0  0.0
 0.0  0.0  0.0

julia> ones(Bool, 3, 3)
3×3 Array{Bool,2}:
 true  true  true
 true  true  true
 true  true  true

julia> rand(1 : 5, 2, 2)
2×2 Array{Int64,2}:
 2  5
 4  2
```
