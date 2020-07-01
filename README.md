# Distance.jl

[![Build Status](https://travis-ci.com/Sergiorezende22/Distance.jl.svg?branch=master)](https://travis-ci.com/Sergiorezende22/Distance.jl)
[![Coverage](https://codecov.io/gh/Sergiorezende22/Distance.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/Sergiorezende22/Distance.jl)

## Introduction
  This is a test package for calculating distances between two points. It works with 8 different types of distances, they are:

    - Euclidean

    - City Block

    - Total Variantion

    - Chebyshev

    - Jaccard

    - BrayCurtis

    - Cosine

    - Span-norm

## How to use
  The package is pretty simple, the user only need to call the function GetDistance, give the type of distance they want to use, the arrays, and then it is done.

  ```
    euclideanDist = GetDistance(Euclidean(), [2,2], [2,4])

    chebyshevDist = GetDistance(Chebyshev(), [2,2], [2,4])
  ```

| Type name      |
|----------------|
| Euclidean      |
| CityBlock      |
| TotalVariation |
| Chebyshev      |
| Jaccard        |
| BrayCurtis     |
| CosineDist     |
| SpanNormDist   |
