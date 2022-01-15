module Day22

using AdventOfCode2021

struct Cube
    on::Bool
    data::NTuple{6,Int}
end

function day22(input::String = readInput(joinpath(@__DIR__, "..", "data", "day22.txt")))
    cubes = parse_input(input)
    cubelist = Cube[]
    for instruction in cubes
        instruction!(cubelist, instruction)
    end
    return [crop_volume.(cubelist) |> sum, volume.(cubelist) |> sum]
end

function parse_input(input::String)
    r = r"(on|off)\s*x=(-?\d+)\.\.(-?\d+)\s*,\s*y=(-?\d+)\.\.(-?\d+)\s*,\s*z=(-?\d+)\.\.(-?\d+)"
    cubes = Cube[]
    for line in split(rstrip(input), "\n")
        m = match(r, line)
        on = (m.captures[1] == "on" ? true : false)
        push!(cubes, Cube(on, Tuple(parse.(Int, m.captures[2:7])))) 
    end
    return cubes
end

function intersection(cube::Cube, other::Cube, onoff::Bool)
    xintersection = intersect(cube.data[1]:cube.data[2], other.data[1]:other.data[2])
    xintersection.start > xintersection.stop && return false
    yintersection = intersect(cube.data[3]:cube.data[4], other.data[3]:other.data[4])
    yintersection.start > yintersection.stop && return false
    zintersection = intersect(cube.data[5]:cube.data[6], other.data[5]:other.data[6])
    zintersection.start > zintersection.stop && return false
    return Cube(onoff, (xintersection.start, xintersection.stop, yintersection.start, yintersection.stop, zintersection.start, zintersection.stop))
end

function volume(cube::Cube)
    return (cube.on ? 1 : -1) * (cube.data[2] - cube.data[1] + 1) * (cube.data[4] - cube.data[3] + 1) * (cube.data[6] - cube.data[5] + 1)
end

function crop_volume(cube::Cube)
    intcube = intersection(cube, Cube(true, (-50, 50, -50, 50, -50, 50)), cube.on)
    intcube == false && return 0
    return volume(intcube)
end

function instruction!(cubes::Vector{Cube}, cube::Cube)
    add = Cube[]
    for c in cubes
        intcube = intersection(c, cube, !c.on)
        if intcube != false
            push!(add, intcube)
        end
    end
    if cube.on
        push!(add, cube)
    end
    push!(cubes, add...)
end

end # module