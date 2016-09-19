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

## Handling different comment marks

The `readtable` function assumes that comment lines begin with the '#' character. Therefore, the default `readtable` invocation looks like:

```julia
julia> readtable("FILE_NAME"; allowcomments=true, commentmark='#')
```

If your dataset uses a different character to indicate commented lines, specify the character using the `commentmark` keyword argument. For example, if your dataset uses the `%` character:

```julia
julia> readtable("FILE_NAME"; allowcomments=true, commentmark='%')
```
## Multiple missing value strings

By default, `readtable` translates the strings `""` and `"NA"` into null values or `NA`s. If your dataset uses different or additional strings to represent null values, you can set the `nastrings` keyword argument to these strings. For example, if your dataset contains `"null"`, `"NULL"` and `"-"` to indicate null values, then run:

```julia
julia> readtable("FILE_NAME"; nastrings=["null", "NULL", "-"])
```

## Reading a subset of rows
By default, `readtable` reads the entire file into a dataframe. Therefore, the default `readtable` invocation looks like:

```julia
julia> readtable("FILE_NAME"; nrows=-1)
```

If you're interested in the first few lines or don't want to overwhelm your memory, specify the number of rows you want to read with the `nrows` keyword argument. For example, to read the first 500 lines:

```julia
julia> readtable("FILE_NAME"; nrows=500)
```

If you want to skip the first few lines, set the `skipstart` keyword argument. For example to skip the first 500 lines:

```julia
julia> readtable("FILE_NAME"; skipstart=500)
```

To skip specific lines in the file, set the `skiprows` keyword argument to an array containing the rows you want to skip. For example to skip rows `[10, 50, 100]`:

```julia
julia> readtable("FILE_NAME"; skiplines=[10, 50, 100])
```

A complex combination of lines can be read by using one or more of `nrows`, `skipstart` and `skiprows`.

## Reading from compressed files

The GZip package can be used to read `DataFrame`s from compressed files. The general syntax to do this is:

```julia
julia> GZip.open("FILE_NAME.gz") do f
           readtable(f; [KEYWORD_ARGS]...)
       end
```

To read a compressed version of the baseball players dataset:
```julia
julia> filename = joinpath(Pkg.dir("JuliaCookbook"), "datasets", "baseball_players.tsv.gz") # Locate the dataset
julia> GZip.open(filename) do f
           readtable(f; allowcomments=true, separator='\t')
       end
1034×6 DataFrames.DataFrame
│ Row  │ Name                 │ Team  │ Position            │ Height_inches_ │ Weight_pounds_ │ Age   │
├──────┼──────────────────────┼───────┼─────────────────────┼────────────────┼────────────────┼───────┤
│ 1    │ "Adam_Donachie"      │ "BAL" │ "Catcher"           │ 74             │ 180            │ 22.99 │
│ 2    │ "Paul_Bako"          │ "BAL" │ "Catcher"           │ 74             │ 215            │ 34.69 │
│ 3    │ "Ramon_Hernandez"    │ "BAL" │ "Catcher"           │ 72             │ 210            │ 30.78 │
│ 4    │ "Kevin_Millar"       │ "BAL" │ "First_Baseman"     │ 72             │ 210            │ 35.43 │
│ 5    │ "Chris_Gomez"        │ "BAL" │ "First_Baseman"     │ 73             │ 188            │ 35.71 │
  ⋮
│ 1030 │ "Brad_Thompson"      │ "STL" │ "Relief_Pitcher"    │ 73             │ 190            │ 25.08 │
│ 1031 │ "Tyler_Johnson"      │ "STL" │ "Relief_Pitcher"    │ 74             │ 180            │ 25.73 │
│ 1032 │ "Chris_Narveson"     │ "STL" │ "Relief_Pitcher"    │ 75             │ 205            │ 25.19 │
│ 1033 │ "Randy_Keisler"      │ "STL" │ "Relief_Pitcher"    │ 75             │ 190            │ 31.01 │
│ 1034 │ "Josh_Kinney"        │ "STL" │ "Relief_Pitcher"    │ 73             │ 195            │ 27.92 │
```

## Reading from pipes

Julia can run external programs, especially shell script, from within the REPL. The backtick notation is used to represent commands. For commands that return pipes, or streams of data, Julia can treat the output as a file to read the DataFrame. The general syntax for such a workflow is:

```julia
julia> open(`COMMAND`) do f
          readtable(f)
       end
```
The file `baseball_players.tsv.gz` can be uncompressed onto STDOUT using the command ``gzip -cd baseball_players.tsv.gz``. The DataFrame can therefore be read as:

