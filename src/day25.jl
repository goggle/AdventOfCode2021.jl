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

    current = watermap
    nsteps = 1
    while true
        next = step(current)
        current == next && break
        current = next
        nsteps += 1
    end

    return nsteps
end

function step(watermap)
    nmap = fill('.', size(watermap))
    for ci ∈ findall(x -> x == '>', watermap)
        j = ci[2] + 1
        if j > size(watermap, 2)
            j = 1
        end
        if watermap[ci[1], j] == '.'
            nmap[ci[1], j] = '>'
        else
            nmap[ci] = '>'
        end
    end
    for ci ∈ findall(x -> x == 'v', watermap)
        i = ci[1] + 1
        if i > size(watermap, 1)
            i = 1
        end
        if nmap[i, ci[2]] == '>' || watermap[i, ci[2]] == 'v'
            nmap[ci] = 'v'
        else
            nmap[i, ci[2]] = 'v'
        end
    end
    return nmap
end

end # module
