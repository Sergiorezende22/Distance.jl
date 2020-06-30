module Distance

include("dist.jl")

export

    #   Funtion
    GetDistance,

    #   Type
    Euclidean,
    CityBlock,
    TotalVariation,
    Chebyshev,
    Jaccard,
    BrayCurtis,
    CosineDist,
    SpanNormDist
end
