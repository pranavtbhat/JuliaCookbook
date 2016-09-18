# DataFrames Recipes

This file contains concrete examples for getting started with [DataFrames](https://github.com/JuliaStats/DataFrames.jl) in Julia. Efforts have been made to match the use cases in popular DataFrames cookbooks for other languages, such as the [Pandas](https://github.com/jvns/pandas-cookbook) cookbook for Python.

The `RDatasets` repository is introduced as a collection of R datatests, and the GLM.jl (Generalized Linear Models) package is used for Linear Regressions. Plotting is accomplished using [Plots.jl](https://github.com/tbreloff/Plots.jl).

## Required Packages

```julia

julia> Pkg.add("DataFrames")   # Obtain the DataFrames package
julia> Pkg.add("RDatasets")    # Obtain the RDatasets package
julia> Pkg.add("PyPlot")       # Obtain the PyPlot package
julia> Pkg.add("GLM")          # Obtain the GLM package
```

## Loading Packages

```julia
julia> using DataFrames        # Load the DataFrames package
julia> using RDatasets         # Load the RDatasets package
julia> using PyPlot            # Load the PyPlot package
julia> using GLM               # Load the GLM package
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

# R Datasets

If you miss the standard datasets from R, or just need a few sample datasets to get familiar with DataFrames, the [RDatasets](https://github.com/johnmyleswhite/RDatasets.jl) package would be a great place to look.

The list of R packages, from which datasets are available, can be obtained using:

```julia
julia> RDatasets.packages()
33×2 DataFrames.DataFrame
│ Row │ Package        │ Title                                                                     │
├─────┼────────────────┼───────────────────────────────────────────────────────────────────────────┤
│ 1   │ "COUNT"        │ "Functions, data and code for count data."                                │
│ 2   │ "Ecdat"        │ "Data sets for econometrics"                                              │
│ 3   │ "HSAUR"        │ "A Handbook of Statistical Analyses Using R (1st Edition)"                │
│ 4   │ "HistData"     │ "Data sets from the history of statistics and data visualization"         │
│ 5   │ "ISLR"         │ "Data for An Introduction to Statistical Learning with Applications in R" │
  ⋮
│ 29  │ "rpart"        │ "Recursive Partitioning and Regression Trees"                             │
│ 30  │ "sandwich"     │ "Robust Covariance Matrix Estimators"                                     │
│ 31  │ "sem"          │ "Structural Equation Models"                                              │
│ 32  │ "survival"     │ "Survival Analysis"                                                       │
│ 33  │ "vcd"          │ "Visualizing Categorical Data"                                            │
```

The datasets available from each package can be obtained by running `RDatasets.datasets("PACKAGE_NAME")`. For example, for a list of datasets for Econometrics, run:

```julia
julia> RDatasets.datasets("Ecdat")
93×5 DataFrames.DataFrame
│ Row │ Package │ Dataset            │ Title                                                      │ Rows  │ Columns │
├─────┼─────────┼────────────────────┼────────────────────────────────────────────────────────────┼───────┼─────────┤
│ 1   │ "Ecdat" │ "Accident"         │ "Ship Accidents"                                           │ 40    │ 5       │
│ 2   │ "Ecdat" │ "Airline"          │ "Cost for U.S. Airlines"                                   │ 90    │ 6       │
│ 3   │ "Ecdat" │ "Airq"             │ "Air Quality for Californian Metropolitan Areas"           │ 30    │ 6       │
│ 4   │ "Ecdat" │ "Benefits"         │ "Unemployement of Blue Collar Workers"                     │ 4877  │ 18      │
│ 5   │ "Ecdat" │ "Bids"             │ "Bids Received By U.S. Firms"                              │ 126   │ 12      │
  ⋮
│ 89  │ "Ecdat" │ "Wages1"           │ "Wages, Experience and Schooling"                          │ 3294  │ 4       │
│ 90  │ "Ecdat" │ "Workinghours"     │ "Wife Working Hours"                                       │ 3382  │ 12      │
│ 91  │ "Ecdat" │ "Yen"              │ "Yen-dollar Exchange Rate"                                 │ 778   │ 4       │
│ 92  │ "Ecdat" │ "Yogurt"           │ "Choice of Brand for Yogurts"                              │ 2412  │ 10      │
│ 93  │ "Ecdat" │ "incomeInequality" │ "Income Inequality in the US"                              │ 66    │ 22      │
```

Or you can simply get a long list of all supported datasets by running:
```julia
RDatasets.datasets()
```

Once you've identified the dataset you wish to use, it can be loaded into a DataFrame by running `dataset("PACKAGE_NAME", "DATASET_NAME")`. For example, you can load the dataset [Income Inequality in the US](https://vincentarelbundock.github.io/Rdatasets/doc/Ecdat/incomeInequality.html) by running:

```julia
ineq = dataset("Ecdat", "incomeInequality")
66×22 DataFrames.DataFrame
│ Row │ Year │ NumberThousands │ Quintile1 │ … │PersonsPerFamily │ RealGDPPerFamily │ MeanMedian │
├─────┼──────┼─────────────────┼───────────│   │─────────────────┼──────────────────┼────────────┤
│ 1   │ 1947 │ 37237           │ 14243     │ … │ 3.87051         │ 54641.2          │ 2.04158    │
│ 2   │ 1948 │ 38624           │ 13779     │ … │ 3.79637         │ 54864.9          │ 2.09587    │
│ 3   │ 1949 │ 39303           │ 13007     │ … │ 3.79584         │ 53623.1          │ 2.07767    │
│ 4   │ 1950 │ 39929           │ 13829     │ … │ 3.79884         │ 57382.2          │ 2.09177    │
│ 5   │ 1951 │ 40578           │ 15070     │ … │ 3.80223         │ 61013.9          │ 2.15917    │
│ 24  │ 1970 │ 52227           │ 26913     │ … │ 3.92688         │ 94856.2          │ 1.85394    │
  ⋮
│ 62  │ 2008 │ 78874           │ 29646     │ … │ 3.86113         │ 1.97489e5        │ 3.04476    │
│ 63  │ 2009 │ 78867           │ 28832     │ … │ 3.89567         │ 1.91972e5        │ 3.02526    │
│ 64  │ 2010 │ 79559           │ 27928     │ … │ 3.89366         │ 1.95073e5        │ 3.10811    │
│ 65  │ 2011 │ 80529           │ 27787     │ … │ 3.87483         │ 1.96284e5        │ 3.18783    │
│ 66  │ 2012 │ 80944           │ 27794     │ … │ 3.88266         │ 200704.0         │ 3.25129    │
```

## Plotting

A simple plot of `Year` vs `Income Skew (MeanMedian)` can be drawn by running:

```julia
plot(ineq[:Year], ineq[:MeanMedian]; title="Income inequality in the US", xlabel="Year", ylabel="Skew of Real GDP per Family")
```
![Income inequality in the US](https://github.com/pranavtbhat/JuliaCookbook/blob/master/ineq_skew_plot.png)

More plotting examples can be obtained at the Plots.jl [documentation](https://juliaplots.github.io/).

## Regressions

Fitting `RealGDPPerFamily` to the `Year` is as simple as:

```julia
linearmodel = fit(LinearModel, RealGDPPerFamily ~ Year, ineq)
c, m = coef(linearmodel)
f(x) = m*x + c
p1 = plot(ineq[:Year], ineq[:RealGDPPerFamily],
    smooth=true,
    seriestype=:scatter,
    title = "RealGDPPerFamily vs Year",
    linewidth=8,
    linealpha=0.5,
    label="data")

plot!(f, 2, 20, label="correlation")
```

![Real GDP per Family vs Year](https://github.com/pranavtbhat/JuliaCookbook/blob/master/linear_regression_ineq.png)


## References
* [DataFrames.jl documentation](https://dataframesjl.readthedocs.io/en/latest/)
* [DataFrames.jl Wiki](https://en.wikibooks.org/wiki/Introducing_Julia/DataFrames)
* [RDatasets.jl](https://github.com/johnmyleswhite/RDatasets.jl)
* [Plots.jl documentation](https://juliaplots.github.io/)
* [GLM.jl](https://github.com/JuliaStats/GLM.jl)
