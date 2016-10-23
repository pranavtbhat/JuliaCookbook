# Three dimensional arrays

This file contains an example demonstrating the use of three dimensional arrays.

Consider the system of equations presented below:
```julia
xrange = 1 : 0.1 : 10
yrange = 1 : 0.1 : 10
zrange = 1 : 0.1 : 10

a = 1
b = 2
c = 3

f(x,y,z) = (x - a) * (y - b) * (z - c)
g(x,y,z) = (x - a) ^ 2 + (y - b) ^ 2 + (z - c) ^ 2
```

If you want to cache the values of `f` and `g` for each (x,y,z), then you'd need a three dimensional array:

```julia
type Point
   x::Float64
   y::Float64
   z::Float64
   fv::Float64
   gv::Float64
end

type Cache
   xrange::Range
   yrange::Range
   zrange::Range
   points::Array{Point,3}

   function Cache(xrange::Range, yrange::Range, zrange::Range, f::Function, g::Function)
      self = new(xrange, yrange, zrange, Array{Point,3}(length(xrange), length(yrange), length(zrange)))

      for (i,x) in enumerate(xrange), (j,y) in enumerate(yrange), (k,z) in enumerate(zrange)
         self.points[i,j,k] = Point(x, y, z, f(x,y,z), g(x,y,z))
      end
      self
   end
end

Base.show(io::IO, x::Cache) = write(io, "Three dimensional points array with $(length(x.points)) values.\n X = $(x.xrange)\n Y = $(x.yrange)\n Z = $(x.zrange)\n")

julia> cache = Cache(xrange, yrange, zrange, f, g)
Three dimensional points array with 753571 values.
 X = 1.0:0.1:10.0
 Y = 1.0:0.1:10.0
 Z = 1.0:0.1:10.0
```

Type `cache` stores the value of `f(x,y,z) and g(x,y,z)` for each `(x,y,z)`. But what if you wanted to access the closest available `f` value for some (x,y,z)? This would require you to define a `getindex` method for type `cache`:

```julia

within(i::Number, range::Range) =  minimum(range) <= i <= maximum(range)

function Base.getindex(c::Cache, x::Float64, y::Float64, z::Float64)
   i = within(x, c.xrange) ? searchsortedfirst(c.xrange, x) : error("X argument out of range")
   j = within(y, c.yrange) ? searchsortedfirst(c.yrange, y) : error("Y argument out of range")
   k = within(z, c.zrange) ? searchsortedfirst(c.zrange, z) : error("Z argument out of range")

   c.points[i,j,k]
end

julia> cache[3.56, 7.90, 9.15]
Point(3.6,7.9,9.2,95.108,80.00999999999999)
```
