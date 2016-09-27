# Date-Time

Julia provides the immutable `Date` and `DateTime` data structures for working with dates. The `Date` object stores only a date and can be created as:

```julia
Date(YEAR, MONTH, DAY)

julia> Date(2016, 9, 26)
2016-09-26
```

Alternatively a format string can be passed in for a custom date string:
```julia
julia> Date("26/09/2016", "dd/mm/yyyy")
2016-09-26

julia> Date("09-26-2016", "mm-dd-yyyy")
2016-09-26
```

The `DateTime` object can be used to work with both date and time, and accepts a variable number of arguments:

```julia
DateTime([YEAR], [MONTH], [DAY], [HOURS], [MINUTES], [SECONDS], [MILLI SECONDS])

julia> DateTime(2016)
2016-01-01T00:00:00

julia> DateTime(2016, 09, 26, 5, 30)
2016-09-26T05:30:00
```

The `DateTime` function also accepts a format string for date strings:
```julia
julia> DateTime("20160926 173000","yyyymmdd HHMMSS")
2016-09-26T17:30:00
```

## Finding Today's Date

To fetch a `Date` object containing the current date:
```julia
julia> Dates.today()
2016-09-26
```

To fetch a `DateTime` object containing the current date and time:
```julia
julia> Dates.now()
2016-09-26T18:56:04.868
```

## Accessing Date-Time fields

Julia provides functions to access the individual fields in a `DateTime` or `Date` object:

```julia
julia> using Dates

julia> t = DateTime(2016, 9, 26, 17, 30, 0)
2016-09-26T17:30:00

julia> Dates.year(t)
2016

julia> Dates.month(t)
9

julia> Dates.day(t)
26

julia> Dates.hour(t)
17

julia> Dates.minute(t)
30

julia> Dates.second(t)
0
```

## Converting a Date-Time object to Epoch seconds

Julia provides the `datetime2epochms` function to convert the date denoted by a `DateTime` object into the number of seconds elapsed since the rounding epoch date-time `0000-01-01T00:00:00`:

```julia
julia> Dates.datetime2epochms(Dates.now())
63642136200066
```

## Converting Epoch Seconds to a Date-Time object

Julia provides the `epochms2datetime` function to convert the date denoted by the number of milliseconds elapsed since the rounding epoch date-time, into a `DateTime` object:

```julia
julia> Dates.epochms2datetime(63642136200066)
2016-09-26T19:10:00.066
```

## Adding to or Subtracting from a Date

`Date` objects can be subtracted to yield a result in days:

```julia
julia> Date(2016, 09, 26) - Date(2016, 07, 13)
75 days
```

Similarly, `DateTime` objects can be subtracted to yield a result in milliseconds:

```julia
julia> DateTime(2016, 09, 26, 5, 20, 26) - DateTime(2016, 07, 13, 11, 19)
6458486000 milliseconds
```
Additionally, individual `DateTime` components can be added or subtracted from both `Date` and `DateTime` objects, to yield new objects:

```julia
julia> Date(2016, 09, 26) - Dates.Year(1) + Dates.Day(10)
2015-10-06

julia> DateTime(2016, 09, 26, 5, 20, 26) - Dates.Month(2) + Dates.Hour(3) - Dates.Second(10)
2016-07-26T08:20:16
```

## Day in a Week/Month/Year or Week Number

Julia provides query functions for `DateTime` objects:

```julia
julia> t = Dates.now()
2016-09-26T19:25:01.028

julia> Dates.dayofweek(t)
1

julia> Dates.dayofmonth(t)
26

julia> Dates.dayofyear(t)
270

julia> Dates.week(t)
39
```
