module Day07

using AdventOfCode2021

function day07(input::String = readInput(joinpath(@__DIR__, "..", "data", "day07.txt")))
    positions = parse.(Int, split(input, ','))
    solutions = [0, 0]
    for (i, fac) in enumerate((costp1, costp2))
        min = cost(positions, 0, fac)
        for pos ∈ 1:maximum(positions)
            c = cost(positions, pos, fac)
            if c < min
                min = c
            end
        end
        solutions[i] = min
    end
    return solutions
end

function cost(positions::Vector{Int}, final::Int, costp)
    total = 0
    for pos in positions
        total += costp(abs(pos - final))
    end
    return total
end

costp1(x::Int) = x
costp2(x::Int) = x * (x + 1) ÷ 2

end # module
