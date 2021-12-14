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
    @test AdventOfCode2021.Day08.day08(sample) == [26, 61229]
    @test AdventOfCode2021.Day08.day08() == [392, 1004688]
end

@testset "Day 9" begin
    sample = "2199943210\n" *
             "3987894921\n" *
             "9856789892\n" *
             "8767896789\n" *
             "9899965678\n"
    @test AdventOfCode2021.Day09.day09(sample) == [15, 1134]
    @test AdventOfCode2021.Day09.day09() == [486, 1059300]
end

@testset "Day 10" begin
    sample = "[({(<(())[]>[[{[]{<()<>>\n" *
             "[(()[<>])]({[<{<<[]>>(\n" *
             "{([(<{}[<>[]}>{[]{[(<()>\n" *
             "(((({<>}<{<{<>}{[]{[]{}\n" *
             "[[<[([]))<([[{}[[()]]]\n" *
             "[{[{({}]{}}([{[{{{}}([]\n" *
             "{<[[]]>}<{[{[{[]{()[[[]\n" *
             "[<(<(<(<{}))><([]([]()\n" *
             "<{([([[(<>()){}]>(<<{{\n" *
             "<{([{{}}[<[[[<>{}]]]>[]]\n"
    @test AdventOfCode2021.Day10.day10(sample) == [26397, 288957]
    @test AdventOfCode2021.Day10.day10() == [311895, 2904180541]
end

@testset "Day 11" begin
    sample = "5483143223\n" *
             "2745854711\n" *
             "5264556173\n" *
             "6141336146\n" *
             "6357385478\n" *
             "4167524645\n" *
             "2176841721\n" *
             "6882881134\n" *
             "4846848554\n" *
             "5283751526\n"
    @test AdventOfCode2021.Day11.day11(sample) == [1656, 195]
    @test AdventOfCode2021.Day11.day11() == [1649, 256]
end

@testset "Day 12" begin
    sample1 = "start-A\n" *
              "start-b\n" *
              "A-c\n" *
              "A-b\n" *
              "b-d\n" *
              "A-end\n" *
              "b-end\n"
    sample2 = "dc-end\n" *
              "HN-start\n" *
              "start-kj\n" *
              "dc-start\n" *
              "dc-HN\n" *
              "LN-dc\n" *
              "HN-end\n" *
              "kj-sa\n" *
              "kj-HN\n" *
              "kj-dc\n"
    sample3 = "fs-end\n" *
              "he-DX\n" *
              "fs-he\n" *
              "start-DX\n" *
              "pj-DX\n" *
              "end-zg\n" *
              "zg-sl\n" *
              "zg-pj\n" *
              "pj-he\n" *
              "RW-he\n" *
              "fs-DX\n" *
              "pj-RW\n" *
              "zg-RW\n" *
              "start-pj\n" *
              "he-WI\n" *
              "zg-he\n" *
              "pj-fs\n" *
              "start-RW\n"
    @test AdventOfCode2021.Day12.day12(sample1) == [10, 36]
    @test AdventOfCode2021.Day12.day12(sample2) == [19, 103]
    @test AdventOfCode2021.Day12.day12(sample3) == [226, 3509]
    @test AdventOfCode2021.Day12.day12() == [4167, 98441]
end

@testset "Day 13" begin
    sample = "6,10\n" *
             "0,14\n" *
             "9,10\n" *
             "0,3\n" *
             "10,4\n" *
             "4,11\n" *
             "6,0\n" *
             "6,12\n" *
             "4,1\n" *
             "0,13\n" *
             "10,12\n" *
             "3,4\n" *
             "3,0\n" *
             "8,4\n" *
             "1,10\n" *
             "2,14\n" *
             "8,10\n" *
             "9,0\n" *
             "\n" *
             "fold along y=7\n" *
             "fold along x=5\n"
    expected_s2 = "█████\n" *
                  "█   █\n" *
                  "█   █\n" *
                  "█   █\n" *
                  "█████\n"
    @test AdventOfCode2021.Day13.day13(sample) == [17, expected_s2]
    expected_p2 = "████  ██  █  █  ██  █  █ ███  ████  ██ \n" *
                  "█    █  █ █ █  █  █ █ █  █  █    █ █  █\n" *
                  "███  █    ██   █    ██   ███    █  █   \n" *
                  "█    █ ██ █ █  █    █ █  █  █  █   █ ██\n" *
                  "█    █  █ █ █  █  █ █ █  █  █ █    █  █\n" *
                  "█     ███ █  █  ██  █  █ ███  ████  ███\n"
    @test AdventOfCode2021.Day13.day13() == [687, expected_p2]
end

@testset "Day 14" begin
    toysample = "ABBA\n" *
                "\n" *
                "AB -> A\n" *
                "BA -> B\n" *
                "BB -> B\n" *
                "AA -> A\n"
    sample = "NNCB\n" *
             "\n" *
             "CH -> B\n" *
             "HH -> N\n" *
             "CB -> H\n" *
             "NH -> C\n" *
             "HB -> C\n" *
             "HC -> B\n" *
             "HN -> C\n" *
             "NN -> C\n" *
             "BH -> H\n" *
             "NC -> B\n" *
             "NB -> B\n" *
             "BN -> B\n" *
             "BB -> N\n" *
             "BC -> B\n" *
             "CC -> N\n" *
             "CN -> C\n"
    @test AdventOfCode2021.Day14.day14(toysample) == [1023, 1099511627775]
    @test AdventOfCode2021.Day14.day14(sample) == [1588, 2188189693529]
    @test AdventOfCode2021.Day14.day14() == [3406, 3941782230241]
end