```julia
julia> filename = joinpath(Pkg.dir("JuliaCookbook"), "datasets", "baseball_players.tsv.gz") # Locate the dataset
julia> open(`gzip -cd $filename`) do f
           readtable(f; allowcomments=true, separator='\t')
       end
1034×6 DataFrames.DataFrame
│ Row  │ Name                 │ Team  │ Position            │ Height_inches_ │ Weight_pounds_ │ Age   │
├──────┼──────────────────────┼───────┼─────────────────────┼────────────────┼────────────────┼───────┤
│ 1    │ "Adam_Donachie"      │ "BAL" │ "Catcher"           │ 74             │ 180            │ 22.99 │
│ 2    │ "Paul_Bako"          │ "BAL" │ "Catcher"           │ 74             │ 215            │ 34.69 │
│ 3    │ "Ramon_Hernandez"    │ "BAL" │ "Catcher"           │ 72             │ 210            │ 30.78 │
│ 4    │ "Kevin_Millar"       │ "BAL" │ "First_Baseman"     │ 72             │ 210            │ 35.43 │
│ 5    │ "Chris_Gomez"        │ "BAL" │ "First_Baseman"     │ 73             │ 188            │ 35.71 │
⋮
│ 1030 │ "Brad_Thompson"      │ "STL" │ "Relief_Pitcher"    │ 73             │ 190            │ 25.08 │
│ 1031 │ "Tyler_Johnson"      │ "STL" │ "Relief_Pitcher"    │ 74             │ 180            │ 25.73 │
│ 1032 │ "Chris_Narveson"     │ "STL" │ "Relief_Pitcher"    │ 75             │ 205            │ 25.19 │
│ 1033 │ "Randy_Keisler"      │ "STL" │ "Relief_Pitcher"    │ 75             │ 190            │ 31.01 │
│ 1034 │ "Josh_Kinney"        │ "STL" │ "Relief_Pitcher"    │ 73             │ 195            │ 27.92 │
```

You could also extract a DataFrame from the output of a Perl script. For example, if you want only alternate rows in the DataFrame, you would do:

```julia
julia> filename = joinpath(Pkg.dir("JuliaCookbook"), "datasets", "baseball_players.tsv") # Locate the dataset
julia> open(`perl -ne 'print if $. %2' $filename`) do f
           readtable(f; allowcomments=true, separator='\t')
       end
517×6 DataFrames.DataFrame
│ Row │ Name               │ Team  │ Position           │ Height_inches_ │ Weight_pounds_ │ Age   │
├─────┼────────────────────┼───────┼────────────────────┼────────────────┼────────────────┼───────┤
│ 1   │ "Paul_Bako"        │ "BAL" │ "Catcher"          │ 74             │ 215            │ 34.69 │
│ 2   │ "Kevin_Millar"     │ "BAL" │ "First_Baseman"    │ 72             │ 210            │ 35.43 │
│ 3   │ "Brian_Roberts"    │ "BAL" │ "Second_Baseman"   │ 69             │ 176            │ 29.39 │
│ 4   │ "Melvin_Mora"      │ "BAL" │ "Third_Baseman"    │ 71             │ 200            │ 35.07 │
│ 5   │ "Adam_Stern"       │ "BAL" │ "Outfielder"       │ 71             │ 180            │ 27.05 │
⋮
│ 513 │ "Ricardo_Rincon"   │ "STL" │ "Relief_Pitcher"   │ 69             │ 190            │ 36.88 │
│ 514 │ "Randy_Flores"     │ "STL" │ "Relief_Pitcher"   │ 72             │ 180            │ 31.58 │
│ 515 │ "Brad_Thompson"    │ "STL" │ "Relief_Pitcher"   │ 73             │ 190            │ 25.08 │
│ 516 │ "Chris_Narveson"   │ "STL" │ "Relief_Pitcher"   │ 75             │ 205            │ 25.19 │
│ 517 │ "Josh_Kinney"      │ "STL" │ "Relief_Pitcher"   │ 73             │ 195            │ 27.92 │
```

Julia allows a command to pipe its output into the next command, using the `pipeline` method. The general syntax for such a construct would be:

```julia
julia> pipeline(`COMMAND_1`, `COMMAND_2` ... `COMMAND_N`)
```

A DataFrame consisting of alternate rows can be extracted from the compressed dataset by running:
```julia
julia> filename = joinpath(Pkg.dir("JuliaCookbook"), "datasets", "baseball_players.tsv.gz") # Locate the dataset
julia> open(pipeline(`gzip -cd $filename`, `perl -ne 'print if $. % 2'`)) do f
          readtable(f; allowcomments=true, separator='\t')
       end
517×6 DataFrames.DataFrame
│ Row │ Name               │ Team  │ Position           │ Height_inches_ │ Weight_pounds_ │ Age   │
├─────┼────────────────────┼───────┼────────────────────┼────────────────┼────────────────┼───────┤
│ 1   │ "Paul_Bako"        │ "BAL" │ "Catcher"          │ 74             │ 215            │ 34.69 │
│ 2   │ "Kevin_Millar"     │ "BAL" │ "First_Baseman"    │ 72             │ 210            │ 35.43 │
│ 3   │ "Brian_Roberts"    │ "BAL" │ "Second_Baseman"   │ 69             │ 176            │ 29.39 │
│ 4   │ "Melvin_Mora"      │ "BAL" │ "Third_Baseman"    │ 71             │ 200            │ 35.07 │
│ 5   │ "Adam_Stern"       │ "BAL" │ "Outfielder"       │ 71             │ 180            │ 27.05 │
⋮
│ 513 │ "Ricardo_Rincon"   │ "STL" │ "Relief_Pitcher"   │ 69             │ 190            │ 36.88 │
│ 514 │ "Randy_Flores"     │ "STL" │ "Relief_Pitcher"   │ 72             │ 180            │ 31.58 │
│ 515 │ "Brad_Thompson"    │ "STL" │ "Relief_Pitcher"   │ 73             │ 190            │ 25.08 │
│ 516 │ "Chris_Narveson"   │ "STL" │ "Relief_Pitcher"   │ 75             │ 205            │ 25.19 │
│ 517 │ "Josh_Kinney"      │ "STL" │ "Relief_Pitcher"   │ 73             │ 195            │ 27.92 │
```
