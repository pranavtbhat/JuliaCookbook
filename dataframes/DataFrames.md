# DataFrames Recipes

This folder contains concrete examples for getting started with [DataFrames](https://github.com/JuliaStats/DataFrames.jl) in Julia. Efforts have been made to match the use cases in popular DataFrames cookbooks for other languages, such as the [Pandas](https://github.com/jvns/pandas-cookbook) cookbook for Python.

The [RDatasets](https://github.com/johnmyleswhite/RDatasets.jl) repository is introduced as a collection of R datatests, and [GLM.jl](https://github.com/JuliaStats/GLM.jl) (Generalized Linear Models) is used for Linear Regressions. Plotting is accomplished using [Plots.jl](https://github.com/tbreloff/Plots.jl).

Compressed files are read using [GZip.jl](https://github.com/JuliaIO/GZip.jl).

## Required Packages

```julia

julia> Pkg.add("DataFrames")
julia> Pkg.add("RDatasets")
julia> Pkg.add("PyPlot")
julia> Pkg.add("GLM")
julia> Pkg.add("GZip")
```

## Loading Packages

```julia
julia> using DataFrames
julia> using RDatasets
julia> using PyPlot
julia> using GLM
julia> using GZip
```

## Contents

- [Reading from Files](https://github.com/pranavtbhat/JuliaCookbook/blob/master/dataframes/file_input.md)
- [Accessing Data](https://github.com/pranavtbhat/JuliaCookbook/blob/master/dataframes/accessors.md)
- [RDatasets](https://github.com/pranavtbhat/JuliaCookbook/blob/master/dataframes/RDatasets.md))
- [Plotting](https://github.com/pranavtbhat/JuliaCookbook/blob/master/dataframes/plotting.md)
- [Regressions](https://github.com/pranavtbhat/JuliaCookbook/blob/master/dataframes/regressions.md)

## References
* [DataFrames.jl documentation](https://dataframesjl.readthedocs.io/en/latest/)
* [DataFrames.jl Wiki](https://en.wikibooks.org/wiki/Introducing_Julia/DataFrames)
* [RDatasets.jl](https://github.com/johnmyleswhite/RDatasets.jl)
* [Plots.jl documentation](https://juliaplots.github.io/)
* [GLM.jl](https://github.com/JuliaStats/GLM.jl)
* [GZip.jl](https://github.com/JuliaIO/GZip.jl)
