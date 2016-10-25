# Regressions

## Linear Regression on DataFrames

The examples shown below use the [Income Inequality in the US](https://vincentarelbundock.github.io/Rdatasets/doc/Ecdat/incomeInequality.html) dataset which can be loaded by running:
```julia
julia> ineq = dataset("Ecdat", "incomeInequality")
```

Fitting `RealGDPPerFamily` to the `Year` is as simple as:

```julia
linearmodel = fit(LinearModel, RealGDPPerFamily ~ Year, ineq)
c, m = coef(linearmodel)
f(x) = m*x + c
plot(
   ineq[:Year],
   ineq[:RealGDPPerFamily],
   smooth=true,
   seriestype=:scatter,
   title = "RealGDPPerFamily vs Year",
   linewidth=8,
   linealpha=0.5,
   label="data"
   )

plot!(f, 1950, 2020, label="correlation")
```

![Real GDP per Family vs Year](https://raw.githubusercontent.com/pranavtbhat/JuliaCookbook/master/media/linear_regression_ineq.png)

## Minimum Least Squares on Arbitrary Functions

You have a function `y = f(x)`, and you want to use want to predict the values of y:

```julia
using DataFrames
using GLM
using Plots

e = 2.3
f(x) = x ^ e + 1
df = DataFrame(X = collect(1 : 100), Y = map(f, 1 : 100))

OLS = glm(Y ~ X, df, Normal(), IdentityLink())

plot(
   df[:X],
   df[:Y],
   smooth=true,
   seriestype=:scatter,
   linewidth=8,
   linealpha=0.5,
   label="data"
)

plot!(df[:X], predict(OLS), label="Correlation")
```

<img src="https://raw.githubusercontent.com/pranavtbhat/JuliaCookbook/master/media/least_squares.png" width="807" height ="532">
