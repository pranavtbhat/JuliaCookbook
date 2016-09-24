# Strings

A string in Julia is an immutable sequence of characters. In previous versions of Julia, the string type was implemented through an abstract type `AbstractString` and concrete types such as `ASCIIString`. Now, Julia provides a single `String` datatype.

## Accessing Substrings

Julia doesn't allow modifications to `String` object, once it's created. However, it does provide ways of generating substrings. The getindex notation `[]` can be used on `String`s, in the same way that you'd extract sub-arrays:

```julia
julia> str = "abcdefg"
"abcdefg"

julia> str[1:3]
"abc"

julia> str[5:end]
"efg"
```

If your string has delimiting characters such as `' ', '\t' or ','`, you can use the `split` function to split it:

```julia
julia> split("1,2,3,4,5", ',')
5-element Array{SubString{String},1}:
 "1"
 "2"
 "3"
 "4"
 "5"
```

You can also combine smaller strings, while inserting characters between them:

```julia
julia> join(["1", "2", "3", "4", "5"], ',')
"1,2,3,4,5"
```


## Processing a String One Character at a Time

Strings in Julia are similar to Arrays. You can iterate over the characters in a `String` the same way you'd iterate over the elements in an array:

```julia
julia> for ch in "abcd"
          println(ch)
       end
 a
 b
 c
 d
```

You can also use the `map` function if you want to perform the same operation over every character in the `String`:

```julia
julia> map(x -> x + 1, "abcd") # Increment every character in the string
"bcde"
```

## Reversing a String by Word or Character

To reverse every character in the `String`, use the `reverse` function:

```julia
julia> reverse("abcdefg")
"gfedcba"
```

If you want to reverse the individual words in the `String`:
1. First split the string into constituent words using `split`
2. Perform a reversal on every word
3. Use `join` to combine the words

```julia
julia> join(map(reverse, split("abc def ghi jkl", ' ')), ' ')
"cba fed ihg lkj"
```

## Expanding and Compressing Tabs

If you have a file with tab-spaces that you'd like to replace space-indents, use the `replace` function:

```julia
julia> filename = joinpath(Pkg.dir("JuliaCookbook"), "datasets", "baseball_players.tsv")

julia> open(filename) do f
          str = readstring(f)
          replace(str, r"(\t)", s"   ")
       end
```

## Expanding Variables in User Input (Interpolation)

The `$` notation can be used to substitute a user defined variable or expression (its string equivalent to be more precise) into any position in a string:

```julia
julia> "two = $(1 + 1)"
"two = 2"

julia> a = "Hello"

julia> "$a World"
"Hello World"
```

## Changing Case

A string can be converted to lower case using the `lowercase` function, and the `islower` function can be used to see if a string is in lower case:

```julia
julia> lowercase("aBcD")
"abcd"

julia> islower("abcd")
true
```

Similarly, the `uppercase` function can be used to convert an entire string to uppercase, and the `isupper` function can be used to see if a string is in lower case:

```julia
julia> uppercase("aBcD")
"ABCD"

julia> isupper("ABCD")
true
```

# Trimming Blanks from the Ends of a String

The `rstrip` function can be used to remove trailing blanks from a string:

```julia
julia> rstrip("Hello World       ")
"Hello World"
```

# Parsing Delimited Data

Parsing a TSV or CSV file with strings can be challenging, since the string fields can contain tabs or commas themselves. The best way to parse such a file, would be to use the `readdlm` function. `readdlm` will not consider the tabs or commas inside strings, when splitting the lines of the files.

```julia
julia> buf = IOBuffer("\"abcd\",\"abc,d\",\"ab,c,d\",\"a,b,c,d\"")

julia> readcsv(buf)
1×4 Array{Any,2}:
 "abcd"  "abc,d"  "ab,c,d"  "a,b,c,d"
```
