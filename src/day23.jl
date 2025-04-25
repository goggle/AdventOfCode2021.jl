module Day23

using AdventOfCode2021
using DataStructures
using StaticArrays

struct State
    hallway::UInt64
    rooms::UInt64
    roomlength::UInt8
end

function Base.show(io::IO, state::State)
    print(io, repeat('#', 13))
    d = Dict(0 => '.', 1 => 'A', 2 => 'B', 3 => 'C', 4 => 'D')
    print(io, "\n#")
    print(io, map(x -> d[x], get_hallway_entry(state, i) for i ∈ 1:11) |> join)
    print(io, "#\n")
    print(io, "###" * d[get_room_entry(state, 1, 1)] * "#" * d[get_room_entry(state, 2, 1)] * "#" * d[get_room_entry(state, 3, 1)] * "#" * d[get_room_entry(state, 4, 1)] * "###\n")
    for i ∈ 2:state.roomlength
        print(io, "  #" * d[get_room_entry(state, 1, i)] * "#" * d[get_room_entry(state, 2, i)] * "#" * d[get_room_entry(state, 3, i)] * "#" * d[get_room_entry(state, 4, i)] * "#  \n")
    end
    print(io, "  " * repeat('#', 9) * "  \n")
end

function init_state(hallway::Vector{T}, rooms::Vector{Vector{S}}) where {T <: Integer, S <: Integer}
    hw = UInt64(0)
    for entry ∈ reverse(hallway)
        hw = (hw << 3) + entry
    end

    rs = UInt64(0)
    for room ∈ reverse(rooms)
        for entry ∈ reverse(room)
            rs = (rs << 3) + entry
        end
    end

    return State(hw, rs, UInt8(length(rooms[1])))
end

@inline function get_hallway_entry(state::State, i::Integer)
    return (state.hallway >> (3 * (i - 1))) & 0x7
end

@inline function get_room_entry(state::State, room::Integer, i::Integer)
    pos = 3 * ((room - 1) * state.roomlength + (i - 1))
    return (state.rooms >> pos) & 0x7
end

@inline function swap(state::State, i::Integer, room::Integer, j::Integer)
    hpos = 3 * (i - 1)
    rpos = 3 * ((room - 1) * state.roomlength + (j - 1))
    mask_h = (state.hallway >> hpos) & 0x7
    mask_r = (state.rooms >> rpos) & 0x7
    delta = mask_h ⊻ mask_r
    new_hallway = state.hallway ⊻ (delta << hpos)
    new_rooms = state.rooms ⊻ (delta << rpos)
    return State(new_hallway, new_rooms, state.roomlength)
end

@inline function swap(state::State, i::Integer, room1::Integer, j::Integer, room2::Integer)
    r1pos = 3 * ((room1 - 1) * state.roomlength + (i - 1))
    r2pos = 3 * ((room2 - 1) * state.roomlength + (j - 1))
    mask1 = (state.rooms >> r1pos) & 0x7
    mask2 = (state.rooms >> r2pos) & 0x7
    delta = mask1 ⊻ mask2
    new_rooms = state.rooms ⊻ (delta << r1pos) ⊻ (delta << r2pos)
    return State(state.hallway, new_rooms, state.roomlength)
end

function day23(input::String = readInput(joinpath(@__DIR__, "..", "data", "day23.txt")))
    state = parse_input(input)
    goal_p1 = init_state(repeat([0], 11), [[1, 1], [2, 2], [3, 3], [4, 4]])
    p1 = solve(state, goal_p1, heuristic)

    state_p2 = transform_part2(state)
    goal_p2 = init_state(repeat([0], 11), [repeat([i], 4) for i ∈ 1:4])
    p2 = solve(state_p2, goal_p2, heuristic)

    return [p1, p2]
end

function parse_input(input::String)
    lines = split(input)[2:4]
    d = Dict{Char, Int}('.' => 0, 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4)
    hallway = SVector{11, Int}(map(x -> d[x], collect(replace(strip(lines[1]), '#' => ""))))
    stages = []
    for line in lines[2:3]
        push!(stages, SVector{4, Int}(map(x -> d[x], collect(replace(strip(line), '#' => "")))))
    end
    rm = hcat(stages...)
    return init_state(hallway, [rm[i, :] for i ∈ 1:4])
end

function transform_part2(state::State)
    miss = SVector{4, SVector{2, Int}}([[4, 4], [3, 2], [2, 1], [1, 3]])
    rooms = [vcat(get_room_entry(state, i, 1), miss[i], get_room_entry(state, i, 2)) for i ∈ 1:4]
    return init_state(SVector{11, Int}([get_hallway_entry(state, i) for i ∈ 1:11]), rooms)
