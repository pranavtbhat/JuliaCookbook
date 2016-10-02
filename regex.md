# Pattern Matching

Julia supports regular expressions or regexes for string matching. The expressions must be compliant with the
[Perl Compatible Regular Expressions](http://www.pcre.org/) library.

A regular expression in Julia is denoted by a leading `r`. For example, a regular to match comments will look like:
```julia
r"^\s*(?:#|$)"
```

The `ismatch`, `match` and `replace` functions accept regular expressions.


## Matching Letters

To check if a string consists of only alphabetic characters:

```julia
julia> ismatch(r"^[A-Za-z]*$", "asdf")
true

julia> ismatch(r"^[A-Za-z]*$", "asdf123")
false
```


## Matching Words

Use the `\b` character to match at word boundaries.

```julia
julia> match(r"\bthe\b", "read the thesaurus").offset
6
```

## Finding the nth match

The `matchall` function can be used to return all occurrences of a pattern in a string. To nth match
can then be retrieved using an indexing. For example, to find the third integer in a string:

```julia
julia> matchall(r"[0-9]+", "12 apples plus 1 make 13")[3]
"13"
```

However, for larger strings, it may take a while to generate all matches. For such cases:

```julia
function nth_occurance(pattern::Regex, n::Int, str::String)
   count = 1
   idx = 1
   while idx <= length(str)
      m = match(pattern, str, idx)
      if m == nothing
         return
      elseif(count == n)
         return m.match
      else
         count += 1
         idx = m.offset + length(m.match) + 1
      end
   end

   return
end

julia> nth_occurance(r"[0-9]+", 3, "12 plus 1 make 13")
"13"
```
