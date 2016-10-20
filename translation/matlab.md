# Converting Matlab code to Julia

Julia and Matlab have very similar syntax, with a few notable differences. This file should help you convert Matlab code into Julia.

## Package imports
The first challenge in porting your code, is finding the equivalent packages in Julia. A full list of registered Julia packages can be found at the Pkg list [website](http://pkg.julialang.org/), or at [Julia.jl](https://github.com/svaksha/Julia.jl), which provides a domain-wise list of packages. Some common matlab libraries and their equivalents include:

- Bioinformatics Toolbox -> [Bio.jl](https://github.com/BioJulia/Bio.jl)
- Statistics and Machine Learning Toolbox -> [StatsBase.jl](https://github.com/JuliaStats/StatsBase.jl), [MLBase.jl](https://github.com/JuliaStats/MLBase.jl)

Also, Julia uses the `import`, `using` and `include` constructs to import code from other files or packages.

## Array Indexing
Matlab and Julia use very similar notations for vector indexing, and differ only in the operator used: Matlab uses the `A(1,2)` notation, while Julia uses the `A[1,2]` notation.

## Assignment by reference
Most julia objects are assigned by reference. Modifications to an object will reflect on all variables pointing to it.
For exapmple:
```julia
A = [1 2 3]
B = A
push!(B, 4)

julia> A
4-element Array{Int64,1}:
 1
 2
 3
 4
```

## Imaginary Numbers
The square root of an `-1` is denoted by the symbol `im` in Julia.

```julia
julia> sqrt(complex(-1))
0.0 + 1.0im
```

Complex numbers in general are represented by the `Complex{T}` type. The complex form of a number can be obtained using the `complex` function.

## Files and functions

In Julia file names aren't associated with the functions they contain. A file may contain multiple modules and functions and can be named arbitrarily.

## Function definitions
Julia uses explicit return statements, as opposed to Matlab which uses named output arguments. The syntax for declaring anonymous functions also differs in Julia.

```julia
function f(x,y)
   return(x + y)
end

f = (x,y) -> x + y

f(x,y) = x + y
```
