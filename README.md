# courserapackage

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/maxeysholdt/courserapackage.svg?branch=master)](https://travis-ci.org/maxeysholdt/courserapackage)
<!-- badges: end -->

The goal of courserapackage is to learn to setup a package.
It reads the reads the annual Fatality Analysis Report of fatal injuries
suffered in motor vehicle traffic crashes. It can summarize the annual 
fatalities by year and draw state maps with the locations of each fatality in
each year and state.

## Installation

You can install the released version of courserapackage from github.com with:

``` r
devtools::install_github("maxeysholdt/courserapackage")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(courserapackage)

fars_summarize_years(2013)

fars_map_state("1", 2015)

```

