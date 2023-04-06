module Day03

using AdventOfCode2021

function day03(input::String = readInput(joinpath(@__DIR__, "..", "data", "day03.txt")))
    numbers = parse.(Int, split(rstrip(input)), base = 2)
    gammarate = BitVector()
    i = 0
    while true
        shifted = mod.(numbers .>> i, 2)
        all(i -> i == 0, shifted) && break
        if sum(shifted) > length(shifted) / 2
            push!(gammarate, 1)
        else
            push!(gammarate, 0)
        end
        i += 1
    end
    g, e, v = 0, 0, 1
    for gr in gammarate
        g += gr * v
        e += (1 - gr) * v
        v *= 2
    end
    p1 = g * e

    oxyco2 = [0, 0]
    numbersc = [copy(numbers), copy(numbers)]
    cvals = [[1, 0], [0, 1]]
    for j ∈ 1:2
        for k ∈ i-1:-1:0
            shifted = mod.(numbersc[j] .>> k, 2)
            nones = count(x -> x == 1, shifted)
            nzeros = count(x -> x == 0, shifted)
            if nones >= nzeros
                numbersc[j] = numbersc[j][findall(i -> i == cvals[j][1], shifted)]
            else
                numbersc[j] = numbersc[j][findall(i -> i == cvals[j][2], shifted)]
            end
            if length(numbersc[j]) == 1
                oxyco2[j] = numbersc[j][1]
                break
            end
        end
    end

    return [p1, prod(oxyco2)]
end

end # module
