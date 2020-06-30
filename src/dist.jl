include("math.jl")
abstract type Dist end

function GetDistance(dist::Dist, p1::AbstractArray, p2::AbstractArray)
    if length(p1) != length(p2)
        throw(DimensionMismatch("Arrays with different dimensions, first array: $(length(p1)) != second array: $(length(p2))."))
    end
    if length(p1) == 0
        throw(DimensionMismatch("Can not calculate distance for empty arrays"))
    end

    return calculate(dist, p1, p2)
end

struct Euclidean <: Dist end
calculate(::Euclidean, p1::AbstractArray, p2::AbstractArray) = sqrt(sum((p1 - p2) .^ 2))

struct CityBlock <: Dist end
calculate(::CityBlock, p1::AbstractArray, p2::AbstractArray) = sum(absolute(p1 - p2))

struct TotalVariation <: Dist end
calculate(::TotalVariation, p1::AbstractArray, p2::AbstractArray) = sum(absolute(p1 - p2)) / 2

struct Chebyshev <: Dist end
calculate(::Chebyshev, p1::AbstractArray, p2::AbstractArray) = maxArray(absolute(p1-p2))

struct Jaccard <: Dist end
calculate(::Jaccard, p1::AbstractArray, p2::AbstractArray) = 1 - sum(min(p1, p2)) / sum(max(p1,p2))

struct BrayCurtis <: Dist end
calculate(::BrayCurtis, p1::AbstractArray, p2::AbstractArray) = sum(absolute(p1 - p2)) / sum(absolute(p1 + p2))

struct CosineDist <: Dist end
calculate(::CosineDist, p1::AbstractArray, p2::AbstractArray) = 1 - sum(p1 .* p2) / ((sqrt(sum(p1 .^ 2))) * (sqrt(sum(p2 .^ 2))))

struct SpanNormDist <: Dist end
calculate(::SpanNormDist, p1::AbstractArray, p2::AbstractArray) = maxArray(p1 - p2) - minArray(p1 - p2)
