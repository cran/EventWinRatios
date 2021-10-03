---
output:
  pdf_document: default
  html_document: default
---
# EventWinRatios

This package provides several confidence interval and testing procedures using event-specific win ratios for semi-competing risks data with non-terminal and terminal events, as developed in Yang et al. (2021, preprint). The event-specific win ratios were introduced in Yang and Troendle (2021).

The main function wr.test provides various confidence interval and testing procedures with event-specific win ratios:

* **Tests of the global null** - testing the null hypothesis of no treatment effect on either the terminal event or the non-terminal event. A set of three tests are provided: the maximum test, the linear combination test, and the chi-squared test.
* **Test of proportional hazards** - testing the null hypothesis of the proportionality assumptions for the terminal event and the non-terminal event.

* **Test of equal hazard ratios** - testing the null hypothesis of equal hazard ratios for the terminal event and the non-terminal event when they both have proportional hazards.
* **Confidence intervals**
  + Confidence intervals of the non-terminal and terminal events respectively
  + Confidence intervals of linear combinations of the non-terminal and terminal events, with either pre-determined or data-driven weights

Note that the `wr.test` function uses transformations that yield better control of the type one error rates for moderately sized data sets.
    
## Installation
``` r
install.packages("EventWinRatios")
```
## Implementation
The following arguments must be inputted into the `wr.test` function.

* `yh`: time to the non-terminal event or censoring
* `hcen`: censoring indicator for the non-terminal event (event = 1, censored = 0)
* `yd`: time to the terminal event or censoring
* `dcen`: censoring indicator for the terminal event (event = 1, censored = 0)
* `z`:  group indicator (treatment = 1, control = 0)

The linear combination of the event-specific win ratios can be supplied using the `lin` argument. The significance level for confidence intervals can be controlled by the `alpha` argument. If they are not supplied by users, the function uses `lin = c(0.5, 0.5)` and `alpha = 0.5` by default.


## Note
Linear combination tests can be used to detect an overall effect, which is measured by using a weighted average of the win ratios of the terminal and non-terminal events. The weights can be either a data-driven weights or pre-determined weights. The pre-determined weights can be supplied with the `lin` argument.

## Example
The data set `SimuData` in the package is used as an example.

```r
library(EventWinRatios)
data(SimuData)

# non-terminal events
yh <- SimuData$yh
hcen <- SimuData$hcen

# terminal events
yd <- SimuData$yd
dcen <- SimuData$dcen

# group indicator
z <- SimuData$z

# Win Ratio tests
result <- wr.test(yh, hcen, yd, dcen, z)
print(result)
```

## Reference
Yang, S., Troendle, J., Pak, D., and Leifer, E. Event-Specific Win Ratios for Inference with Terminal and Non-Terminal Events. 2021. Pre-print.

Yang S and Troendle J. Event-specific win ratios and testing with terminal and non-terminal events. Clinical Trials. 2021;18(2):180-187.
