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

@testset "Day 15" begin
    sample = "1163751742\n" *
             "1381373672\n" *
             "2136511328\n" *
             "3694931569\n" *
             "7463417111\n" *
             "1319128137\n" *
             "1359912421\n" *
             "3125421639\n" *
             "1293138521\n" *
             "2311944581\n"
    @test AdventOfCode2021.Day15.day15(sample) == [40, 315]
    @test AdventOfCode2021.Day15.day15() == [698, 3022]
end

@testset "Day 16" begin
    ssample1 = "8A004A801A8002F478"
    ssample2 = "620080001611562C8802118E34"
    ssample3 = "C0015000016115A2E0802F182340"
    ssample4 = "A0016C880162017C3686B18A3D4780"
    vsample1 = "C200B40A82"
    vsample2 = "04005AC33890"
    vsample3 = "880086C3E88112"
    vsample4 = "CE00C43D881120"
    vsample5 = "D8005AC2A8F0"
    vsample6 = "F600BC2D8F"
    vsample7 = "9C005AC2F8F0"
    vsample8 = "9C0141080250320F1802104A08"
    @test AdventOfCode2021.Day16.day16(ssample1) == [16, 15]
    @test AdventOfCode2021.Day16.day16(ssample2) == [12, 46]
    @test AdventOfCode2021.Day16.day16(ssample3) == [23, 46]
    @test AdventOfCode2021.Day16.day16(ssample4) == [31, 54]
    @test AdventOfCode2021.Day16.day16(vsample1) == [14, 3]
    @test AdventOfCode2021.Day16.day16(vsample2) == [8, 54]
    @test AdventOfCode2021.Day16.day16(vsample3) == [15, 7]
    @test AdventOfCode2021.Day16.day16(vsample4) == [11, 9]
    @test AdventOfCode2021.Day16.day16(vsample5) == [13, 1]
    @test AdventOfCode2021.Day16.day16(vsample6) == [19, 0]
    @test AdventOfCode2021.Day16.day16(vsample7) == [16, 0]
    @test AdventOfCode2021.Day16.day16(vsample8) == [20, 1]
    @test AdventOfCode2021.Day16.day16() == [938, 1495959086337]
end

@testset "Day 17" begin
    sample = "target area: x=20..30, y=-10..-5\n"
    @test AdventOfCode2021.Day17.day17(sample) == [45, 112]
    @test AdventOfCode2021.Day17.day17() == [6555, 4973]
end

