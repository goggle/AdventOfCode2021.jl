module Day14

using AdventOfCode2021

function day14(input::String = readInput(joinpath(@__DIR__, "..", "data", "day14.txt")))
    sinput = split(rstrip(input), '\n')
    template = sinput[1]
    rules = Dict(map(x -> Pair(strip(x[1]), strip(x[2])[1]), split.(sinput[3:end], "->")))
    return [solve(template, rules, 10), solve(template, rules, 40)]
end

function solve(template, rules, niter)
    elements = unique(vcat(collect(values(rules)), collect(template)))
    pairc = Dict{String, Int}()
    for i = 1:length(elements)
        for j = 1:length(elements)
            pairc[join((elements[i], elements[j]))] = 0
        end
    end

    cdict = Dict(c => 0 for c in elements)
    for i = 1:length(template) - 1
        pairc[template[i:i+1]] += 1
    end

    leftmostpair = template[1:2]
    rightmostpair = template[end-1:end]
    for _ = 1:niter
        paircc = copy(pairc)
        pairc = Dict(x => 0 for x in keys(pairc))
        for (k, v) in paircc
            pairc[join((k[1], rules[k]))] += v
            pairc[join((rules[k], k[2]))] += v
        end
        leftmostpair = join((leftmostpair[1], rules[leftmostpair]))
        rightmostpair = join((rules[rightmostpair], rightmostpair[2]))
    end

    cdict = Dict(c => 0 for c in elements)
    for (k, v) in pairc
        for c in k
            cdict[c] += v
        end
    end
    cdict[leftmostpair[1]] += 1
    cdict[rightmostpair[2]] += 1
    
    return -(extrema(values(cdict) .÷ 2)...) |> abs
end

end # module
