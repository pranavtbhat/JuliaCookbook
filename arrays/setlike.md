# Set-like operations

## Finding unique elements in the list

The `unique` function produces the list of unique elements present in an array:

```julia
julia> unique([1,1,2,2,3,3,4,4])
4-element Array{Int64,1}:
 1
 2
 3
 4
```

The `unique` function works faster when the input list comprises of sorted elements.

## Finding Elements in One Array but Not Another

The easiest way to do this is `setdiff`. For example:

```julia
julia> setdiff([1,2,3,4], [1,2,5,6])
2-element Array{Int64,1}:
 3
 4
```

## Set union

The `union` function can be used to perform the set-union operation:

```julia
julia> union([1,2,3], [1,4,5])
5-element Array{Int64,1}:
 1
 2
 3
 4
 5
```

## Set intersection

The `intersect` function can be used to perform the set-intersection operation:

```julia
julia> intersect([1,2,3,4], [1,2,3,5])
3-element Array{Int64,1}:
 1
 2
 3
```
