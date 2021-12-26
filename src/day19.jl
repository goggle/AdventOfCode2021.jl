module Day19

using AdventOfCode2021
using LinearAlgebra

function day19(input::String = readInput(joinpath(@__DIR__, "..", "data", "day19.txt")))
    data = parse_input(input)
    rotations = generate_rotations()
    overlapping_neighbours = find_neighbours(data)
    d = Dict{Int, Dict{Int, Tuple{Vector{Int}, Int}}}()
    for i = 1:length(data)
        d[i] = Dict{Int, Tuple{Vector{Int}, Int}}()
    end
    for i = 1:length(data)
        for j = i + 1:length(data)
            if overlapping_neighbours[i,j]
                d[i][j] = compare(data[i], data[j], rotations)
                d[j][i] = compare(data[j], data[i], rotations)
            end
        end
    end

    scanners = map_scanners(d, rotations)
    beacons = Set{Vector{Int}}()

    for (i, scannerdata) ∈ enumerate(data)
        for relcoord ∈ eachcol(scannerdata)
            push!(beacons, rotations[scanners[i][2]] * relcoord + scanners[i][1])
        end
    end
    p1 = length(beacons)

    scannerpositions = map(x -> x[1], values(scanners))
    p2 = 0
    for scannerpos ∈ scannerpositions
        maxdist = map(x -> abs.(scannerpos - x) |> sum, scannerpositions) |> maximum
        if maxdist > p2
            p2 = maxdist
        end
    end

    return [p1, p2]
end

function parse_input(input::String)
    data = Vector{Matrix}()
    spinput = split(input, "\n")
    i = 1
    while i <= length(spinput)
        tmp = Vector{Vector{Int}}()
        i += 1
        while spinput[i] != ""
            push!(tmp, parse.(Int, split(spinput[i], ",")))
            i += 1
        end
        i += 1
        push!(data, hcat(tmp...))
    end
    return data
end

function find_neighbours(data::Vector{Matrix})
    # Checks which scanner pairs overlap by calculating he Manhatten distances
    # of beacons within in each scanner
    overlapping_neighbours = zeros(Bool, length(data), length(data))
    distances = Vector{UpperTriangular{Int, Matrix{Int}}}(undef, length(data))
    for (k, scannerdata) in enumerate(data)
        dist = UpperTriangular(zeros(Int, size(scannerdata, 2), size(scannerdata, 2)))
        for i = 1:size(scannerdata, 2)
            for j = i+1:size(scannerdata, 2)
                dist[i, j] = abs.(scannerdata[:,i] - scannerdata[:,j]) |> sum
            end
        end
        distances[k] = dist
    end
    for i = 1:length(data)
        for j = i + 1: length(data)
            if length(intersect(distances[i], distances[j])) >= 66
                overlapping_neighbours[i,j] = overlapping_neighbours[j,i] = true
            end
        end
    end
    return overlapping_neighbours
end

function generate_rotations()
    A = [0 0 -1; 0 1 0; 1 0 0]
    B = [1 0 0; 0 0 -1; 0 1 0]
    C = [0 -1 0; 1 0 0; 0 0 1]
    return unique([A^i*B^j*C^k for i ∈ 0:3 for j ∈ 0:3 for k ∈ 0:3])
end

function compare(orig::Matrix{Int}, other::Matrix{Int}, rotations::Vector{Matrix{Int}})
    # Compares two scanners. If they overlap, the position of the second scanner and
    # the corresponding rotation index are returned.
    for r = 1:length(rotations)
        counts = Dict{Vector{Int}, Int}()
        tmp = Set{Vector{Int}}()
        for i = 1:size(orig, 2)
            for j = 1:size(other, 2)
                n = orig[:, i] - rotations[r] * other[:,j]
                if n ∈ tmp
                    if !haskey(counts, n)
                        counts[n] = 2
                    else
                        counts[n] += 1
                    end
                end
                push!(tmp, n)
            end
        end
        if !isempty(counts) && maximum(counts)[2] >= 12
            return maximum(counts)[1], r
        end
    end
end

function map_scanners(d::Dict{Int, Dict{Int, Tuple{Vector{Int}, Int}}}, rotations::Vector{Matrix{Int}})
    scanners = Dict{Int, Tuple{Vector{Int}, Int}}()
    scanners[1] = ([0, 0, 0], findfirst(x -> x == [1 0 0 ; 0 1 0 ; 0 0 1], rotations))
    done = Set{Int}([1])
    next = Int[]
    for (s, (loc, rotind)) in d[1]
        scanners[s] = (loc, rotind)
        if s ∉ next
            push!(next, s)
            push!(done, s)
        end
    end
    while !isempty(next)
        j = popfirst!(next)
        push!(done, j)
        for (s, (loc, rotind)) in d[j]
            scannerloc = scanners[j][1] + rotations[scanners[j][2]] * loc
            scannerrotind = findfirst(x -> x == rotations[scanners[j][2]] * rotations[rotind], rotations)
            scanners[s] = (scannerloc, scannerrotind)
            if s ∉ next && s ∉ done
                push!(next, s)
            end
        end
    end
    return scanners
end

end # module
