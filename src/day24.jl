module Day24

using AdventOfCode2021


function day24(input::String = readInput(joinpath(@__DIR__, "..", "data", "day24.txt")))
    instructions, registers = parse_input(input)
    inp = 23179246899999
    run!(instructions, registers, inp)
    
end

function parse_input(inp::String)
    instructions = []
    registers = Set{Char}()
    for line in split.(split(rstrip(inp), "\n"))
        if line[1] == "inp"
            push!(instructions, (input,  Union{Int,Char}[line[2][1]]))
            push!(registers, line[2][1])
        elseif line[1] == "add"
            x = tryparse(Int, line[3])
            if x === nothing
                push!(instructions, (add, Union{Int,Char}[line[2][1], line[3][1]]))
                push!(registers, line[3][1])
            else
                push!(instructions, (add, Union{Int,Char}[line[2][1], x]))
            end
        elseif line[1] == "mul"
            x = tryparse(Int, line[3])
            if x === nothing
                push!(instructions, (multiply, Union{Int,Char}[line[2][1], line[3][1]]))
                push!(registers, line[3][1])
            else
                push!(instructions, (multiply, Union{Int,Char}[line[2][1], x]))
            end
        elseif line[1] == "div"
            x = tryparse(Int, line[3])
            if x === nothing
                push!(instructions, (divide, Union{Int,Char}[line[2][1], line[3][1]]))
                push!(registers, line[3][1])
            else
                push!(instructions, (divide, Union{Int,Char}[line[2][1], x]))
            end
        elseif line[1] == "mod"
            x = tryparse(Int, line[3])
            if x === nothing
                push!(instructions, (modulo, Union{Int,Char}[line[2][1], line[3][1]]))
                push!(registers, line[3][1])
            else
                push!(instructions, (modulo, Union{Int,Char}[line[2][1], x]))
            end
        elseif line[1] == "eql"
            x = tryparse(Int, line[3])
            if x === nothing
                push!(instructions, (equal, Union{Int,Char}[line[2][1], line[3][1]]))
                push!(registers, line[3][1])
            else
                push!(instructions, (equal, Union{Int,Char}[line[2][1], x]))
            end
        end
    end
    return instructions, registers
end

function run!(instructions, reg::Set{Char}, inp::Int)
    registers = Dict{Char,Int}()
    for r ∈ reg
        registers[r] = 0
    end
    add_input_to_program!(instructions, inp)
    for (instruction, params) ∈ instructions
        instruction(registers, params...)
    end
    return registers
end

function add_input_to_program!(instructions, inp::Int)
    digs = reverse(digits(inp))
    i = 1
    for instruction ∈ instructions
        if instruction[1] == input
            if length(instruction[2]) == 1
                push!(instruction[2], digs[i])
            else
                instruction[2][2] = digs[i]
            end
            i += 1
        end
    end
end

function input(reg::Dict{Char,Int}, a::Char, inp::Int)
    reg[a] = inp
end

function add(reg::Dict{Char,Int}, a::Char, b::Int)
    reg[a] += b
end

function add(reg::Dict{Char,Int}, a::Char, b::Char)
    reg[a] += reg[b]
end

function multiply(reg::Dict{Char,Int}, a::Char, b::Int)
    reg[a] *= b
end

function multiply(reg::Dict{Char,Int}, a::Char, b::Char)
    reg[a] *= reg[b]
end

function divide(reg::Dict{Char,Int}, a::Char, b::Int)
    reg[a] ÷= b
end

function divide(reg::Dict{Char,Int}, a::Char, b::Char)
    reg[a] ÷= reg[b]
end

function modulo(reg::Dict{Char,Int}, a::Char, b::Int)
    reg[a] = mod(reg[a], b)
end

function modulo(reg::Dict{Char,Int}, a::Char, b::Char)
    reg[a] = mod(reg[a], reg[b])
end

function equal(reg::Dict{Char,Int}, a::Char, b::Int)
    if reg[a] == b
        reg[a] = 1
    else
        reg[a] = 0
    end
end

function equal(reg::Dict{Char,Int}, a::Char, b::Char)
    if reg[a] == reg[b]
        reg[a] = 1
    else
        reg[a] = 0
    end
end



end # module
