abstract type Dist end

#=
    Função a ser chamada para pegar a distancia, basta chama-la e colocar em "dist" uma instancia do tipo
    de distancia que voce quer calcular e em p1 e p2 os pontos.
    Exemplos:
        GetDistance(Euclidean(), [2,2], [2,4])
        GetDistance(CityBlock(), [1, 2, 3], [4, 5, 6])
=#
function GetDistance(dist::Dist, p1::AbstractArray, p2::AbstractArray)
    if length(p1) != length(p2)
        throw(DimensionMismatch("Arrays with different dimensions, first array: $(length(p1)) != second array: $(length(p2))."))
    end
    if length(p1) == 0
        throw(DimensionMismatch("Can not calculate distance for empty arrays"))
    end

    return calculate(dist, p1, p2)
end


#   Distancia Euclidiana
struct Euclidean <: Dist end
calculate(::Euclidean, p1::AbstractArray, p2::AbstractArray) = sqrt(sum((p1 - p2) .^ 2))

#   Distancia City Block ou Manhattan
struct CityBlock <: Dist end
calculate(::CityBlock, p1::AbstractArray, p2::AbstractArray) = sum(abs.(p1 - p2))

#   Distancia Total Variation
struct TotalVariation <: Dist end
calculate(::TotalVariation, p1::AbstractArray, p2::AbstractArray) = sum(abs.(p1 - p2)) / 2

#   Distancia Chebyshev
struct Chebyshev <: Dist end
calculate(::Chebyshev, p1::AbstractArray, p2::AbstractArray) = maximum(abs.(p1-p2))

#   Distancia Jaccard
struct Jaccard <: Dist end
calculate(::Jaccard, p1::AbstractArray, p2::AbstractArray) = 1 - sum(min(p1, p2)) / sum(max(p1,p2))

#   Distancia BrayCurtis
struct BrayCurtis <: Dist end
calculate(::BrayCurtis, p1::AbstractArray, p2::AbstractArray) = sum(abs.(p1 - p2)) / sum(abs.(p1 + p2))

#   Distancia Cosseno
struct CosineDist <: Dist end
calculate(::CosineDist, p1::AbstractArray, p2::AbstractArray) = 1 - sum(p1 .* p2) / ((sqrt(sum(p1 .^ 2))) * (sqrt(sum(p2 .^ 2))))

#   Distancia Span-norm
struct SpanNormDist <: Dist end
calculate(::SpanNormDist, p1::AbstractArray, p2::AbstractArray) = maximum(p1 - p2) - minimum(p1 - p2)
