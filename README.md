# JUST GO
For those who don't have the patience to click things.

## Requirements
This package makes use of [pkgr](https://github.com/metrumresearchgroup/pkgr). You will need to have pkgr installed and on your path. It's pretty easy to install and super powerful, so you should check it out.

This package uses the R-package `renv`, which it will attempt to install to a tmp directory from CRAN if it is not already installed.

## How to use
Impatient approach:
```
> justgo.now()
```

Slightly less impatient approach:
```
> justgo.now(c("shiny", "dplyr", "ggplot2"))
```

## Notes
The your initial packages will be drawn from the repos listed in getOption("repos"). Your pkgr.yml file will be populated with these repositories.
