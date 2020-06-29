using Distance
using Test

@testset "Distance.jl" begin


    @test GetDistance(Euclidean(), [2,2], [2,4]) == 2
#=
    @test GetDistance(CityBlock(), 2, 1) ==
    @test GetDistance(TotalVariation(), 2, 1) ==
    @test GetDistance(Chebyshev(), 2, 1) ==
    @test GetDistance(Jaccard(), 2, 1) ==
    @test GetDistance(BrayCurtis(), 2, 1) ==
    @test GetDistance(CosineDist(), 2, 1) ==
    @test GetDistance(ChiSqDist(), 2, 1) ==
    @test GetDistance(SpanNormDist(), 2, 1) ==
=#


end
