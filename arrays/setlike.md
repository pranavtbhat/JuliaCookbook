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

To find the elements that are in one array, but not another, use `setdiff`. For example:

```julia
julia> setdiff([1,2,3,4], [1,2,5,6])
2-element Array{Int64,1}:
 3
 4
```

If your arrays have elements repeated, then use:
```julia
julia> filter(x -> !in(x, [1,2,4]), [1,2,2,3,3,4,6,7,7])
5-element Array{Int64,1}:
 3
 3
 6
 7
 7
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
