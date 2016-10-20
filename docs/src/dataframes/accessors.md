# Accessors

This file describes methods to access the columns and rows contained in the `DataFrame`. The `baseball_players` dataset
is used in all examples. You can load it using:

```julia
julia> filename = joinpath(Pkg.dir("JuliaCookbook"), "datasets", "baseball_players.tsv") # Locate the dataset
julia> df = readtable(filename; allowcomments=true)                                      # Read the DataFrame
```

## Listing out columns

A list of columns in the DataFrame can be obtained by running `names(DATAFRAME)`:
```julia
julia> names(df)
6-element Array{Symbol,1}:
 :Name
 :Team
 :Position
 :Height_inches_
 :Weight_pounds_
 :Age
 ```

 The data types contained in the columns can be list out using `eltypes(DATAFRAME)`:
 ```julia
 julia> eltypes(df)
 6-element Array{Type,1}:
 String
 String
 String
 Int64
 Int64
 Float64
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
`Kirk_Saarloos`'s weight is missing in the dataset (Row 641). Therefore, it's not possible to calculate the mean weight
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
