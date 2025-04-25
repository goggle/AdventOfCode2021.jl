[![CI](https://github.com/goggle/AdventOfCode2021.jl/workflows/CI/badge.svg)](https://github.com/goggle/AdventOfCode2021.jl/actions?query=workflow%3ACI+branch%3Amaster)
[![Code coverage](https://codecov.io/gh/goggle/AdventOfCode2021.jl/branch/master/graphs/badge.svg?branch=master)](https://codecov.io/github/goggle/AdventOfCode2021.jl?branch=master)

# AdventOfCode2021.jl

This Julia package contains my solutions for [Advent of Code 2021](https://adventofcode.com/2021/).

## Overview

| Day | Problem | Time | Allocated memory | Source |
|----:|:-------:|-----:|-----------------:|:------:|
| 1 | [:white_check_mark:](https://adventofcode.com/2021/day/1) | 229.536 μs | 280.36 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day01.jl) |
| 2 | [:white_check_mark:](https://adventofcode.com/2021/day/2) | 381.073 μs | 330.58 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day02.jl) |
| 3 | [:white_check_mark:](https://adventofcode.com/2021/day/3) | 282.606 μs | 280.73 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day03.jl) |
| 4 | [:white_check_mark:](https://adventofcode.com/2021/day/4) | 4.765 ms | 5.50 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day04.jl) |
| 5 | [:white_check_mark:](https://adventofcode.com/2021/day/5) | 1.290 ms | 2.09 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day05.jl) |
| 6 | [:white_check_mark:](https://adventofcode.com/2021/day/6) | 35.866 μs | 40.83 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day06.jl) |
| 7 | [:white_check_mark:](https://adventofcode.com/2021/day/7) | 1.536 ms | 73.33 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day07.jl) |
| 8 | [:white_check_mark:](https://adventofcode.com/2021/day/8) | 1.526 ms | 1.20 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day08.jl) |
| 9 | [:white_check_mark:](https://adventofcode.com/2021/day/9) | 3.343 ms | 2.57 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day09.jl) |
| 10 | [:white_check_mark:](https://adventofcode.com/2021/day/10) | 208.374 μs | 35.25 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day10.jl) |
| 11 | [:white_check_mark:](https://adventofcode.com/2021/day/11) | 1.267 ms | 617.28 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day11.jl) |
| 12 | [:white_check_mark:](https://adventofcode.com/2021/day/12) | 16.309 ms | 1.51 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day12.jl) |
| 13 | [:white_check_mark:](https://adventofcode.com/2021/day/13) | 1.091 ms | 1.02 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day13.jl) |
| 14 | [:white_check_mark:](https://adventofcode.com/2021/day/14) | 2.242 ms | 2.01 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day14.jl) |
| 15 | [:white_check_mark:](https://adventofcode.com/2021/day/15) | 92.165 ms | 11.78 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day15.jl) |
| 16 | [:white_check_mark:](https://adventofcode.com/2021/day/16) | 737.630 μs | 938.31 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day16.jl) |
| 17 | [:white_check_mark:](https://adventofcode.com/2021/day/17) | 1.069 ms | 364.98 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day17.jl) |
| 18 | [:white_check_mark:](https://adventofcode.com/2021/day/18) | 167.326 ms | 73.21 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day18.jl) |
| 19 | [:white_check_mark:](https://adventofcode.com/2021/day/19) | 87.311 ms | 152.01 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day19.jl) |
| 20 | [:white_check_mark:](https://adventofcode.com/2021/day/20) | 83.659 ms | 95.07 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day20.jl) |
| 21 | [:white_check_mark:](https://adventofcode.com/2021/day/21) | 10.961 ms | 4.56 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day21.jl) |
| 22 | [:white_check_mark:](https://adventofcode.com/2021/day/22) | 51.400 ms | 17.66 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day22.jl) |
| 23 | [:white_check_mark:](https://adventofcode.com/2021/day/23) | 145.446 ms | 44.15 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day23.jl) |
| 24 | [:white_check_mark:](https://adventofcode.com/2021/day/24) | 2.247 ms | 160.56 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day24.jl) |
| 25 | [:white_check_mark:](https://adventofcode.com/2021/day/25) | 32.100 ms | 49.86 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2021.jl/blob/master/src/day25.jl) |


The benchmarks have been measured on this machine:
```
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
  CPU: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.0 (ORCJIT, skylake)
```


## Installation and Usage

Make sure you have [Julia 1.5 or newer](https://julialang.org/downloads/)
installed on your system.


### Installation

Start Julia and enter the package REPL by typing `]`. Create a new
environment:
```julia
(@v1.5) pkg> activate aoc
```

Install `AdventOfCode2021.jl`:
```
(aoc) pkg> add https://github.com/goggle/AdventOfCode2021.jl
```

Go back to the Julia REPL by pushing the `backspace` button.


### Usage

First, activate the package:
```julia
julia> using AdventOfCode2021
```

Each puzzle can now be run with `dayXY()`:
```julia
julia> day01()
2-element Vector{Int64}:
 1527
 1575
```

This will use my personal input. If you want to use another input, provide it
to the `dayXY` method as a string. You can also use the `readInput` method
to read your input from a text file:
```julia
julia> input = readInput("/path/to/input.txt")

julia> AdventOfCode2021.Day01.day01(input)
2-element Vector{Int64}:
 1527
 1575
```
