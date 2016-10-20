# Tuple

A tuple is an immutable, ordered sequence of elements. Once a tuple is created, it cannot be modified. A tuple is an easy way to pack elements, of any type, into a container. It can be also be thought of as a dynamic user defined type.

## Creating a tuple

General Syntax:
```julia
(ITEM_1, ITEM_2 ... ITEM_N)
```

The contents of a tuple need not be homogenous:
```julia
julia> typeof((1, 1.0, "1", true))
Tuple{Int64,Float64,String,Bool}
```

## Tuple of tuples

A tuple can contain tuples:
```julia
julia> typeof(((1,2), 3.0, "4"))
Tuple{Tuple{Int64,Int64},Float64,String}
```

## Accessing elements

The `getindex` operator `[]` can be used to obtain an element at a specific position.

### Getting a single element (Unit Getindex)
```julia
julia> (1,2,3)[1]
1
```

### Getting a range of elements (Ranged Getindex)
```julia
julia> (1,2,3,4,5)[2 : 4]
```

### Getting a set of discontiguous elements (Vector Getindex)
```julia
julia> (1,2,3,4,5)[[1,3,5]]
```

## Splice operator

The contents of an tuple can be unpacked into the arguments of a function, using the `...` operator. For example:
```julia
julia> f(x, y) = x + y
f (generic function with 1 method)

julia> t = (1, 2)
(1,2)

julia> f(t...)
3
```
