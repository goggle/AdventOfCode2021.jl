module Day19

using AdventOfCode2021
using LinearAlgebra

function day19(input::String = readInput(joinpath(@__DIR__, "..", "data", "day19.txt")))
    data = parse_input(input)
    rotations = generate_rotations()
    # M = Matrix{Tuple{Vector{Int}, Int}}()
    d = Dict{Int, Dict{Int, Tuple{Vector{Int}, Int}}}()
    for i = 1:length(data)
        d[i] = Dict{Int, Tuple{Vector{Int}, Int}}()
    end
    for i = 1:length(data)
        # d[i] = Dict{Int, Tuple{Vector{Int}, Int}}()
        for j = i + 1:length(data)
            # if !haskey(d[j], i)
            #     d[j] = Dict{Int, Tuple{Vector{Int}, Int}}()
            # end
            # println("i = $i, j = $j")
            res = compare(data[i], data[j], rotations)
            # println(res)
            if res !== nothing
                scanner, rotind = res
                # println("scanner: $scanner, rotind: $rotind")
                d[i][j] = res
                d[j][i] = (-scanner, findfirst(x -> x == Int.(inv(rotations[rotind])), rotations))
            end
            # if res !== nothing
            #     return res
            # end
        end
    end
    scanners = Set{Vector{Int}}()
    for entry in d[1]
        push!(scanners, entry[2][1])
    end
    for k = 2:length(data)
        path = find_path(k, d)
        rot = [1 0 0 ; 0 1 0; 0 0 1]
        s = [0, 0, 0]
        println("path = $path")
        for i = 1:length(path) - 1
            # for j = (i+1):length(path)
            pi = path[i]
            pj = path[i+1]
            println("pi = $pi, pj = $pj")
            s += rot * d[pi][pj][1]
            rot = d[pi][pj][2] * rot
            # end
        end
        push!(scanners, s)
        
        # println(path)
    end

    # return scanners
    
    # return find_path(4, d)
    return d
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

function generate_rotations()
    A = [0 0 -1; 0 1 0; 1 0 0]
    B = [1 0 0; 0 0 -1; 0 1 0]
    C = [0 -1 0; 1 0 0; 0 0 1]
    return unique([A^i*B^j*C^k for i ∈ 0:3 for j ∈ 0:3 for k ∈ 0:3])
end

function compare(orig::Matrix{Int}, other::Matrix{Int}, rotations::Vector{Matrix{Int}})
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
            # println(counts)
            return maximum(counts)[1], r
        end
    end
    # return false
    # return tmp
end

function find_path(to::Int, d::Dict{Int, Dict{Int, Tuple{Vector{Int}, Int}}})
    to == 1 && return Int[]
    Q = [Int[1, x] for x in keys(d[1])]
    while !isempty(Q)
        path = popfirst!(Q)
        # println(path)
        path[end] == to && return path
        for n ∈ keys(d[path[end]])
            if n ∉ path
                cp = copy(path)
                push!(cp, n)
                push!(Q, cp)
            end
        end
    end
end

end # module
