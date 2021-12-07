module Day06

using AdventOfCode2021

function day06(input::String = readInput(joinpath(@__DIR__, "..", "data", "day06.txt")))
    data = parse.(Int, split(rstrip(input), ','))
    lookup = zeros(Int, 8, 256)
    return [sum(grow!(lookup, s, 80) for s in data), sum(grow!(lookup, s, 256) for s in data)]
end

function grow!(lookup::Matrix{Int}, state::Int, daysleft::Int)
    daysleft - state <= 0 && return 1
    parrent = lookup[6, daysleft - state]
    if parrent == 0
        lookup[6, daysleft - state] = parrent = grow!(lookup, 6, daysleft - state - 1)
    end
    child = lookup[8, daysleft - state]
    if child == 0
        lookup[8, daysleft - state] = child = grow!(lookup, 8, daysleft - state - 1)
    end
    return parrent + child
end

end # module
