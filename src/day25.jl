module Day25

using AdventOfCode2021

function day25(input::String = readInput(joinpath(@__DIR__, "..", "data", "day25.txt")))
    watermap_t = hcat(reduce.(vcat, split(input))...)
    
    # Julia does not support transposing a matrix of type `Matrix{Char}`...
    # so we have to do it manually:
    watermap = fill('.', size(watermap_t, 2), size(watermap_t, 1))
    for i = 1:size(watermap_t, 1)
        for j = 1:size(watermap_t, 2)
            watermap[j, i] = watermap_t[i, j]
        end
    end

    nsteps = 0
    changed = true
    while changed
        # println(nsteps)
        changed = step!(watermap)
        nsteps += 1
    end
    return nsteps
end

function step!(watermap::Matrix{Char})
    changed = false
    east_facing_indices = findall(x -> x == '>', watermap)
    move_right = map(x -> watermap[x[1], mod1(x[2]+1, size(watermap,2))] == '.', east_facing_indices)
    for i ∈ findall(==(true), move_right)
        changed = true
        ci = east_facing_indices[i]
        watermap[ci] = '.'
        watermap[ci[1], mod1(ci[2]+1, size(watermap,2))] = '>'
    end
    south_facing_indices = findall(x -> x == 'v', watermap)
    move_down = map(x -> watermap[mod1(x[1]+1, size(watermap,1)), x[2]] == '.', south_facing_indices)
    for i ∈ findall(==(true), move_down)
        changed = true
        ci = south_facing_indices[i]
        watermap[ci] = '.'
        watermap[mod1(ci[1]+1, size(watermap,1)), ci[2]] = 'v'
    end
    return changed
end

end # module
