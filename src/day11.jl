module Day11

using AdventOfCode2021

function day11(input::String = readInput(joinpath(@__DIR__, "..", "data", "day11.txt")))
    energymap = reduce(vcat, permutedims.(map(x -> parse.(Int, split(x, "")), split(input))))

    p1 = 0
    cmap = copy(energymap)
    for i = 1:100
        p1 += step!(cmap)
    end

    i = 1
    while true
        nflashes = step!(energymap)
        nflashes == 100 && return [p1, i]
        i += 1
    end
end

function step!(energymap::Matrix{Int})
    energymap .+= 1
    flashmap = zeros(Bool, size(energymap))
    while true
        nines = findall(x -> x > 9, energymap)
        length(nines) == 0 && break
        energymap[nines] .= 0
        flashmap[nines] .= true
        for nine in nines
            increase_neighbours!(energymap, nine)
        end
    end
    energymap[flashmap] .= 0
    return flashmap |> sum
end

function increase_neighbours!(energymap::Matrix{Int}, ind::CartesianIndex{2})
    i, j = ind.I
    for k = -1:1
        for l = -1:1
            (k == l == 0 || !checkbounds(Bool, energymap, i + k, j + l)) && continue
            energymap[i + k, j + l] += 1
        end
    end
end

end # module
