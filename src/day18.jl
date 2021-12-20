module Day18

using AdventOfCode2021

function day18(input::String = readInput(joinpath(@__DIR__, "..", "data", "day18.txt")))
    snailfish_numbers = parse_input(input)
    p1 = snailfish_numbers |> build_sum |> magnitude
    return [p1, part2(snailfish_numbers)]
end

function parse_input(input::String)
    return [replace(x, "[" => "Any[") |> Meta.parse |> eval for x in split(rstrip(input), '\n')]
end

function explode!(root)
    return explode!(root, root, Int[])
end

function explode!(root, node, path)
    depth = length(path)
    if depth >= 4 && isa(node[1], Number) && isa(node[2], Number)
        leftright = [node[1], node[2]]

        # Replace node with 0:
        n = root
        for p in path[1:end-1]
            n = n[p]
        end
        n[path[end]] = 0

        # Add the left and right number to the correct node:
        for (i, j) in zip((1, 2), (2, 1))
            last = findlast(==(j), path)
            if last !== nothing
                n = root
                for i = 1:last-1
                    n = n[path[i]]
                end
                if isa(n[i], Number)
                    n[i] += leftright[i]
                else
                    n = n[i]
                    while true
                        if isa(n[j], Number)
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
    if !isa(node[1], Number)
        push!(path, 1)
        explode!(root, node[1], path) && return true
    end
    if !isa(node[2], Number)
        push!(path, 2)
        explode!(root, node[2], path) && return true
    end
    if !isempty(path)
        pop!(path)
    end
    return false
end

function split!(node)
    if isa(node[1], Number) && node[1] >= 10
        l, r = node[1] ÷ 2, node[1] ÷ 2
        if isodd(node[1])
            r += 1
        end
        node[1] = Any[l, r]
        return true
    end

    for i = 1:2
        if !isa(node[i], Number)
            split!(node[i]) && return true
        end
    end

    if isa(node[2], Number) && node[2] >= 10
        l, r = node[2] ÷ 2, node[2] ÷ 2
        if isodd(node[2])
            r += 1
        end
        node[2] = Any[l, r]
        return true
    end

    return false
end

function reduce!(root)
    while true
        explode!(root) && continue
        split!(root) && continue
        break
    end
end

function build_sum(snailfish_numbers)
    sncs = deepcopy(snailfish_numbers)
    result = sncs[1]
    for second in @view sncs[2:end]
        result = [result, second]
        reduce!(result)
    end
    return result
end

function magnitude(root)
    isa(root, Number) && return root
    return 3*magnitude(root[1]) + 2*magnitude(root[2])
end

function part2(snailfish_numbers)
    m = 0
    for i = 1:length(snailfish_numbers)
        for j = 1:length(snailfish_numbers)
            i == j && continue
            sn = [deepcopy(snailfish_numbers[i]), deepcopy(snailfish_numbers[j])]
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