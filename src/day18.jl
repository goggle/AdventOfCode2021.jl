module Day18

using AdventOfCode2021

function day18(input::String = readInput(joinpath(@__DIR__, "..", "data", "day18.txt")))
    p1 = magnitude(build_sum(input))
    return [p1, part2(input)]
end

function explode!(root)
    return explode!(root, root, Int[])
end

function explode!(root, node, path)
    depth = length(path)
    if depth >= 4 && isa(node[1], Number) && isa(node[2], Number)
        left, right = node[1], node[2]

        # Replace node with 0:
        n = root
        for p in path[1:end-1]
            n = n[p]
        end
        n[path[end]] = 0

        lasti = findlast(==(2), path)
        if lasti !== nothing
            n = root
            for i = 1:lasti-1
                n = n[path[i]]
            end
            if isa(n[1], Number)
                n[1] += left
            else
                n = n[1]
                while true
                    if isa(n[2], Number)
                        n[2] += left
                        break
                    end
                    n = n[2]
                end
            end
        end

        lastj = findlast(==(1), path)
        if lastj !== nothing
            n = root
            for j = 1:lastj-1
                n = n[path[j]]
            end
            if isa(n[2], Number)
                n[2] += right
            else
                n = n[2]
                while true
                    if isa(n[1], Number)
                        n[1] += right
                        break
                    end
                    n = n[1]
                end
            end
        end

        return true
    end
    if !isa(node[1], Number)
        cp = copy(path)
        push!(cp, 1)
        explode!(root, node[1], cp) && return true
    end
    if !isa(node[2], Number)
        cp = copy(path)
        push!(cp, 2)
        explode!(root, node[2], cp) && return true
    end
    return false
end

function _add!(node, preferdir::Int, number::Int)
    d1 = preferdir
    d2 = (d1 == 1 ? 2 : 1)
    if isa(node[d1], Number)
        node[d1] += number
        return true
    end
    if isa(node[d2], Number)
        node[d2] += number
        return true
    end
    _add!(node[d1], preferdir, number) && return true
    _add!(node[d2], preferdir, number) && return true
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

function build_sum(input::String)
    lines = split(rstrip(input), '\n')
    result = Meta.parse(replace(lines[1], "[" => "Any[")) |> eval
    for line in @view lines[2:end]
        second = Meta.parse(replace(line, "[" => "Any[")) |> eval
        result = [result, second]
        reduce!(result)
    end
    return result
end

function magnitude(root)
    isa(root, Number) && return root
    return 3*magnitude(root[1]) + 2*magnitude(root[2])
end

function part2(input::String)
    m = 0
    lines = split(rstrip(input), '\n')
    for i = 1:length(lines)
        for j = 1:length(lines)
            i == j && continue
            s = "Any[" * replace(lines[i], "[" => "Any[") * "," * replace(lines[j], "[" => "Any[") * "]" |> Meta.parse |> eval
            reduce!(s)
            n = magnitude(s)
            if n > m
                m = n
            end
        end
    end
    return m
end

end # module