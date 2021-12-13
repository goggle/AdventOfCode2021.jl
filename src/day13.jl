module Day13

using AdventOfCode2021

function day13(input::String = readInput(joinpath(@__DIR__, "..", "data", "day13.txt")))
    points, folds = parse_input(input)
    cpoints = copy(points)
    fold!(cpoints, folds[1][1], folds[1][2])
    p1 = length(cpoints)

    for (c, v) in folds
        fold!(points, c, v)
    end
    xmin, xmax = minimum(x -> x[1], points), maximum(x -> x[1], points)
    ymin, ymax = minimum(x -> x[2], points), maximum(x -> x[2], points)
    Δx, Δy = 1 - xmin, 1 - ymin
    screen = fill('.', xmax - xmin + 1, ymax - ymin + 1)
    screen[[p + CartesianIndex(Δx, Δy) for p ∈ points]] .= '#'
    return [p1, generate_image(screen)]
end

function parse_input(input::String)
    points = [CartesianIndex(parse.(Int, m.captures)...) for m in match.(r"(\d+),(\d+)", split(rstrip(input), '\n')) if m !== nothing]
    folds = [Pair(m.captures[1][1], parse(Int, m.captures[2])) for m in match.(r"([xy])=(\d+)", split(rstrip(input), '\n')) if m !== nothing]
    return points, folds
end

function fold!(points::Vector{CartesianIndex{2}}, c::Char, v::Int)
    if c == 'x'
        foldx!(points, v)
    elseif c == 'y'
        foldy!(points, v)
    end
end

function foldx!(points::Vector{CartesianIndex{2}}, fx::Int)
    for (i, point) in enumerate(points)
        if point[1] > fx
            points[i] = CartesianIndex(2*fx - point[1], point[2])
        end
    end
    unique!(points)
end

function foldy!(points::Vector{CartesianIndex{2}}, fy::Int)
    for (i, point) in enumerate(points)
        if point[2] > fy
            points[i] = CartesianIndex(point[1], 2*fy - point[2])
        end
    end
    unique!(points)
end

end # module
