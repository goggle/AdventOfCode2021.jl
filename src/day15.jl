module Day15

using AdventOfCode2021
using DataStructures

function day15(input::String = readInput(joinpath(@__DIR__, "..", "data", "day15.txt")))
    riskmap = reduce(vcat, permutedims.(map(x -> parse.(Int8, split(x, "")), split(input))))
    p1 = solve(riskmap)
    tmp = vcat((mod1.(riskmap .+ Int8(i), Int8(9)) for i=0:4)...)
    riskmap = hcat((mod1.(tmp .+ Int8(i), Int8(9)) for i=0:4)...)
    p2 = solve(riskmap)
    return [p1, p2]
end

function solve(riskmap::Matrix{Int8})
    costmap = fill(typemax(Int), size(riskmap)...)
    costmap[1,1] = 0
    visitedmap = zeros(Bool, size(riskmap)...)
    Q = PriorityQueue{CartesianIndex{2}, Int}()
    enqueue!(Q, CartesianIndex(1,1), 0)
    while !isempty(Q)
        current = dequeue!(Q)
        visitedmap[current] = true
        for neigh in (current + x for x in (CartesianIndex(1,0), CartesianIndex(-1, 0), CartesianIndex(0, 1), CartesianIndex(0, -1)))
            (!checkbounds(Bool, riskmap, neigh) || visitedmap[neigh]) && continue
            newcost = costmap[current] + riskmap[neigh]
            if newcost < costmap[neigh]
                costmap[neigh] = newcost
                enqueue!(Q, neigh, newcost)
            end
        end
    end
    return costmap[end, end]
end

end # module
