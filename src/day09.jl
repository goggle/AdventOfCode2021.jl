module Day09

using AdventOfCode2021

function day09(input::String = readInput(joinpath(@__DIR__, "..", "data", "day09.txt")))
    heightmap = reduce(vcat, permutedims.(map(x -> parse.(Int, split(x, "")), split(input))))
    p1, locations = part1(heightmap)
    p2 = part2(heightmap, locations)
    return [p1, p2]
end

function part1(heightmap::Matrix{Int})
    risk = 0
    locations = CartesianIndex{2}[]
    m, n = size(heightmap)
    for i ∈ 1:m
        for j ∈ 1:n
            lower = (
                i + 1 > m || heightmap[i+1, j] > heightmap[i, j] ? true : false,
                i - 1 < 1 || heightmap[i-1, j] > heightmap[i, j] ? true : false,
                j + 1 > n || heightmap[i, j+1] > heightmap[i, j] ? true : false,
                j - 1 < 1 || heightmap[i, j-1] > heightmap[i, j] ? true : false,
            )
            if all(lower)
                risk += 1 + heightmap[i, j]
                push!(locations, CartesianIndex(i, j))
            end
        end
    end
    return risk, locations
end

function part2(heightmap::Matrix{Int}, bassins::Vector{CartesianIndex{2}})
    fillmap = zeros(Int, size(heightmap))
    for (i, bas) in enumerate(bassins)
        fill!(fillmap, [bas], i, heightmap)
    end
    return sort!([count(fillmap .== i) for i ∈ 1:length(bassins)], rev = true)[1:3] |> prod
end

function fill!(fillmap::Matrix{Int}, locations::Vector{CartesianIndex{2}}, fillvalue::Int, heightmap::Matrix{Int})
    length(locations) == 0 && return
    i, j = popfirst!(locations).I
    fillmap[i, j] = fillvalue
    for (k, l) in ((i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1))
        !(k >= 1 && k <= size(heightmap)[1] && l >= 1 && l <= size(heightmap)[2]) && continue
        fillmap[k, l] == fillvalue && continue
        heightmap[k, l] == 9 && continue
        if heightmap[k, l] > heightmap[i, j]
            push!(locations, CartesianIndex(k, l))
        end
    end
    fill!(fillmap, locations, fillvalue, heightmap)
end

end # module
