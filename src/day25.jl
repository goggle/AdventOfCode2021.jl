module Day25

using AdventOfCode2021

function day25(input::String = readInput(joinpath(@__DIR__, "..", "data", "day25.txt")))
    watermap = map(x -> x[1], reduce(vcat, permutedims.(split.(split(input), ""))))

    nsteps = 0
    changed = true
    while changed
        changed = step!(watermap)
        nsteps += 1
    end
    return nsteps
end

function step!(watermap::Matrix{Char})
    changed = false
    move_right = findall(==('>'), watermap)
    filter!(x -> watermap[x[1], mod1(x[2]+1, size(watermap,2))] == '.', move_right)
    for ci ∈ move_right
        changed = true
        watermap[ci] = '.'
        watermap[ci[1], mod1(ci[2]+1, size(watermap,2))] = '>'
    end
    move_down = findall(==('v'), watermap)
    filter!(x -> watermap[mod1(x[1]+1, size(watermap,1)), x[2]] == '.', move_down)
    for ci ∈ move_down
        changed = true
        watermap[ci] = '.'
        watermap[mod1(ci[1]+1, size(watermap,1)), ci[2]] = 'v'
    end
    return changed
end

end # module
