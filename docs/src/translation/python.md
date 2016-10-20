# Converting Python code to Julia

This file contains some of the differences between Python and Julia, and should help you convert your Python code base into Julia.

## Indentation and Block statements

In Python indentations are used to identify statement blocks. In Julia, the keyword `end` is often used to terminate a block of statements.

```julia
# Julia
function f(x,y)
   x,y
end
```

```python
# Python
def f(x,y):
   return(x,y)

```

## Array indexing

In Julia, array indices begin with 1 unlike Python which uses 0 based indexing.

```julia
A = [1,2,3]

julia> A[0]
ERROR: BoundsError: attempt to access 3-element Array{Int64,1} at index [0]
```

## Multiple Dispatch

In Julia, methods do not belong to objects, but are implementations of generic functions. If you're used to Object oriented languages such as Python, this may seem strange. In python you'd use the `.` operator to access an objects methods. In Julia, you would pass the object as the first argument to the function. For example, to define a Class `Person` with an age accessor method in Python, you would do:

```python
class Person:
   def __init__(self, age):
      self.age = age

   def get_age(self):
      return(self.age)

p = Person(10)

python> p.get_age()
```

```julia
type Person
   age::Int
end

getAge(x::Person) = x.age

p = Person(10)

julia> getAge(p)
10
```
