using Distance
using Test

@testset "Distance.jl" begin
    @test GetDistance(Euclidean(), [2,2], [2,4]) == 2

    @test GetDistance(CityBlock(), [2,2], [2,4]) == 2
    @test GetDistance(TotalVariation(), [2,2], [2,4]) == 1
    @test GetDistance(Chebyshev(), [2,2], [2,4]) == 2
    @test GetDistance(Jaccard(), [2,2], [2,4]) == 1 - 2/3
    @test GetDistance(BrayCurtis(), [2,2], [2,4]) == 1/5
    @test GetDistance(CosineDist(), [2,2], [2,4]) == 1 - 12/(4 * sqrt(10))
    @test GetDistance(SpanNormDist(), [2,2], [2,4]) == 2
    @test GetDistance(CityBlock(), [2,2], [2,4]) == 2
    @test_throws DimensionMismatch GetDistance(Euclidean(), [], [])
    @test_throws DimensionMismatch GetDistance(CityBlock(), [1, 3, 4], [1, 2])

end
