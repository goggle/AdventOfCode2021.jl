module Day08

using AdventOfCode2021
using Combinatorics

function day08(input::String = readInput(joinpath(@__DIR__, "..", "data", "day08.txt")))
    signals, outputs = parse_input(input)
    p1 = count(out -> mapreduce(i -> mod(out >> i, 2), +, 0:7) ∈ (2, 3, 4, 7), Iterators.flatten(outputs))
    p2 = part2(signals, outputs)
    return [p1, p2]
end

function parse_input(input::String)
    lines = split(rstrip(input), '\n')
    signals = Vector{Vector{Int}}(undef, length(lines))
    outputs = Vector{Vector{Int}}(undef, length(lines))
    for (i, line) in enumerate(lines)
        left, right = split.(split(line, '|'))
        signals[i] = [mapreduce(x -> 1 << (x - 'a'), +, s) for s in left]
        outputs[i] = [mapreduce(x -> 1 << (x - 'a'), +, s) for s in right]
    end
    return signals, outputs
end

function part2(signals::Vector{Vector{Int}}, outputs::Vector{Vector{Int}})
    p2 = 0
    for (signs, outs) in zip(signals, outputs)
        codes = vcat(signs, outs)
        for permutation in Combinatorics.permutations(1:7)
            passed = true
            for code in codes
                if decode(code; permutation=permutation) < 0
                    passed = false
                    break
                end
            end
            !passed && continue
            p2 += decode.(outs; permutation=permutation) .* (1000, 100, 10, 1) |> sum
            break
        end
    end
    return p2
end

function decode(n::Int;  permutation=1:7)
    m = 0
    for (i, p) ∈ enumerate(permutation)
        m += mod(n >> (i-1), 2) * (1 << (p-1))
    end
    m == 119 && return 0
    m == 18 && return 1
    m == 93 && return 2
    m == 91 && return 3
    m == 58 && return 4
    m == 107 && return 5
    m == 111 && return 6
    m == 82 && return 7
    m == 127 && return 8
    m == 123 && return 9
    return -1
end

end # module
