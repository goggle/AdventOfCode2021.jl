module Day01

using AdventOfCode2021

function day01(input::String = readInput(joinpath(@__DIR__, "..", "data", "day01.txt")))
    reports = parse.(Int, split(input))
    part1 = count(a > b for (a, b) ∈ zip(reports[2:end], reports[1:end-1]))
    sums = [a + b + c for (a, b, c) ∈ zip(reports[1:end-2], reports[2:end-1], reports[3:end])]
    part2 = count(a > b for (a, b) ∈ zip(sums[2:end], sums[1:end-1]))
    return [part1, part2]
end

end # module
