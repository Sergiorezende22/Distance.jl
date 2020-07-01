module Distance

include("dist.jl")

export
    #   Funtion
    GetDistance,

    #   Types of distances
    Euclidean,
    CityBlock,
    TotalVariation,
    Chebyshev,
    Jaccard,
    BrayCurtis,
    CosineDist,
    SpanNormDist
end
