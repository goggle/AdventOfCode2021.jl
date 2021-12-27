module Day22

using AdventOfCode2021

struct Cube
    on::Bool
    data::Vector{Int}
end

function day22(input::String = readInput(joinpath(@__DIR__, "..", "data", "day22.txt")))
    parse_input(input)
end

function parse_input(input::String)
    r = r"(on|off)\s*x=(-?\d+)\.\.(-?\d+)\s*,\s*y=(-?\d+)\.\.(-?\d+)\s*,\s*z=(-?\d+)\.\.(-?\d+)"
    cubes = Cube[]
    for line in split(rstrip(input), "\n")
        m = match(r, line)
        on = (m.captures[1] == "on" ? true : false)
        push!(cubes, Cube(on, parse.(Int, m.captures[2:7]))) 
    end

    cubelist = Cube[]
    for instruction in cubes
        instruction!(cubelist, instruction)
    end
    return cubelist
end

function intersection(cube::Cube, other::Cube, onoff::Bool)
    xintersection = intersect(cube.data[1]:cube.data[2], other.data[1]:other.data[2])
    xintersection.start > xintersection.stop && return false
    yintersection = intersect(cube.data[3]:cube.data[4], other.data[3]:other.data[4])
    yintersection.start > yintersection.stop && return false
    zintersection = intersect(cube.data[5]:cube.data[6], other.data[5]:other.data[6])
    zintersection.start > zintersection.stop && return false
    return Cube(onoff, [xintersection.start, xintersection.stop, yintersection.start, yintersection.stop, zintersection.start, zintersection.stop])
end

function volume(cube::Cube)
    return (cube.on ? 1 : -1) * (cube.data[2] - cube.data[1] + 1) * (cube.data[4] - cube.data[3] + 1) * (cube.data[6] - cube.data[5] + 1)
end

function instruction!(cubes::Vector{Cube}, cube::Cube)
    add = Cube[]
    if cube.on
        for c in cubes
            !c.on && continue
            intcube = intersection(c, cube, false)
            if intcube != false
                push!(add, intcube)
            end
        end
        push!(add, cube)
    else
        for c in cubes
            !c.on && continue
            intcube = intersection(c, cube, false)
            if intcube != false
                push!(add, intcube)
            end
        end
    end

    for c in add
        push!(cubes, c)
    end
end

end # module