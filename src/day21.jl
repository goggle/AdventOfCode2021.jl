module Day21

using AdventOfCode2021

function day21(input::String = readInput(joinpath(@__DIR__, "..", "data", "day21.txt")))
    positions = parse.(Int, map(x -> x[end], split.(split(rstrip(input), "\n"))))
    # return part2(positions)
    return [part1(positions), part2(positions)]
end

function part1(positions::Vector{Int})
    positions = copy(positions)
    scores = [0, 0]
    dice = 0
    dicerolls = 0
    while true
        for i = 1:2
            dicerolls += 3
            s = mod1(dice + 1, 100) + mod1(dice + 2, 100) + mod1(dice + 3, 100)
            dice = mod1(dice + 3, 100)
            positions[i] = mod1(positions[i] + s, 10)
            scores[i] += positions[i]
            if scores[i] >= 1000
                @goto done
            end
        end
    end
    @label done
    return (scores[1] >= 1000 ? scores[2] : scores[1]) * dicerolls
end

function part2(positions::Vector{Int})
    wins = [0, 0]
    part2!(wins, 1, positions[1], positions[2], 0, 0, 1)
    return maximum(wins)
end

function part2!(wins::Vector{Int}, pturn::Int, p1pos::Int, p2pos::Int, p1score::Int, p2score::Int, factor::Int)
    ncomb = (1, 3, 6, 7, 6, 3, 1)
    if pturn == 1
        for (dice, nc) ∈ zip(3:9, ncomb)
            newp1pos = mod1(p1pos + dice, 10)
            newp1score = p1score + newp1pos
            if newp1score >= 21
                wins[1] += factor * nc
                continue
            end
            part2!(wins, 2, newp1pos, p2pos, newp1score, p2score, factor * nc)
        end
    else
        for (dice, nc) ∈ zip(3:9, ncomb)
            newp2pos = mod1(p2pos + dice, 10)
            newp2score = p2score + newp2pos
            if newp2score >= 21
                wins[2] += factor * nc
                continue
            end
            part2!(wins, 1, p1pos, newp2pos, p1score, newp2score, factor * nc)
        end
    end
end

end # module
