module Day23

using AdventOfCode2021

struct State
    hallway::Vector{Int8}
    rooms::Vector{Vector{Int8}}
end

Base.:(==)(a::State, b::State) = (a.hallway == b.hallway && a.rooms == b.rooms)

function day23(input::String = readInput(joinpath(@__DIR__, "..", "data", "day23.txt")))
    return parse_input(input)
end

function parse_input(input::String)
    lines = split(input)[3:4]
    stages = []
    for line in lines
        push!(stages, map(x -> Int8(x - 'A' + 1), collect(line[findall(x -> x ∈ ('A', 'B', 'C', 'D'), line)])))
    end
    rm = hcat(stages...)
    # rooms = [rm[1,:], rm[2,:], rm[3,:], rm[4,:]]
    # rooms = [rm[i,:] for i=1:4]
    # hallway = zeros(Int8, 11)
    return State(zeros(Int8, 11), [rm[i,:] for i=1:4])
end

function next_states(state::State)
    states = State[]

    restinds = intersect([1, 2, 4, 6, 8, 10, 11], findall(x -> x == 0, state.hallway))
    blockerinds = findall(x -> x != 0, state.hallway)

    for bi in blockerinds
        v = state.hallway[bi]
        entry = 2*v + 1
        if all(==(0), state.rooms[v]) || state.rooms[v][2] == v
            add = state.rooms[v][2] == 0 ? 2 : 1
            m, M = minmax(entry, bi)
            if !any(b ∈ m+1:M-1, blockerinds)
                cost = (M - m + add) * 10^(v - 1)
            end
        end

    end

end

end # module
