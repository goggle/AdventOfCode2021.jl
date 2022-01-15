module Day21

using AdventOfCode2021
using StaticArrays

function day21(input::String = readInput(joinpath(@__DIR__, "..", "data", "day21.txt")))
    positions = parse.(Int, map(x -> x[end], split.(split(rstrip(input), "\n"))))
    return [part1(positions), part2(positions)]
end

function part1(positions::Vector{Int})
    positions = copy(positions)
    scores = MVector(0, 0)
    dice = 0
    dicerolls = 0
    while true
        for i = 1:2
            dicerolls += 3
            s = mod1(dice + 1, 100) + mod1(dice + 2, 100) + mod1(dice + 3, 100)
            dice = mod1(dice + 3, 100)
            positions[i] = mod1(positions[i] + s, 10)
            scores[i] += positions[i]
            scores[i] >= 1000 && return (scores[1] >= 1000 ? scores[2] : scores[1]) * dicerolls
        end
    end
end

function part2(positions::Vector{Int})
    solve_part2!(Dict{NTuple{5,Int8},MVector{2,Int}}(), Int8(1), Int8(positions[1]), Int8(positions[2]), Int8(0), Int8(0)) |> maximum
end

function solve_part2!(lookup::Dict{NTuple{5,Int8},MVector{2,Int}}, pturn::Int8, p1pos::Int8, p2pos::Int8, p1score::Int8, p2score::Int8)
    p1score >= 21 && return MVector(1, 0)
    p2score >= 21 && return MVector(0, 1)
    haskey(lookup, (pturn, p1pos, p2pos, p1score, p2score)) && return lookup[(pturn, p1pos, p2pos, p1score, p2score)]
    ncomb = (Int8(1), Int8(3), Int8(6), Int8(7), Int8(6), Int8(3), Int8(1))
    wins = MVector(0, 0)
    if pturn == 1
        for (dice, nc) ∈ zip(UnitRange{Int8}(3:9), ncomb)
            newp1pos = mod1(p1pos + dice, Int8(10))
            newp1score = p1score + newp1pos
            wins .+= nc * solve_part2!(lookup, Int8(2), newp1pos, p2pos, newp1score, p2score)
        end
    else
        for (dice, nc) ∈ zip(UnitRange{Int8}(3:9), ncomb)
            newp2pos = mod1(p2pos + dice, Int8(10))
            newp2score = p2score + newp2pos
            wins .+= nc * solve_part2!(lookup, Int8(1), p1pos, newp2pos, p1score, newp2score)
        end
    end
    lookup[(pturn, p1pos, p2pos, p1score, p2score)] = wins
    return wins
end

end # module
