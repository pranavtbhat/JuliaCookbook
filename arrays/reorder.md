# Reordering the elements

## Sorting

Julia provides the highly customizable `sort` method to put the elements of an array in a specific order. `sort` leaves the original array intact, and produces a new sorted array by copying in the elements from the original array. `Sort` accepts the following keyword arguments:
- `alg` : The sorting algorithm to be used. Can be one of `[InsertionSort, MergeSort, QuickSort]`.
- `by`  : Pass in a function to be applied on each element of the array before sorting.
- `lt`  : Pass in a function that can be used to compare any two elements in the array.
- `rev` : Boolean argument which sorts in reverse, or decreasing order, when set to true.

The `sort` function will never modify the elements in the array.

```julia
julia> sort([3,1,2])
3-element Array{Int64,1}:
 1
 2
 3

julia> sort([1,2,3], by = x -> - x)
3-element Array{Int64,1}:
 3
 2
 1

julia> sort([1,2,3], lt = (x,y) -> !(x < y))
3-element Array{Int64,1}:
 3
 2
 1

julia> sort([1,2,3], rev=true)
3-element Array{Int64,1}:
 3
 2
 1
```

If you'd like to sort the original array, without creating a copy, use the `sort!` function instead.

## Reverse

To simply reverse the contents of an array:
```julia
julia> reverse([1,2,3])
3-element Array{Int64,1}:
 3
 2
 1
```
Like `sort`, the `reverse` function creates a copy of the argument array and reverses that. If you'd like to reverse the input array, use the `reverse!` function.


## Randomize

To put the elements of an array in a random order, use the `shuffle` function:

```julia
julia> shuffle([1,2,3,4,5])
5-element Array{Int64,1}:
 4
 1
 5
 3
 2
```

If you want to randomize the original array itself, instead of its copy, use the `shuffle!` function.
