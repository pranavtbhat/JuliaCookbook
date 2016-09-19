# Plotting
The [Plots.jl](https://github.com/tbreloff/Plots.jl) package is probably the best option for `linegraphs`, `scatterplots`, `histograms` etc.

# Line Graphs

The examples shown below use the [Income Inequality in the US](https://vincentarelbundock.github.io/Rdatasets/doc/Ecdat/incomeInequality.html) dataset which can be loaded by running:
```julia
julia> ineq = dataset("Ecdat", "incomeInequality")
```

It would be interesting to see how the family incomes of the different sections of society have developed over the years. The dataset contains several columns corresponding to quantiles of the family incomes of Americans: `[Quintile1, Quintile2, median, Quintile3, Quintile4, p95, P90, P95, P99, P99.5, P99.9, P99.99]`.

A plot of the first Quantile against time can be obtained by running:

```julia
plot(
    ineq[:Year],
    ineq[:Quintile1];
    title="Income inequality in the US",
    xlabel="Year",
    ylabel="Family Income(\$)",
    label="First Quantile"
 )

```
Subsequent quantiles can be added to the plot using the `plot!` function

```julia
plot!(ineq[:Year], ineq[:Quintile2], label="Second Quantile")
plot!(ineq[:Year], ineq[:Median], label="Median")
plot!(ineq[:Year], ineq[:Quintile3], label="Third Quantile")
plot!(ineq[:Year], ineq[:Quintile4], label="Fourth Quantile")
```

![Income inequality in the US](https://github.com/pranavtbhat/JuliaCookbook/blob/master/media/ineq_quantiles.png)

A plot of the income development of rich families can be obtained by running:

```julia
plot(
    ineq[:Year],
    ineq[:P90];
    title="Income inequality in the US",
    xlabel="Year",
    ylabel="Family Income(\$)",
    label="P90"
 )
plot!(ineq[:Year], ineq[:P95], label="P95")
plot!(ineq[:Year], ineq[:P99], label="P99")
plot!(ineq[:Year], ineq[:P99_5], label="P99.5")
plot!(ineq[:Year], ineq[:P99_9], label="P99_9")
plot!(ineq[:Year], ineq[:P99_99], label="P99_99")
```
![Income inequality in the US](https://github.com/pranavtbhat/JuliaCookbook/blob/master/media/ineq_pseries.png)

Cleary, P90 and P95 are under-emphasized in the graph. A logarithmic scale can be used by setting the `yscale` argument:

```julia
plot(
     ineq[:Year],
     ineq[:P90];
     title="Income inequality in the US",
     xlabel="Year",
     ylabel="Family Income(\$)",
     label="P90",
     yscale=:log10
 )
 plot!(ineq[:Year], ineq[:P95], label="P95")
 plot!(ineq[:Year], ineq[:P99], label="P99")
 plot!(ineq[:Year], ineq[:P99_5], label="P99.5")
 plot!(ineq[:Year], ineq[:P99_9], label="P99_9")
 plot!(ineq[:Year], ineq[:P99_99], label="P99_99")
 ```
![Income inequality in the US](https://github.com/pranavtbhat/JuliaCookbook/blob/master/media/ineq_pseries_log.png)


# Histogram

The example shown below uses the [Bad Health](http://vincentarelbundock.github.io/Rdatasets/doc/COUNT/badhealth.html) dataset available in `RDatasets`. The dataset can be loaded using:

```julia
bhealth = dataset("COUNT", "badhealth")
```

A histogram of unhealthy people vs age can be plotted by running:
```julia
histogram(
     bhealth[bhealth[:BadH] .== 1, :Age],
     nbins=10,
     label="Number of People",
     xlabel="Age",
     ylabel="Number of People",
     title="Age Distribution of people with Bad Health"
 )
```

![Income inequality in the US](https://github.com/pranavtbhat/JuliaCookbook/blob/master/media/bhealth_age_dist.png)


More plotting examples can be obtained at the Plots.jl [documentation](https://juliaplots.github.io/).
