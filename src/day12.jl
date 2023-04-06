module Day12

using AdventOfCode2021

function day12(input::String = readInput(joinpath(@__DIR__, "..", "data", "day12.txt")))
    links = parse_input(input)
    return solve(links)
end

function parse_input(input::String)
    d = Dict{Int8, Vector{Int8}}()
    links = split.(split(input), '-')
    nodenames = sort(unique(reduce(vcat, links)), lt = _mylt)
    lookup = Dict(map(x -> x[2] => islowercase(x[2][1]) && x[2] ∉ ("start", "end") ? Int8(-x[1] + 1) : Int8(x[1] - 1), enumerate(nodenames)))
    for link in links
        for (i, j) ∈ zip((1, 2), (2, 1))
            left, right = lookup[link[i]], lookup[link[j]]
            left == 1 && continue
            right == 0 && continue
            if haskey(d, left)
                push!(d[left], right)
            else
                d[left] = [right]
            end
        end
    end
    return d
end

function _mylt(a, b)
    a == "start" && return true
    a == "end" && b != "start" && return true
    b == "start" && return false
    b == "end" && a != "start" && return false
    return a < b
end

function solve(links::Dict{Int8, Vector{Int8}})
    npaths = Vector{Vector{Int}}([[0], [0]])
    walkp1!(npaths[1], Set{Int8}(), Int8(0), links)
    walkp2!(npaths[2], Set{Int8}(), Set{Int8}(), Int8(0), links)
    return [npaths[1][1], npaths[2][1]]
end

function walkp1!(npaths::Vector{Int}, singlelower::Set{Int8}, current::Int8, links::Dict{Int8, Vector{Int8}})
    if current == 1
        npaths[1] += 1
        return
    end
    for c in links[current]
        if c < 0
            c ∈ singlelower && continue
            push!(singlelower, c)
        end
        walkp1!(npaths, singlelower, c, links)
        pop!(singlelower, c, Int8(0))
    end
end

function walkp2!(npaths::Vector{Int}, singlelower::Set{Int8}, doublelower::Set{Int8}, current::Int8, links::Dict{Int8, Vector{Int8}})
    if current == 1
        npaths[1] += 1
        return
    end
    for c in links[current]
        if c < 0
            c ∈ singlelower && length(doublelower) > 0 && continue
            if c ∉ singlelower
                push!(singlelower, c)
            else
                push!(doublelower, c)
            end
        end
        walkp2!(npaths, singlelower, doublelower, c, links)
        if c ∈ doublelower
            pop!(doublelower, c, Int8(0))
        else
            pop!(singlelower, c, Int8(0))
        end
    end
end

end # module
