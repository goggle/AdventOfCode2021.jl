module Day04

using AdventOfCode2021

function day04(input::String = readInput(joinpath(@__DIR__, "..", "data", "day04.txt")))
    numbers, boards = parse_input(input)
    return solve(numbers, boards)
end

function parse_input(input::AbstractString)
    sinput = split(input, '\n')
    numbers = parse.(Int, split(sinput[1], ','))
    boards = Vector{Matrix{Int}}()
    i = 3
    tmp = Vector{Vector{Int}}()
    while i <= length(sinput)
        if sinput[i] != ""
            push!(tmp, parse.(Int, split(sinput[i])))
        else
            push!(boards, hcat(tmp...))
            tmp = Vector{Vector{Int}}()
        end
        i += 1
    end
    return numbers, boards
end

function won(board::Matrix{Int}, numbers::SubArray{Int, 1, Vector{Int}, Tuple{UnitRange{Int}}, true})
    n, m = size(board)
    for i = 1:n
        all(x -> x ∈ numbers, board[i,:]) && return true
    end
    for j = 1:m
        all(x -> x ∈ numbers, board[:,j]) && return true
    end
    return false
end

function solve(numbers::Vector{Int}, boards::Vector{Matrix{Int}})
    n = 5
    wonboards = zeros(Bool, length(boards))
    p1done, islast = false, false
    p1, p2 = 0, 0
    while n <= length(numbers)
        if sum(wonboards) == length(wonboards) - 1
            islast = true
        end
        for (i, board) in enumerate(boards)
            if !wonboards[i] && won(board, @view(numbers[1:n]))
                wonboards[i] = true
                if !p1done
                    p1 = sum(board[findall(x -> x ∉ @view(numbers[1:n]), board)]) * numbers[n]
                    p1done = true
                end
                if islast
                    p2 = sum(board[findall(x -> x ∉ @view(numbers[1:n]), board)]) * numbers[n]
                    return [p1, p2]
                end
            end
        end
        n += 1
    end
end

end # module
