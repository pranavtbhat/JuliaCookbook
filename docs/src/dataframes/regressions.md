# Regressions


# Linear Regression

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

![Real GDP per Family vs Year](https://github.com/pranavtbhat/JuliaCookbook/blob/master/media/linear_regression_ineq.png)
