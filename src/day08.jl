module Day08

using AdventOfCode2021

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
        for permutation in find_permutations(signs)
            if all(decode.(signs, permutation=permutation) .>= 0)
                p2 += decode.(outs; permutation=permutation) .* (1000, 100, 10, 1) |> sum
                break
            end
        end
    end
    return p2
end

function find_permutations(signals::Vector{Int})
    # Calculate the sum of the bits at position n for n = 1:7.
    # By comparison of the result of the original encoding, we know that
    # position of 4 ↦ 3
    # position of 6 ↦ 6
    # position of 9 ↦ 2
    # positions of 7 ↦ 1 or 4
    # positions of 8 ↦ 5 or 7
    # This gives 4 possible permutations.
    sdigs = (digits.(signals, base=2, pad=7)) |> sum
    four = findfirst(x -> x == 4, sdigs)
    six = findfirst(x -> x == 6, sdigs)
    nine = findfirst(x -> x == 9, sdigs)
    seven = findall(x -> x == 7, sdigs)
    eight = findall(x -> x == 8, sdigs)
    permutations = [zeros(Int, 7) for _ = 1:4]
    for (i, s, e) = zip(1:4, ((1, 4), (1, 4), (4, 1), (4, 1)), ((5, 7), (7, 5), (5, 7), (7, 5)))
        permutations[i][[four, six, nine]] .= 3, 6, 2
        permutations[i][seven] .= s
        permutations[i][eight] .= e
    end
    return permutations
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
