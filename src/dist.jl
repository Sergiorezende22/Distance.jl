abstract type Dist end


"""
    GetDistante(dist::Dist, p1::AbstractArray, p2::AbstractArray)

Returns the distance "dist" between array "p1" and array "p2".

# Examples
    GetDistance(Euclidean(), [2,2], [2,4])
    GetDistance(CityBlock(), [1, 2, 3], [4, 5, 6])
"""
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
"""
    calculate(::Euclidean, p1::AbstractArray, p2::AbstractArray)

Return the euclidean distance between arrays "p1" and "p2".
"""
calculate(::Euclidean, p1::AbstractArray, p2::AbstractArray) = sqrt(sum((p1 - p2) .^ 2))



struct CityBlock <: Dist end
"""
    calculate(::CityBlock, p1::AbstractArray, p2::AbstractArray)

Return the city block distance between arrays "p1" and "p2".
"""
calculate(::CityBlock, p1::AbstractArray, p2::AbstractArray) = sum(abs.(p1 - p2))



struct TotalVariation <: Dist end
"""
    calculate(::TotalVariation, p1::AbstractArray, p2::AbstractArray)

Return the total variation distance between arrays "p1" and "p2".
"""
calculate(::TotalVariation, p1::AbstractArray, p2::AbstractArray) = sum(abs.(p1 - p2)) / 2



struct Chebyshev <: Dist end
"""
    calculate(::Chebyshev, p1::AbstractArray, p2::AbstractArray)

Return the Chebyshev distance between arrays "p1" and "p2".
"""
calculate(::Chebyshev, p1::AbstractArray, p2::AbstractArray) = maximum(abs.(p1-p2))



struct Jaccard <: Dist end
"""
    calculate(::Jaccard, p1::AbstractArray, p2::AbstractArray)

Return the Jaccard distance between arrays "p1" and "p2".
"""
calculate(::Jaccard, p1::AbstractArray, p2::AbstractArray) = 1 - sum(min(p1, p2)) / sum(max(p1,p2))



struct BrayCurtis <: Dist end
"""
    calculate(::BrayCurtis, p1::AbstractArray, p2::AbstractArray)

Return the Bray Curtis distance between arrays "p1" and "p2".
"""
calculate(::BrayCurtis, p1::AbstractArray, p2::AbstractArray) = sum(abs.(p1 - p2)) / sum(abs.(p1 + p2))



struct CosineDist <: Dist end
"""
    calculate(::CosineDist, p1::AbstractArray, p2::AbstractArray)

Return the cosine distance between arrays "p1" and "p2".
"""
calculate(::CosineDist, p1::AbstractArray, p2::AbstractArray) = 1 - sum(p1 .* p2) / ((sqrt(sum(p1 .^ 2))) * (sqrt(sum(p2 .^ 2))))



struct SpanNormDist <: Dist end
"""
    calculate(::SpanNormDist, p1::AbstractArray, p2::AbstractArray)

Return the span-norm distance between arrays "p1" and "p2".
"""
calculate(::SpanNormDist, p1::AbstractArray, p2::AbstractArray) = maximum(p1 - p2) - minimum(p1 - p2)
