module Day10

using AdventOfCode2021

function day10(input::String = readInput(joinpath(@__DIR__, "..", "data", "day10.txt")))
    lines = split(rstrip(input), '\n')
    return solve(lines)
end

function solve(lines)
    p1score, p2scores = 0, Int[]
    p1points = Dict(')' => 3, ']' => 57, '}' => 1197, '>' => 25137)
    p2points = Dict(')' => 1, ']' => 2, '}' => 3, '>' => 4)
    for (i, line) in enumerate(lines)
        expected = Char[]
        invalid = false
        for c in line
            if c == '('
                push!(expected, c + 1)
            elseif c ∈ ('[', '{', '<')
                push!(expected, c + 2)
            else
                e = pop!(expected)
                if e != c
                    invalid = true
                    p1score += p1points[c]
                    break
                end
            end
        end
        if !invalid
            p2score = 0
            for j ∈ length(expected):-1:1
                p2score *= 5
                p2score += p2points[expected[j]]
            end
            push!(p2scores, p2score)
        end
    end
    return [p1score, sort(p2scores)[length(p2scores)÷2+1]]
end

end # module