@testset "Day 18" begin
    expl1 = [[[[[9,8],1],2],3],4]
    AdventOfCode2021.Day18.explode!(expl1)
    @test expl1 == [[[[0,9],2],3],4]

    expl2 = [7,[6,[5,[4,[3,2]]]]]
    AdventOfCode2021.Day18.explode!(expl2)
    @test expl2 == [7,[6,[5,[7,0]]]]

    expl3 = [[6,[5,[4,[3,2]]]],1]
    AdventOfCode2021.Day18.explode!(expl3)
    @test expl3 == [[6,[5,[7,0]]],3]

    expl4 = [[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]
    AdventOfCode2021.Day18.explode!(expl4)
    @test expl4 == [[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]

    expl5 = [[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]
    AdventOfCode2021.Day18.explode!(expl5)
    @test expl5 == [[3,[2,[8,0]]],[9,[5,[7,0]]]]

    explsplit = [[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]
    AdventOfCode2021.Day18.explode!(explsplit)
    @test explsplit == [[[[0,7],4],[7,[[8,4],9]]],[1,1]]
    AdventOfCode2021.Day18.explode!(explsplit)
    @test explsplit == [[[[0,7],4],[15,[0,13]]],[1,1]]
    AdventOfCode2021.Day18.split!(explsplit)
    @test explsplit == [[[[0,7],4],[[7,8],[0,13]]],[1,1]]
    AdventOfCode2021.Day18.split!(explsplit)
    @test explsplit == [[[[0,7],4],[[7,8],[0,[6,7]]]],[1,1]]
    AdventOfCode2021.Day18.explode!(explsplit)
    @test explsplit == [[[[0,7],4],[[7,8],[6,0]]],[8,1]]

    explsplit = [[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]
    AdventOfCode2021.Day18.reduce!(explsplit)
    @test explsplit == [[[[0,7],4],[[7,8],[6,0]]],[8,1]]

    sample1 = "[1,1]\n" *
              "[2,2]\n" *
              "[3,3]\n" *
              "[4,4]\n"
    @test AdventOfCode2021.Day18.build_sum(sample1) == [[[[1,1],[2,2]],[3,3]],[4,4]]

    sample2 = "[1,1]\n" *
              "[2,2]\n" *
              "[3,3]\n" *
              "[4,4]\n" *
              "[5,5]\n"
    @test AdventOfCode2021.Day18.build_sum(sample2) == [[[[3,0],[5,3]],[4,4]],[5,5]]

    sample3 = "[1,1]\n" *
              "[2,2]\n" *
              "[3,3]\n" *
              "[4,4]\n" *
              "[5,5]\n" *
              "[6,6]\n"
    @test AdventOfCode2021.Day18.build_sum(sample3) == [[[[5,0],[7,4]],[5,5]],[6,6]]

    sample4 = "[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]\n" *
              "[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]\n" *
              "[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]\n" *
              "[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]\n" *
              "[7,[5,[[3,8],[1,4]]]]\n" *
              "[[2,[2,2]],[8,[8,1]]]\n" *
              "[2,9]\n" *
              "[1,[[[9,3],9],[[9,0],[0,7]]]]\n" *
              "[[[5,[7,4]],7],1]\n" *
              "[[[[4,2],2],6],[8,7]]\n"
    @test AdventOfCode2021.Day18.build_sum(sample4) == [[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]

    @test AdventOfCode2021.Day18.magnitude([[1,2],[[3,4],5]]) == 143
    @test AdventOfCode2021.Day18.magnitude([[[[0,7],4],[[7,8],[6,0]]],[8,1]]) == 1384
    @test AdventOfCode2021.Day18.magnitude([[[[1,1],[2,2]],[3,3]],[4,4]]) == 445
    @test AdventOfCode2021.Day18.magnitude([[[[3,0],[5,3]],[4,4]],[5,5]]) == 791
    @test AdventOfCode2021.Day18.magnitude([[[[5,0],[7,4]],[5,5]],[6,6]]) == 1137
    @test AdventOfCode2021.Day18.magnitude([[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]) == 3488

    sample5 = "[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]\n" *
              "[[[5,[2,8]],4],[5,[[9,9],0]]]\n" *
              "[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]\n" *
              "[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]\n" *
              "[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]\n" *
              "[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]\n" *
              "[[[[5,4],[7,7]],8],[[8,3],8]]\n" *
              "[[9,3],[[9,9],[6,[4,9]]]]\n" *
              "[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]\n" *
              "[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]\n"
    sample5sum = AdventOfCode2021.Day18.build_sum(sample5)
    @test sample5sum == [[[[6,6],[7,6]],[[7,7],[7,0]]],[[[7,7],[7,7]],[[7,8],[9,9]]]]
    @test AdventOfCode2021.Day18.magnitude(sample5sum) == 4140

    sample6 = "[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]\n" *
              "[[[5,[2,8]],4],[5,[[9,9],0]]]\n" *
              "[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]\n" *
              "[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]\n" *
              "[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]\n" *
              "[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]\n" *
              "[[[[5,4],[7,7]],8],[[8,3],8]]\n" *
              "[[9,3],[[9,9],[6,[4,9]]]]\n" *
              "[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]\n" *
              "[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]\n"
    @test AdventOfCode2021.Day18.part2(sample6) == 3993
end