module Day18

using AdventOfCode2021

mutable struct SnailfishNumber
    left::Union{SnailfishNumber, Int}
    right::Union{SnailfishNumber, Int}
end

function Base.show(io::IO, n::SnailfishNumber)
    print(io, "[")
    if isa(n.left, Int)
        print(io, n.left)
    else
        show(io, n.left)
    end
    print(io, ",")
    if isa(n.right, Int)
        print(io, n.right)
    else
        show(io, n.right)
    end
    print(io, "]")
end

function Base.getindex(n::SnailfishNumber, i::Int)
    i == 1 && return n.left
    i == 2 && return n.right
end

function Base.setindex!(n::SnailfishNumber, v::Int, i::Int)
    if i == 1
        n.left = v
    else
        n.right = v
    end
end

function Base.setindex!(n::SnailfishNumber, v::SnailfishNumber, i::Int)
    if i == 1
        n.left = v
    else
        n.right = v
    end
end


function day18(input::String = readInput(joinpath(@__DIR__, "..", "data", "day18.txt")))
    snailfish_numbers = parse_input(input)
    p1 = snailfish_numbers |> build_sum |> magnitude
    return [p1, part2(input)]
end

function parse_number(line::AbstractString)
    splitted = map(x -> isnumeric(x[1]) ? parse(Int, x) : x[1], split(line, ""))
    return recparse(1, splitted)[2]
end

function recparse(i::Int, characters::Vector{Any})
    if isa(characters[i], Int)
        return i + 1, characters[i]
    end
    i, left = recparse(i + 1, characters)
    i, right = recparse(i + 1, characters)
    return i + 1, SnailfishNumber(left, right)
end

function parse_input(input::String)
    lines = split(rstrip(input), "\n")
    return [parse_number(line) for line in lines]
end

function explode!(root::SnailfishNumber)
    return explode!(root, root, root, Int[])
end

function explode!(root::SnailfishNumber, node::SnailfishNumber, parent::SnailfishNumber, path::Vector{Int})
    depth = length(path)
    if depth >= 4 && isa(node[1], Int) && isa(node[2], Int)
        leftright = SnailfishNumber(node[1], node[2])

        # Replace node with 0:
        parent[path[end]] = 0

        # Add the left and right number to the correct node:
        for (i, j) in zip((1, 2), (2, 1))
            last = findlast(==(j), path)
            if last !== nothing
                n = root
                for i ∈ 1:last-1
                    n = n[path[i]]
                end
                if isa(n[i], Int)
                    n[i] += leftright[i]
                else
                    n = n[i]
                    while true
                        if isa(n[j], Int)
                            n[j] += leftright[i]
                            break
                        end
                        n = n[j]
                    end
                end
            end
        end
        return true
    end
    if !isa(node[1], Int)
        push!(path, 1)
        explode!(root, node[1], node, path) && return true
    end
    if !isa(node[2], Int)
        push!(path, 2)
        explode!(root, node[2], node, path) && return true
    end
    if !isempty(path)
        pop!(path)
    end
    return false
end

function split!(node::SnailfishNumber)
    if isa(node[1], Int) && node[1] >= 10
        l, r = node[1] ÷ 2, isodd(node[1]) ? node[1] ÷ 2 + 1 : node[1] ÷ 2
        node[1] = SnailfishNumber(l, r)
        return true
    end

    for i ∈ 1:2
        if !isa(node[i], Int)
            split!(node[i]) && return true
        end
    end

    if isa(node[2], Int) && node[2] >= 10
        l, r = node[2] ÷ 2, isodd(node[2]) ? node[2] ÷ 2 + 1 : node[2] ÷ 2
        node[2] = SnailfishNumber(l, r)
        return true
    end

    return false
end

function reduce!(root::SnailfishNumber)
    while true
        explode!(root) && continue
        split!(root) && continue
        break
    end
end

function build_sum(snailfish_numbers::Vector{SnailfishNumber})
    sncs = deepcopy(snailfish_numbers)
    result = sncs[1]
    for second in @view sncs[2:end]
        result = SnailfishNumber(result, second)
        reduce!(result)
    end
    return result
end

function magnitude(root::SnailfishNumber)
    return 3 * magnitude(root[1]) + 2 * magnitude(root[2])
end

function magnitude(root::Int)
    return root
end

function part2(input::String)
    lines = split(rstrip(input), "\n")
    splitted_lines = [map(x -> isnumeric(x[1]) ? parse(Int, x) : x[1], split(line, "")) for line in split(rstrip(input), "\n")]
    m = 0
    for i ∈ 1:length(lines)
        for j ∈ 1:length(lines)
            i == j && continue
            sn = SnailfishNumber(recparse(1, splitted_lines[i])[2], recparse(1, splitted_lines[j])[2])
            reduce!(sn)
            n = magnitude(sn)
            if n > m
                m = n
            end
        end
    end
    return m
end

end # module
