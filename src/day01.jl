module Day01

using AdventOfCode2021

function day01(input::String = readInput(joinpath(@__DIR__, "..", "data", "day01.txt")))
    reports = parse.(Int, split(input))
    sums = [a + b + c for (a, b, c) ∈ zip(reports[1:end-2], reports[2:end-1], reports[3:end])]
    return [count(diff(reports) .> 0), count(diff(sums) .> 0)]
end

end # module
