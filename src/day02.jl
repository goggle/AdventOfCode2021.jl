module Day02

using AdventOfCode2021

function day02(input::String = readInput(joinpath(@__DIR__, "..", "data", "day02.txt")))
    vertical, horizontal, vertical_p2, aim = 0, 0, 0, 0
    for line in split(rstrip(input), '\n')
        dir, x = split(line)
        x = parse(Int, x)
        if dir == "forward"
            horizontal += x
            vertical_p2 += aim * x
        elseif dir == "up"
            vertical -= x
            aim -= x
        elseif dir == "down"
            vertical += x
            aim += x
        end
    end
    return [vertical * horizontal, vertical_p2 * horizontal]
end

end # module
