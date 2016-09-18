# DataFrames Recipes

This file contains concrete examples for getting started with [DataFrames](https://github.com/JuliaStats/DataFrames.jl) in Julia. Some of the examples and documentation shown here are borrowed from the DataFrames.jl [documentation](http://juliastats.github.io/DataFrames.jl/stable/). Efforts have been made to match the use cases in popular DataFrames cookbooks for other languages, such as the [Pandas](https://github.com/jvns/pandas-cookbook) cookbook for Python.

Plotting is accomplished using [PyPlot](https://github.com/JuliaPy/PyPlot.jl) which requires Python and Matplotlib.

## Required Packages

```julia

julia> Pkg.add("DataFrames")   # Obtain the DataFrames package
julia> Pkg.add("PyPlot")       # Obtain the PyPlot package
```

## Loading Packages

```julia
julia> using DataFrames        # Load the DataFrames package
julia> using PyPlot            # Load the PyPlot package
```

## Reading Delimiter-Separated data

The `readtable` function from `DataFrames.jl` can be used to read the contents of a `CSV/TSV/WSV` file into a
DataFrame. A call to `readtable` typically looks like:

```julia
readtable("FILENAME"; [KEYWORD_ARGS]...)
```

Some of the keyword arguments, described in the `readtable` docstring, are:

1. `header::Bool=true` – Use the information from the file's header line to determine column names.
2. `separator::Char` – Assume that fields are split by the separator character. If not specified, it will be guessed from the filename.
3. `allowcomments::Bool=false` – Ignore all text inside comments. Defaults to false.
4. `skipblanks::Bool=true` – Skip any blank lines in input. Defaults to true.

You can see the entire list of keyword arguments using:

```julia
julia> ?readtable
```

Since the dataset has commented lines, we set the `allowcomments` argument to `true`.

```julia

julia> filename = joinpath(Pkg.dir("JuliaCookbook"), "datasets", "baseball_players.tsv") # Locate the dataset
julia> df = readtable(filename; allowcomments=true)                                      # Read the DataFrame
1033×6 DataFrames.DataFrame
│ Row  │ Name                 │ Team  │ Position            │ Height_inches_ │ Weight_pounds_ │ Age   │
├──────┼──────────────────────┼───────┼─────────────────────┼────────────────┼────────────────┼───────┤
│ 1    │ "Adam_Donachie"      │ "BAL" │ "Catcher"           │ 74             │ 180            │ 22.99 │
│ 2    │ "Paul_Bako"          │ "BAL" │ "Catcher"           │ 74             │ 215            │ 34.69 │
│ 3    │ "Ramon_Hernandez"    │ "BAL" │ "Catcher"           │ 72             │ 210            │ 30.78 │
│ 4    │ "Kevin_Millar"       │ "BAL" │ "First_Baseman"     │ 72             │ 210            │ 35.43 │
│ 5    │ "Chris_Gomez"        │ "BAL" │ "First_Baseman"     │ 73             │ 188            │ 35.71 │
│ 6    │ "Brian_Roberts"      │ "BAL" │ "Second_Baseman"    │ 69             │ 176            │ 29.39 │
│ 7    │ "Miguel_Tejada"      │ "BAL" │ "Shortstop"         │ 69             │ 209            │ 30.77 │
│ 8    │ "Melvin_Mora"        │ "BAL" │ "Third_Baseman"     │ 71             │ 200            │ 35.07 │
│ 9    │ "Aubrey_Huff"        │ "BAL" │ "Third_Baseman"     │ 76             │ 231            │ 30.19 │
│ 10   │ "Adam_Stern"         │ "BAL" │ "Outfielder"        │ 71             │ 180            │ 27.05 │
⋮
│ 1025 │ "Jason_Isringhausen" │ "STL" │ "Relief_Pitcher"    │ 75             │ 230            │ 34.48 │
│ 1026 │ "Ricardo_Rincon"     │ "STL" │ "Relief_Pitcher"    │ 69             │ 190            │ 36.88 │
│ 1027 │ "Braden_Looper"      │ "STL" │ "Relief_Pitcher"    │ 75             │ 220            │ 32.34 │
│ 1028 │ "Randy_Flores"       │ "STL" │ "Relief_Pitcher"    │ 72             │ 180            │ 31.58 │
│ 1029 │ "Josh_Hancock"       │ "STL" │ "Relief_Pitcher"    │ 75             │ 205            │ 28.89 │
│ 1030 │ "Brad_Thompson"      │ "STL" │ "Relief_Pitcher"    │ 73             │ 190            │ 25.08 │
│ 1031 │ "Tyler_Johnson"      │ "STL" │ "Relief_Pitcher"    │ 74             │ 180            │ 25.73 │
│ 1032 │ "Chris_Narveson"     │ "STL" │ "Relief_Pitcher"    │ 75             │ 205            │ 25.19 │
│ 1033 │ "Randy_Keisler"      │ "STL" │ "Relief_Pitcher"    │ 75             │ 190            │ 31.01 │
│ 1034 │ "Josh_Kinney"        │ "STL" │ "Relief_Pitcher"    │ 73             │ 195            │ 27.92 │
```

## Selecting Columns

The `DataFrame` object behaves like a 2D array. Therefore, the first column (Name) can be extracted by simply running:
```julia
julia> df[1]
1034-element DataArrays.DataArray{String,1}:
 "Adam_Donachie"     
 "Paul_Bako"         
 "Ramon_Hernandez"   
 "Kevin_Millar"      
 "Chris_Gomez"            
 ⋮                        
 "Brad_Thompson"     
 "Tyler_Johnson"     
 "Chris_Narveson"    
 "Randy_Keisler"     
 "Josh_Kinney"       

```

Columns can also be extracted by specifying a column-name. The column-name is supplied using a Symbol.

```julia
julia> df[:Age]
1034-element DataArrays.DataArray{Float64,1}:
 22.99
 34.69
 30.78
 35.43
 35.71
  ⋮
 25.08
 25.73
 25.19
 31.01
 27.92
```

## Selecting Rows

The `DataFrame` object's 2D array behavior can be used to fetch rows, in a Sub-DataFrame.

```julia
julia> df[1:5, :]
5×6 DataFrames.DataFrame
│ Row │ Name              │ Team  │ Position        │ Height_inches_ │ Weight_pounds_ │ Age   │
├─────┼───────────────────┼───────┼─────────────────┼────────────────┼────────────────┼───────┤
│ 1   │ "Adam_Donachie"   │ "BAL" │ "Catcher"       │ 74             │ 180            │ 22.99 │
│ 2   │ "Paul_Bako"       │ "BAL" │ "Catcher"       │ 74             │ 215            │ 34.69 │
│ 3   │ "Ramon_Hernandez" │ "BAL" │ "Catcher"       │ 72             │ 210            │ 30.78 │
│ 4   │ "Kevin_Millar"    │ "BAL" │ "First_Baseman" │ 72             │ 210            │ 35.43 │
│ 5   │ "Chris_Gomez"     │ "BAL" │ "First_Baseman" │ 73             │ 188            │ 35.71 │
```

A subset of columns can also be fetched:

```julia
julia> df[1:5, [:Name, :Position, :Age]]
5×3 DataFrames.DataFrame
│ Row │ Name              │ Position        │ Age   │
├─────┼───────────────────┼─────────────────┼───────┤
│ 1   │ "Adam_Donachie"   │ "Catcher"       │ 22.99 │
│ 2   │ "Paul_Bako"       │ "Catcher"       │ 34.69 │
│ 3   │ "Ramon_Hernandez" │ "Catcher"       │ 30.78 │
│ 4   │ "Kevin_Millar"    │ "First_Baseman" │ 35.43 │
│ 5   │ "Chris_Gomez"     │ "First_Baseman" │ 35.71 │
```

## Null Values

Real world data samples are often incomplete, and therefore the `DataFrames` package uses the `NA` object to denote a null value, or the absence of data.

The `NA` objects poisons the data, and must be removed before any data analysis can be done. For example,
`Kirk_Saarloos`'s weight is missing in the dataset (Row 641). Therefore, its not possible to calculate the mean weight
of baseball players until his data is removed.

```julia
julia> mean(df[:Weight_pounds_])         # Poisoned data
NA

julia> mean(dropna(df[:Weight_pounds_])) # Mean of un-poisoned data
201.6892545982575
```

Alternatively, the entire row containing `Kirk_Saarloos`'s data can be deleted.
```julia
deleterows!(df, 641)
```

## Plotting

A simple plot of Age vs `Weight`:

```julia
plot(df[:Age], df[:Height_inches_])
