module Day24

using AdventOfCode2021

function day24(input::String = readInput(joinpath(@__DIR__, "..", "data", "day24.txt")))
    instructions = parse_input(input)
    return solve(instructions)
end

function parse_input(input::String)
    instructions = []
    for line in split.(split(rstrip(input), "\n"))
        if line[1] == "inp"
            push!(instructions, (line[1], line[2][1]))
        else
            x = tryparse(Int, line[3])
            if x === nothing
                push!(instructions, (line[1], line[2][1], line[3][1]))
            else
                push!(instructions, (line[1], line[2][1], x))
            end
        end
    end
    return instructions
end

function split_program(program)
    programs = []
    for instruction in program
        if instruction[1] == "inp"
            push!(programs, [])
        end
        push!(programs[end], instruction)
    end
    return programs
end

function solve(instructions)
    # Note: This solution uses some concrete analysis of my personal input.
    # It is not guaranteed to work on every distributed input.
    #
    # The input consists of 14 different subprograms.
    # Every subprogram can be categorized into two different types (type 1 or type 2).
    #
    # Type 1 programs change the value of `z` by the following rule
    #    z = 26 * z + input + some_number
    # where `some_number` are the values in `add_to_z`
    #
    # Type 2 programs change the value of `z` by the rule
    #    z = z ÷ 26
    # iff
    #    z % 26 + some_number == input    (*)
    # where `some_number` is `add_to_x`
    #
    # To achieve a `z` value of 0 at the end, we must make sure that type 2 programs
    # always reduce the value of `z` (by fullfilling (*))
    # The values of type 1 programs need to be guessed. Here I use a recursive backtracking search.
    programs = split_program(instructions)
    type_one_programs = [!isempty(findall(x -> (x[1] == "div" && x[2] == 'z' && x[3] == 1), program)) for program in programs]
    add_to_x = [program[findfirst(x -> (x[1] == "add" && x[2] == 'x' && isa(x[3], Int)), program)][3] for program in programs]
    add_to_z = [program[findlast(x -> (x[1] == "add" && x[2] == 'y' && isa(x[3], Int)), program)][3] for program in programs]

    inputs = Int[]
    solve!(inputs, programs, 1, 0, type_one_programs, add_to_x, add_to_z, true)
    part1 = parse(Int, join(inputs))
    inputs = Int[]
    solve!(inputs, programs, 1, 0, type_one_programs, add_to_x, add_to_z, false)
    part2 = parse(Int, join(inputs))
    return [part1, part2]
end

function solve!(inputs, programs, programnumber, z, type_one_programs, add_to_x, add_to_z, p1)
    length(inputs) == length(programs) && return true
    if type_one_programs[programnumber]
        range = (p1 == true ? (9:-1:1) : (1:9))
        for w ∈ range
            push!(inputs, w)
            result = solve!(inputs, programs, programnumber + 1, 26 * z + w + add_to_z[programnumber], type_one_programs, add_to_x, add_to_z, p1)
            if !result
                pop!(inputs)
                continue
            end
            return result
        end
        return false
    else
        value = mod(z, 26) + add_to_x[programnumber]
        value ∉ 1:9 && return false
        push!(inputs, value)
        result = solve!(inputs, programs, programnumber + 1, z ÷ 26, type_one_programs, add_to_x, add_to_z, p1)
        if !result
            pop!(inputs)
        end
        return result
    end
end

end # module
