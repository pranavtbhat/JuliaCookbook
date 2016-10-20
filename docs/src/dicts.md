# Dictionaries

Julia supports the `Dict` data structure, a simple implementation of a look-up table or hashmap.

## Creating a dictionary

The `Dict` constructor accepts a list of pairs as arguments, and returns a dictionary.
```julia
julia> Dict("One" => 1, "Two" => 2, "Three" => 3)
Dict{String,Int64} with 3 entries:
  "One"   => 1
  "Two"   => 2
  "Three" => 3
```

The `Dict` constructor also allows for comprehension-like syntax:

```julia
julia> Dict("$i" => i for i in 1 : 3)
Dict{String,Int64} with 3 entries:
  "1" => 1
  "2" => 2
  "3" => 3
```
## Accessing the elements of a dictionary

The getindex operator can be used to fetch the value corresponding to the input key. However, if the key doesn't exist in the dictionary, an error is thrown.

```julia
d = Dict("One" => 1, "Two" => 2, "Three" => 3)

julia> d["One"]
1

julia> d["Four"]
ERROR: KeyError: key "Four" not found
```

Alternativey, the `get` function can be used to fetch the value corresponding to the key, while specifying a default value.

```julia
julia> get(d, "Four", 4)
4
```

## Map

The map function can be used to perform an operation on every key/value in a dictionary, producing a new dictionary:

```julia
d = Dict("One" => 1, "Two" => 2, "Three" => 3)

julia> map(x -> (string(x[1], "s") => fill(x[2], x[2])), d)
Dict{String,Array{Int64,1}} with 3 entries:
  "Twos"   => [2,2]
  "Ones"   => [1]
  "Threes" => [3,3,3]
```


## Filter

The `filter` function can be used to remove key-value pairs that do not satisfy a condition.

```julia
d = Dict("One" => 1, "Two" => 2, "Three" => 3)

julia> filter((key, value) -> value % 2 == 1, d)
Dict{String,Int64} with 2 entries:
  "One"   => 1
  "Three" => 3
```
