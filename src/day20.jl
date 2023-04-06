module Day20

using AdventOfCode2021
using StaticArrays

function day20(input::String = readInput(joinpath(@__DIR__, "..", "data", "day20.txt")))
    lines = split(input)
    algorithm = map(x -> (x == "#" ? true : false), split(lines[1], ""))
    image = map(x -> (x == '#' ? true : false), hcat(reduce.(vcat, lines[2:end])...))' |> collect
    image, outsidepixelset = enhance(algorithm, image, false, 2)
    p1 = image |> sum
    p2 = enhance(algorithm, image, outsidepixelset, 48)[1] |> sum
    return [p1, p2]
end

function enhance(algorithm, image, outsidepixelset, niter)
    for _ ∈ 1:niter
        image, outsidepixelset = apply_algorithm(algorithm, image, outsidepixelset)
    end
    return image, outsidepixelset
end

function apply_algorithm(algorithm, image, outsidepixelset)
    cimage = fill(outsidepixelset, size(image, 1) + 2, size(image, 2) + 2)
    cimage[2:size(image, 1)+1, 2:size(image, 2)+1] = image
    eimage = similar(cimage)
    for i ∈ 1:size(cimage, 1)
        for j ∈ 1:size(cimage, 2)
            values = MVector(256, 128, 64, 32, 16, 8, 4, 2, 1)
            for m ∈ i-1:i+1
                for n ∈ j-1:j+1
                    if !checkbounds(Bool, cimage, m, n)
                        pixel = outsidepixelset
                    else
                        pixel = cimage[m, n]
                    end
                    if !pixel
                        values[3*(m-i+1)+n-j+1+1] = 0
                    end
                end
            end
            eimage[i, j] = algorithm[(values|>sum)+1]
        end
    end
    outsidepixelset = (outsidepixelset ? algorithm[end] : algorithm[1])
    return eimage, outsidepixelset
end

end # module
