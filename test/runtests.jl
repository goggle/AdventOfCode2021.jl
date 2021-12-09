using AdventOfCode2021
using Test

@testset "Day 1" begin
    @test AdventOfCode2021.Day01.day01() == [1527, 1575]
end

@testset "Day 2" begin
    @test AdventOfCode2021.Day02.day02() == [1714680, 1963088820]
end

@testset "Day 3" begin
    sample = "00100\n" *
             "11110\n" *
             "10110\n" *
             "10111\n" *
             "10101\n" *
             "01111\n" *
             "00111\n" *
             "11100\n" *
             "10000\n" *
             "11001\n" *
             "00010\n" *
             "01010\n"
    @test AdventOfCode2021.Day03.day03(sample) == [198, 230]
    @test AdventOfCode2021.Day03.day03() == [1997414, 1032597]
end

@testset "Day 4" begin
    sample = "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1\n" *
             "\n" *
             "22 13 17 11  0\n" *
             " 8  2 23  4 24\n" *
             "21  9 14 16  7\n" *
             " 6 10  3 18  5\n" *
             " 1 12 20 15 19\n" *
             "\n" *
             " 3 15  0  2 22\n" *
             " 9 18 13 17  5\n" *
             "19  8  7 25 23\n" *
             "20 11 10 24  4\n" *
             "14 21 16 12  6\n" *
             "\n" *
             "14 21 17 24  4\n" *
             "10 16 15  9 19\n" *
             "18  8 23 26 20\n" *
             "22 11 13  6  5\n" *
             " 2  0 12  3  7\n"
    @test AdventOfCode2021.Day04.day04(sample) == [4512, 1924]
    @test AdventOfCode2021.Day04.day04() == [67716, 1830]
end

@testset "Day 5" begin
    sample = "0,9 -> 5,9\n" *
             "8,0 -> 0,8\n" *
             "9,4 -> 3,4\n" *
             "2,2 -> 2,1\n" *
             "7,0 -> 7,4\n" *
             "6,4 -> 2,0\n" *
             "0,9 -> 2,9\n" *
             "3,4 -> 1,4\n" *
             "0,0 -> 8,8\n" *
             "5,5 -> 8,2\n"
    @test AdventOfCode2021.Day05.day05(sample) == [5, 12]
    @test AdventOfCode2021.Day05.day05() == [5835, 17013]
end

@testset "Day 6" begin
    sample = "3,4,3,1,2\n"
    @test AdventOfCode2021.Day06.day06(sample) == [5934, 26984457539]
    @test AdventOfCode2021.Day06.day06() == [393019, 1757714216975]
end

@testset "Day 7" begin
    sample = "16,1,2,0,4,2,7,1,2,14\n"
    @test AdventOfCode2021.Day07.day07(sample) == [37, 168]
    @test AdventOfCode2021.Day07.day07() == [326132, 88612508]
end

@testset "Day 8" begin
    sample = "be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb |  fdgacbe cefdb cefbgd gcbe\n" *
             "edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec |  fcgedb cgb dgebacf gc\n" *
             "fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef |  cg cg fdcagb cbg\n" *
             "fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega |  efabcd cedba gadfec cb\n" *
             "aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga |  gecf egdcabf bgf bfgea\n" *
             "fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf |  gebdcfa ecba ca fadegcb\n" *
             "dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf |  cefg dcbef fcge gbcadfe\n" *
             "bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd |  ed bcgafe cdgba cbgef\n" *
             "egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg |  gbdfcae bgc cg cgb\n" *
             "gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc |  fgae cfgab fg bagce\n"
end