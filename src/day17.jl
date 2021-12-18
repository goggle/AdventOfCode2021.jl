module Day17

using AdventOfCode2021

function day17(input::String = readInput(joinpath(@__DIR__, "..", "data", "day17.txt")))
    m = match(r"x=(-?\d+)\.\.(-?\d+)\s*,\s*y=(-?\d+)\.\.(-?\d+)", input)
    target = parse.(Int, m.captures)
    part1(target)
end

function part1(target::Vector{Int})
    solutions = Set{Tuple{Int,Int}}()
    vxbounds = floor.(Int, -0.5 .+ sqrt.(2*target[1:2]) + [1, 0])
    
    # Vertical drops:
    for vx = vxbounds[1]:vxbounds[2]
        vy = -1 - target[3]
        while vy > 0 # can we do better here?
            n = 2*vy + 2
            while n * vy - n * (n - 1) ÷ 2 >= target[3]
                if in_target(n, vx, vy, target)
                    push!(solutions, (vx, vy))
                end
                n += 1
            end
            vy -= 1
        end
    end

    # Non-vertical drops:
    for vx = floor(Int, -0.5 + sqrt(2*target[2] + 0.25))-1:target[2]
        for vy = target[3]:-1-target[3]
            n = 1
            while n * vx - n * (n - 1) ÷ 2 <= target[2] && n * vy - n * (n - 1) ÷ 2 >= target[3]
                if in_target(n, vx, vy, target)
                    push!(solutions, (vx, vy))
                end
                n += 1
            end
        end
    end
    vymax = maximum(x -> x[2], solutions)
    return [vymax * (vymax + 1) ÷ 2, length(solutions)]
end

function in_target(n::Int, vx::Int, vy::Int, target::Vector{Int})
    if n >= vx
        x = (vx^2 + vx) ÷ 2
    else
        x = n * vx - n * (n - 1) ÷ 2
    end
    y = n * vy - n * (n - 1) ÷ 2
    return target[1] <= x <= target[2] && target[3] <= y <= target[4]
end

end # module