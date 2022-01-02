module Day23

using AdventOfCode2021
using DataStructures

struct State
    hallway::Vector{Int8}
    rooms::Vector{Vector{Int8}}
end

# function Base.show(io::IO, state::State)
#     print(io, repeat('#', 13))
#     d = Dict(0 => '.', 1 => 'A', 2 => 'B', 3 => 'C', 4 => 'D')
#     print(io, "\n#")
#     print(io, map(x -> d[x], state.hallway) |> join)
#     print(io, "#\n")
#     print(io, "###" * d[state.rooms[1][1]] * "#" * d[state.rooms[2][1]] * "#" * d[state.rooms[3][1]] * "#" * d[state.rooms[4][1]] * "###\n")
#     for i = 2:length(state.rooms[1])
#         print(io, "  #" * d[state.rooms[1][i]] * "#" * d[state.rooms[2][i]] * "#" * d[state.rooms[3][i]] * "#" * d[state.rooms[4][i]] * "#  \n")
#     end
#     print(io, "  " * repeat('#', 9) * "  \n")
# end

function encode(state::State)
    data = vcat(state.hallway, collect(Iterators.flatten(state.rooms[:])))
    return [UInt(5)^(length(data) - i) * data[i] for i = 1:length(data)] |> sum
end

function complete(state::State)
    miss = [[4, 4], [3, 2], [2, 1], [1, 3]]
    rooms = [vcat(state.rooms[i][1], miss[i], state.rooms[i][2]) for i = 1:4]
    return State(state.hallway, rooms)
end

function day23(input::String = readInput(joinpath(@__DIR__, "..", "data", "day23.txt")))
    state = parse_input(input)
    p1 = solve(state, encode(State(repeat([0], 11), [[1, 1], [2, 2], [3, 3], [4, 4]])))
    state = complete(state)
    p2 = solve(state, encode(State(repeat([0], 11), [repeat([i], 4) for i = 1:4])))
    return [p1, p2]
end

function parse_input(input::String)
    lines = split(input)[2:4]
    d = Dict{Char,Int8}('.' => 0, 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4)
    hallway = map(x -> d[x], collect(replace(strip(lines[1]), '#' => "")))
    stages = []
    for line in lines[2:3]
        push!(stages, map(x -> d[x], collect(replace(strip(line), '#' => ""))))
    end
    rm = hcat(stages...)
    return State(hallway, [rm[i,:] for i = 1:4])
end

function next_states(state::State)
    statescosts = Tuple{State,Int}[]

    restinds = intersect([1, 2, 4, 6, 8, 10, 11], findall(x -> x == 0, state.hallway))
    blockerinds = findall(x -> x != 0, state.hallway)

    for bi in blockerinds
        v = state.hallway[bi]
        entry = 2*v + 1

        add = findlast(x -> x == 0, state.rooms[v])
        add === nothing && continue
        skip = false
        for i = add + 1:length(state.rooms[v])
            if state.rooms[v][i] != v
                skip = true
                break
            end
        end
        skip && continue
        m, M = minmax(entry, bi)
        if !any(b -> b ∈ m+1:M-1, blockerinds)
            cost = (M - m + add) * 10^(v - 1)
            push!(statescosts, (swap(state, bi, v, add), cost))
        end
    end

    for room in 1:4
        lastzero = findlast(x -> x == 0, state.rooms[room])
        lastzero == length(state.rooms[room]) && continue
        if lastzero === nothing
            add = 1
        else
            add = lastzero + 1
        end
        all(state.rooms[room][add:length(state.rooms[room])] .== room) && continue


        entry = room * 2 + 1
        for resti in restinds
            m, M = minmax(entry, resti)
            if !any(b -> b ∈ m:M, blockerinds)
                cost = (M - m + add) * 10^(state.rooms[room][add] - 1)
                push!(statescosts, (swap(state, resti, room, add), cost))
            end
        end
    end
    return statescosts
end

function swap(state::State, hallwayind::Integer, roomnumber::Integer, roomind::Integer)
    hallway = copy(state.hallway)
    rooms = deepcopy(state.rooms)
    tmp = hallway[hallwayind]
    hallway[hallwayind] = rooms[roomnumber][roomind]
    rooms[roomnumber][roomind] = tmp
    return State(hallway, rooms)
end

# Right now, the heuristic makes it harder to find the best solution.
# This needs some more work...
# function heuristic(state::State)
#     total = 0
#     for room ∈ 1:4
#         positions = Int[]
#         push!(positions, findall(x -> x == room, state.hallway)...)
#         for ri ∈ 1:4
#             ri == room && continue
#             c = findall(x -> x == room, state.rooms[ri]) |> length
#             for _ ∈ 1:c
#                 push!(positions, ri * 2 + 1)
#             end
#         end
#         entry = room * 2 + 1
#         for position in positions
#             total += abs(position - entry) * 10^(room - 1)
#         end
#     end
#     return total
# end

function solve(state::State, goal::UInt)
    dist = DefaultDict{Int,Int}(typemax(Int))
    dist[encode(state)] = 0
    queue = PriorityQueue{State,Int}()
    queue[state] = 0

    while !isempty(queue)
        current = dequeue!(queue)
        cenc = encode(current)
        cenc == goal && break
        for (neighbour, cost) ∈ next_states(current)
            ndist = dist[cenc] + cost
            nenc = encode(neighbour)
            if ndist < dist[nenc]
                dist[nenc] = ndist
                # queue[neighbour] = ndist + heuristic(neighbour)
                queue[neighbour] = ndist
            end
        end
    end
    return dist[goal]
end

end # module