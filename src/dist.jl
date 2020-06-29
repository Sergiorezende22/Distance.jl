abstract type Dist end

function GetDistance(dist::Dist, p1::AbstractArray{Number}, p2::AbstractArray{Number})
    if length(p1) != length(p2)
        error("Arrays with different dimensions, first array: $(length(p1)) != second array: $(length(p2)).")
    end
    if length(p1) == 0 || length(p2) == 0
        error("Can not calculate distance between arrays with zero dimension")
    end

    return calculate(dist, p1, p2)
end



struct Euclidean <: Dist end
calculate(::Euclidean, p1::AbstractArray, p2::AbstractArray) = sqrt(sum((p1 - p2) .^ 2))

struct CityBlock <: Dist end
calculate(::CityBlock, p1::AbstractArray, p2::AbstractArray) = sum(abs(p1 - p2))

struct TotalVariation <: Dist end
calculate(::TotalVariation, p1::AbstractArray, p2::AbstractArray) = sum(abs(p1 - p2)) / 2

struct Chebyshev <: Dist end
calculate(::Chebyshev, p1::AbstractArray, p2::AbstractArray) = max(abs(p1-p2))

struct Jaccard <: Dist end
calculate(::Jaccard, p1::AbstractArray, p2::AbstractArray) = 1 - sum(min(p1, p2)) / sum(max(p1,p2))

struct BrayCurtis <: Dist end
calculate(::BrayCurtis, p1::AbstractArray, p2::AbstractArray) = sum(abs(p1 - p2)) / sum(abs(p1 + p2))

struct CosineDist <: Dist end

struct CorrDist <: Dist end

struct ChiSqDist <: Dist end

struct GenKLDivergence <: Dist end

struct SpanNormDist <: Dist end

struct MeanAbsDeviation <: Dist end

struct MeanSqDeviation <: Dist end

struct RMSDeviation <: Dist end

struct NormRMSDeviation <: Dist end
