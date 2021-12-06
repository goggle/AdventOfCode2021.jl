module Day05

using AdventOfCode2021
using OffsetArrays

function day05(input::String = readInput(joinpath(@__DIR__, "..", "data", "day05.txt")))
    starts, ends = parse_input(input)
    return solve(starts, ends)
end

function parse_input(input::String)
    starts, ends = Vector{Tuple{Int,Int}}(), Vector{Tuple{Int,Int}}()
    for line in split(rstrip(input), '\n')
        m = match(r"(\d+),(\d+)\s*->\s*(\d+),(\d+)", line)
        push!(starts, (parse(Int, m.captures[1]), parse(Int, m.captures[2])))
        push!(ends, (parse(Int, m.captures[3]), parse(Int, m.captures[4])))
    end
    return starts, ends
end

function solve(starts, ends)
    n, m = (maximum([maximum(a -> a[i], x) for x in (starts, ends)]) for i = 1:2)
    grid = OffsetArray(zeros(UInt8, n+1, m+1), 0:n, 0:m)
    gridp2 = OffsetArray(zeros(UInt8, n+1, m+1), 0:n, 0:m)
    for (s, e) in zip(starts, ends)
        if s[1] == e[1]
            y1, y2 = minmax(s[2], e[2])
            for y = y1:y2
                grid[s[1], y] += 1
                gridp2[s[1], y] += 1
            end
        elseif s[2] == e[2]
            x1, x2 = minmax(s[1], e[1])
            for x = x1:x2
                grid[x, s[2]] += 1
                gridp2[x, s[2]] += 1
            end
        else
            xdir = s[1] < e[1] ? 1 : -1
            ydir = s[2] < e[2] ? 1 : -1
            x, y = s[1], s[2]
            for i = 0:abs(s[1] - e[1])
                gridp2[x, y] += 1
                x += xdir
                y += ydir
            end
        end
    end
    return [count(x -> x >= 2, g) for g in (grid, gridp2)]
end

end # module