end

function next_states_and_costs(state::State, room_entries::NTuple{4, Int})
    add = MVector{4, Int}(0, 0, 0, 0)  # how many entries from the start are set to 0
    room_sorted = MVector{4, Bool}(true, true, true, true)
    for room ∈ 1:4
        a = 0
        while a + 1 <= state.roomlength && get_room_entry(state, room, a + 1) == 0
            a += 1
        end
        add[room] = a
        for i ∈ a+1:state.roomlength
            if get_room_entry(state, room, i) != room
                room_sorted[room] = false
                break
            end
        end
    end

    states_costs = Vector{Tuple{State, Int}}()
    blockerinds = SVector{length([i for i ∈ 1:11 if get_hallway_entry(state, i) != 0]), Int}([i for i ∈ 1:11 if get_hallway_entry(state, i) != 0])

    # Move amphipods from rooms into the hallway:
    for room ∈ 1:4
        room_sorted[room] && continue
        destination_room = get_room_entry(state, room, add[room] + 1)
        destination_index = destination_room * 2 + 1
        for dir ∈ (-1, 1)
            i = room_entries[room]
            while i ∈ 2:10
                i += dir
                # Prune hallway moves far from destination
                if dir == -1 && i < min(room_entries[room], destination_index) - 2 ||
                   dir == 1 && i > max(room_entries[room], destination_index) + 2
                    continue
                end
                # Direct move to destination room
                if i == destination_index
                    if room_sorted[destination_room]
                        cost = (abs(room_entries[room] - i) + add[room] + add[destination_room] + 1) * 10^(destination_room - 1)
                        return Tuple{State, Int}[(swap(state, add[room] + 1, room, add[destination_room], destination_room), cost)]
                    end
                end
                i ∈ room_entries && continue
                get_hallway_entry(state, i) != 0 && break
                cost = (abs(room_entries[room] - i) + add[room] + 1) * 10^(get_room_entry(state, room, add[room] + 1) - 1)
                push!(states_costs, (swap(state, i, room, add[room] + 1), cost))
            end
        end
    end

    # Move amphipods from the hallway into the rooms
    for bi in blockerinds
        amphipod = get_hallway_entry(state, bi)
        !room_sorted[amphipod] && continue
        entry = amphipod * 2 + 1
        m, M = minmax(bi, entry)
        length(intersect(m+1:M-1, blockerinds)) > 0 && continue
        cost = (M - m + add[amphipod]) * 10^(amphipod - 1)
        push!(states_costs, (swap(state, bi, amphipod, add[amphipod]), cost))
    end
    return states_costs
end

function heuristic(state::State)
    total = 0
    for room ∈ 1:4
        i = state.roomlength
        while i > 0
            get_room_entry(state, room, i) != room && break
            i -= 1
        end
        for k ∈ 1:i
            amphipod = get_room_entry(state, room, k)
            if amphipod == 0
                total += k * 10^(room - 1)
            else
                total += (k + 2 * abs(room - amphipod)) * 10^(amphipod - 1) + k * 10^(room - 1)
            end
        end
    end
    blockers = Dict{Int, Int}()
    for i ∈ 1:11
        amphipod = get_hallway_entry(state, i)
        amphipod == 0 && continue
        blockers[i] = amphipod
        total += abs(i - (amphipod * 2 + 1)) * 10^(amphipod - 1)
    end
    # Add cost for blockers
    for (i, amphipod) ∈ blockers
        for (j, other) ∈ blockers
            i == j && continue
            dest = other * 2 + 1
            if (i > j && i < dest) || (i < j && i > dest)
                total += 10^(amphipod - 1)  # Minimum cost to move blocker
            end
        end
    end
    return total
end

# Custom hash for faster state lookups
Base.hash(state::State, h::UInt) = hash(state.hallway, hash(state.rooms, hash(state.roomlength, h)))

function solve(state::State, goal::State, h)
    dist = DefaultDict{State, Int}(typemax(Int))
    dist[state] = 0
    queue = PriorityQueue{State, Int}()
    queue[state] = 0
    heuristic_cache = Dict{State, Int}()
    get_heuristic(s) = get!(heuristic_cache, s) do
        h(s)
    end
    room_entries = (3, 5, 7, 9)
    while !isempty(queue)
        current = dequeue!(queue)
        current == goal && break
        for (neighbour, cost) ∈ next_states_and_costs(current, room_entries)
            ndist = dist[current] + cost
            if ndist < dist[neighbour]
                dist[neighbour] = ndist
                queue[neighbour] = ndist + get_heuristic(neighbour)
            end
        end
    end
    return dist[goal]
end

end # module