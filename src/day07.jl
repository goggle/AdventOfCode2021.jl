module Day07

using AdventOfCode2021

function day07(input::String = readInput(joinpath(@__DIR__, "..", "data", "day07.txt")))
    positions = parse.(Int, split(input, ','))
    return [minimum(cost(positions, pos, part) for pos ∈ minimum(positions):maximum(positions)) for part in (costp1, costp2)]
end

function cost(positions::Vector{Int}, final::Int, costp)
    return sum(costp(abs(pos - final)) for pos in positions)
end

costp1(x::Int) = x
costp2(x::Int) = x * (x + 1) ÷ 2

end # module
