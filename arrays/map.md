# Doing Something with Every Element in a List

Most use cases of Arrays involve iterating over each element in the array, and applying some operation on each element. The result could be new array, changes to the same array, or an aggregate of some kind.

## Iteration

Julia provides the `in` operator which when used in conjunction with the `in` operator, can be used to iterate over every element in the list:

```julia
julia> for item in ["A","B","C"]
          println(item)
       end
A
B
C
```

To iterate over every element in the list and keep track of the index of the element, the `enumerate` iterator can be used:

```julia
julia> for (index,item) in enumerate(["A","B","C"])
           println("$(index) -> $(item)")
       end
1 -> A
2 -> B
3 -> C
```

To simply iterate over the indices of an array, the `eachindex` function can be used:

```julia
julia> for index in eachindex(["A","B","C"])
           println(index)
       end
1
2
3
```

To iterate over multiple arrays at the same time, use the `zip` iterator:

```julia
julia> for (item1,item2) in zip(["A","B","C"], ["a","b","c"])
          println(item1, " ", item2)
       end
 A a
 B b
 C c
```

## Map

If you want to perform the same operation, specified by a function `f`, on every element of an array: `map(f, ARRAY)`. For example, to increment every element in the array by one:

```julia
julia> map(x -> x + 1, [1,2,3])
3-element Array{Int64,1}:
 2
 3
 4
```
