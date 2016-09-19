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
