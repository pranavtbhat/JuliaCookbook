# Searching

## Finding the First List Element That Passes a Test

The `findfirst` function can be used to find the position of the first non-zero element in an array:

```julia
julia> findfirst([0,0,1,2,0])
3
```

It can also be used to find the first element equal to some value `v`.
```julia
julia> findfirst([0,0,1,2,0], 2)
4
```

Finally, a boolean-returning-function can be passed in as a "test". The position of the first element to pass the "test", (i.e. the function returns true) is returned:
```julia
julia> findfirst(x -> x == 2, [0,0,1,2,0])
4
```

If `findfirst` cannot find a value, or if no element passes the "test", then it returns 0.

```julia
julia> findfirst([0,0,0])
0

julia> findfirst([0,0,0], 1)
0
```

# Finding All Elements in an Array Matching Certain Criteria

The `find` function can be used to find the positions of all non-zero elements in an array.

```julia
julia> find([0,0,1,2,0])
2-element Array{Int64,1}:
 3
 4
```

The `find` function can also be used to find the positions of all elements that pass a "test", described by a boolean-returning-function.

```julia
julia> find(x -> x == 0, [1,2,0,2,0,1,0])
3-element Array{Int64,1}:
 3
 5
 7
```
