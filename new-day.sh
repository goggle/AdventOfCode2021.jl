#!/usr/bin/env zsh

day_num=$1

if [ ${#day_num} -eq 1 ]; then
    day_num_padded="0${day_num}"
else
    day_num_padded="${day_num}"
fi

if ! [[ "${day_num}" =~ ^[0-9]+$ ]]; then
    echo "Provide number of solved day."
    exit 1
fi

# src/AdventOfCode2021.jl
sed -i "/solvedDays/ s/\]/, $1\]/" src/AdventOfCode2021.jl


# README.md
line_readme=$(($(grep -n "The benchmarks have been measured on this machine:" README.md | cut -d : -f 1)-2))

sed -i "${line_readme}i\
| ${day_num} | [:white_check_mark:](https://adventofcode.com/2021/day/${day_num}) |  |  | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day${day_num_padded}.jl)" README.md


# test/runtests.jl
line_test=$(grep -n "end" test/runtests.jl | cut -d : -f 1)

sed -i "${line_test}i\
@testset \"Day ${day_num}\" begin\\
    @test AdventOfCode2021.Day${day_num_padded}.day${day_num_padded}() == " test/runtests.jl


# data
touch "data/day${day_num_padded}.txt"


# src
cat >src/day${day_num_padded}.jl <<EOL
module Day${day_num_padded}

using AdventOfCode2021

function day${day_num_padded}(input::String = readInput(joinpath(@__DIR__, "..", "data", "day${day_num_padded}.txt")))

end

end # module

EOL
