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
    sample =
        "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1\n" *
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
    sample =
        "be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb |  fdgacbe cefdb cefbgd gcbe\n" *
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
    sample =
        "[({(<(())[]>[[{[]{<()<>>\n" *
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
    expected_p2 =
        "████  ██  █  █  ██  █  █ ███  ████  ██ \n" *
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
    expl1 = AdventOfCode2021.Day18.parse_number("[[[[[9,8],1],2],3],4]")
    AdventOfCode2021.Day18.explode!(expl1)
    @test repr(expl1) == "[[[[0,9],2],3],4]"

    expl2 = AdventOfCode2021.Day18.parse_number("[7,[6,[5,[4,[3,2]]]]]")
    AdventOfCode2021.Day18.explode!(expl2)
    @test repr(expl2) == "[7,[6,[5,[7,0]]]]"

    expl3 = AdventOfCode2021.Day18.parse_number("[[6,[5,[4,[3,2]]]],1]")
    AdventOfCode2021.Day18.explode!(expl3)
    @test repr(expl3) == "[[6,[5,[7,0]]],3]"

    expl4 = AdventOfCode2021.Day18.parse_number("[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]")
    AdventOfCode2021.Day18.explode!(expl4)
    @test repr(expl4) == "[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]"

    expl5 = AdventOfCode2021.Day18.parse_number("[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]")
    AdventOfCode2021.Day18.explode!(expl5)
    @test repr(expl5) == "[[3,[2,[8,0]]],[9,[5,[7,0]]]]"

    explsplit = AdventOfCode2021.Day18.parse_number("[[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]")
    AdventOfCode2021.Day18.explode!(explsplit)
    @test repr(explsplit) == "[[[[0,7],4],[7,[[8,4],9]]],[1,1]]"
    AdventOfCode2021.Day18.explode!(explsplit)
    @test repr(explsplit) == "[[[[0,7],4],[15,[0,13]]],[1,1]]"
    AdventOfCode2021.Day18.split!(explsplit)
    @test repr(explsplit) == "[[[[0,7],4],[[7,8],[0,13]]],[1,1]]"
    AdventOfCode2021.Day18.split!(explsplit)
    @test repr(explsplit) == "[[[[0,7],4],[[7,8],[0,[6,7]]]],[1,1]]"
    AdventOfCode2021.Day18.explode!(explsplit)
    @test repr(explsplit) == "[[[[0,7],4],[[7,8],[6,0]]],[8,1]]"

    explsplit = AdventOfCode2021.Day18.parse_number("[[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]")
    AdventOfCode2021.Day18.reduce!(explsplit)
    @test repr(explsplit) == "[[[[0,7],4],[[7,8],[6,0]]],[8,1]]"

    parse_input = AdventOfCode2021.Day18.parse_input

    sample1 = "[1,1]\n" *
              "[2,2]\n" *
              "[3,3]\n" *
              "[4,4]\n"
    @test AdventOfCode2021.Day18.build_sum(sample1 |> parse_input) |> repr == "[[[[1,1],[2,2]],[3,3]],[4,4]]"

    sample2 = "[1,1]\n" *
              "[2,2]\n" *
              "[3,3]\n" *
              "[4,4]\n" *
              "[5,5]\n"
    @test AdventOfCode2021.Day18.build_sum(sample2 |> parse_input) |> repr == "[[[[3,0],[5,3]],[4,4]],[5,5]]"

    sample3 = "[1,1]\n" *
              "[2,2]\n" *
              "[3,3]\n" *
              "[4,4]\n" *
              "[5,5]\n" *
              "[6,6]\n"
    @test AdventOfCode2021.Day18.build_sum(sample3 |> parse_input) |> repr == "[[[[5,0],[7,4]],[5,5]],[6,6]]"

    sample4 =
        "[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]\n" *
        "[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]\n" *
        "[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]\n" *
        "[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]\n" *
        "[7,[5,[[3,8],[1,4]]]]\n" *
        "[[2,[2,2]],[8,[8,1]]]\n" *
        "[2,9]\n" *
        "[1,[[[9,3],9],[[9,0],[0,7]]]]\n" *
        "[[[5,[7,4]],7],1]\n" *
        "[[[[4,2],2],6],[8,7]]\n"
    @test AdventOfCode2021.Day18.build_sum(sample4 |> parse_input) |> repr == "[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]"

    @test AdventOfCode2021.Day18.magnitude(AdventOfCode2021.Day18.parse_number("[[1,2],[[3,4],5]]")) == 143
    @test AdventOfCode2021.Day18.magnitude(AdventOfCode2021.Day18.parse_number("[[[[0,7],4],[[7,8],[6,0]]],[8,1]]")) == 1384
    @test AdventOfCode2021.Day18.magnitude(AdventOfCode2021.Day18.parse_number("[[[[1,1],[2,2]],[3,3]],[4,4]]")) == 445
    @test AdventOfCode2021.Day18.magnitude(AdventOfCode2021.Day18.parse_number("[[[[3,0],[5,3]],[4,4]],[5,5]]")) == 791
    @test AdventOfCode2021.Day18.magnitude(AdventOfCode2021.Day18.parse_number("[[[[5,0],[7,4]],[5,5]],[6,6]]")) == 1137
    @test AdventOfCode2021.Day18.magnitude(AdventOfCode2021.Day18.parse_number("[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]")) == 3488

    sample5 =
        "[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]\n" *
        "[[[5,[2,8]],4],[5,[[9,9],0]]]\n" *
        "[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]\n" *
        "[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]\n" *
        "[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]\n" *
        "[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]\n" *
        "[[[[5,4],[7,7]],8],[[8,3],8]]\n" *
        "[[9,3],[[9,9],[6,[4,9]]]]\n" *
        "[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]\n" *
        "[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]\n"
    sample5sum = AdventOfCode2021.Day18.build_sum(sample5 |> parse_input)
    @test sample5sum |> repr == "[[[[6,6],[7,6]],[[7,7],[7,0]]],[[[7,7],[7,7]],[[7,8],[9,9]]]]"
    @test AdventOfCode2021.Day18.magnitude(sample5sum) == 4140

    sample6 =
        "[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]\n" *
        "[[[5,[2,8]],4],[5,[[9,9],0]]]\n" *
        "[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]\n" *
        "[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]\n" *
        "[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]\n" *
        "[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]\n" *
        "[[[[5,4],[7,7]],8],[[8,3],8]]\n" *
        "[[9,3],[[9,9],[6,[4,9]]]]\n" *
        "[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]\n" *
        "[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]\n"
    @test AdventOfCode2021.Day18.day18(sample6) == [4140, 3993]

    @test AdventOfCode2021.Day18.day18() == [4008, 4667]
end

@testset "Day 19" begin
    sample =
        "--- scanner 0 ---\n" *
        "404,-588,-901\n" *
        "528,-643,409\n" *
        "-838,591,734\n" *
        "390,-675,-793\n" *
        "-537,-823,-458\n" *
        "-485,-357,347\n" *
        "-345,-311,381\n" *
        "-661,-816,-575\n" *
        "-876,649,763\n" *
        "-618,-824,-621\n" *
        "553,345,-567\n" *
        "474,580,667\n" *
        "-447,-329,318\n" *
        "-584,868,-557\n" *
        "544,-627,-890\n" *
        "564,392,-477\n" *
        "455,729,728\n" *
        "-892,524,684\n" *
        "-689,845,-530\n" *
        "423,-701,434\n" *
        "7,-33,-71\n" *
        "630,319,-379\n" *
        "443,580,662\n" *
        "-789,900,-551\n" *
        "459,-707,401\n" *
        "\n" *
        "--- scanner 1 ---\n" *
        "686,422,578\n" *
        "605,423,415\n" *
        "515,917,-361\n" *
        "-336,658,858\n" *
        "95,138,22\n" *
        "-476,619,847\n" *
        "-340,-569,-846\n" *
        "567,-361,727\n" *
        "-460,603,-452\n" *
        "669,-402,600\n" *
        "729,430,532\n" *
        "-500,-761,534\n" *
        "-322,571,750\n" *
        "-466,-666,-811\n" *
        "-429,-592,574\n" *
        "-355,545,-477\n" *
        "703,-491,-529\n" *
        "-328,-685,520\n" *
        "413,935,-424\n" *
        "-391,539,-444\n" *
        "586,-435,557\n" *
        "-364,-763,-893\n" *
        "807,-499,-711\n" *
        "755,-354,-619\n" *
        "553,889,-390\n" *
        "\n" *
        "--- scanner 2 ---\n" *
        "649,640,665\n" *
        "682,-795,504\n" *
        "-784,533,-524\n" *
        "-644,584,-595\n" *
        "-588,-843,648\n" *
        "-30,6,44\n" *
        "-674,560,763\n" *
        "500,723,-460\n" *
        "609,671,-379\n" *
        "-555,-800,653\n" *
        "-675,-892,-343\n" *
        "697,-426,-610\n" *
        "578,704,681\n" *
        "493,664,-388\n" *
        "-671,-858,530\n" *
        "-667,343,800\n" *
        "571,-461,-707\n" *
        "-138,-166,112\n" *
        "-889,563,-600\n" *
        "646,-828,498\n" *
        "640,759,510\n" *
        "-630,509,768\n" *
        "-681,-892,-333\n" *
        "673,-379,-804\n" *
        "-742,-814,-386\n" *
        "577,-820,562\n" *
        "\n" *
        "--- scanner 3 ---\n" *
        "-589,542,597\n" *
        "605,-692,669\n" *
        "-500,565,-823\n" *
        "-660,373,557\n" *
        "-458,-679,-417\n" *
        "-488,449,543\n" *
        "-626,468,-788\n" *
        "338,-750,-386\n" *
        "528,-832,-391\n" *
        "562,-778,733\n" *
        "-938,-730,414\n" *
        "543,643,-506\n" *
        "-524,371,-870\n" *
        "407,773,750\n" *
        "-104,29,83\n" *
        "378,-903,-323\n" *
        "-778,-728,485\n" *
        "426,699,580\n" *
        "-438,-605,-362\n" *
        "-469,-447,-387\n" *
        "509,732,623\n" *
        "647,635,-688\n" *
        "-868,-804,481\n" *
        "614,-800,639\n" *
        "595,780,-596\n" *
        "\n" *
        "--- scanner 4 ---\n" *
        "727,592,562\n" *
        "-293,-554,779\n" *
        "441,611,-461\n" *
        "-714,465,-776\n" *
        "-743,427,-804\n" *
        "-660,-479,-426\n" *
        "832,-632,460\n" *
        "927,-485,-438\n" *
        "408,393,-506\n" *
        "466,436,-512\n" *
        "110,16,151\n" *
        "-258,-428,682\n" *
        "-393,719,612\n" *
        "-211,-452,876\n" *
        "808,-476,-593\n" *
        "-575,615,604\n" *
        "-485,667,467\n" *
        "-680,325,-822\n" *
        "-627,-443,-432\n" *
        "872,-547,-609\n" *
        "833,512,582\n" *
        "807,604,487\n" *
        "839,-516,451\n" *
        "891,-625,532\n" *
        "-652,-548,-490\n" *
        "30,-46,-14\n"
    @test AdventOfCode2021.Day19.day19(sample) == [79, 3621]
    @test AdventOfCode2021.Day19.day19() == [398, 10965]
end

@testset "Day 20" begin
    sample =
        "..#.#..#####.#.#.#.###.##.....###.##.#..###.####..#####..#....#..#..##..##" *
        "#..######.###...####..#..#####..##..#.#####...##.#.#..#.##..#.#......#.###" *
        ".######.###.####...#.##.##..#..#..#####.....#.#....###..#.##......#.....#." *
        ".#..#..##..#...##.######.####.####.#.#...#.......#..#.#.#...####.##.#....." *
        ".#..#...##.#.##..#...##.#.##..###.#......#.#.......#.#.#.####.###.##...#.." *
        "...####.#..#..#.##.#....##..#.####....##...##..#...#......#.#.......#....." *
        "..##..####..#...#.#.#...##..#.#..###..#####........#..####......#..#\n" *
        "\n" *
        "#..#.\n" *
        "#....\n" *
        "##..#\n" *
        "..#..\n" *
        "..###\n"
    @test AdventOfCode2021.Day20.day20(sample) == [35, 3351]
    @test AdventOfCode2021.Day20.day20() == [5432, 16016]
end

@testset "Day 21" begin
    sample = "Player 1 starting position: 4\n" *
             "Player 2 starting position: 8\n"
    @test AdventOfCode2021.Day21.day21(sample) == [739785, 444356092776315]
    @test AdventOfCode2021.Day21.day21() == [506466, 632979211251440]
end

@testset "Day 22" begin
    sample1 = "on x=10..12,y=10..12,z=10..12\n" *
              "on x=11..13,y=11..13,z=11..13\n" *
              "off x=9..11,y=9..11,z=9..11\n" *
              "on x=10..10,y=10..10,z=10..10\n"
    sample2 =
        "on x=-20..26,y=-36..17,z=-47..7\n" *
        "on x=-20..33,y=-21..23,z=-26..28\n" *
        "on x=-22..28,y=-29..23,z=-38..16\n" *
        "on x=-46..7,y=-6..46,z=-50..-1\n" *
        "on x=-49..1,y=-3..46,z=-24..28\n" *
        "on x=2..47,y=-22..22,z=-23..27\n" *
        "on x=-27..23,y=-28..26,z=-21..29\n" *
        "on x=-39..5,y=-6..47,z=-3..44\n" *
        "on x=-30..21,y=-8..43,z=-13..34\n" *
        "on x=-22..26,y=-27..20,z=-29..19\n" *
        "off x=-48..-32,y=26..41,z=-47..-37\n" *
        "on x=-12..35,y=6..50,z=-50..-2\n" *
        "off x=-48..-32,y=-32..-16,z=-15..-5\n" *
        "on x=-18..26,y=-33..15,z=-7..46\n" *
        "off x=-40..-22,y=-38..-28,z=23..41\n" *
        "on x=-16..35,y=-41..10,z=-47..6\n" *
        "off x=-32..-23,y=11..30,z=-14..3\n" *
        "on x=-49..-5,y=-3..45,z=-29..18\n" *
        "off x=18..30,y=-20..-8,z=-3..13\n" *
        "on x=-41..9,y=-7..43,z=-33..15\n" *
        "on x=-54112..-39298,y=-85059..-49293,z=-27449..7877\n" *
        "on x=967..23432,y=45373..81175,z=27513..53682\n"
    sample3 =
        "on x=-5..47,y=-31..22,z=-19..33\n" *
        "on x=-44..5,y=-27..21,z=-14..35\n" *
        "on x=-49..-1,y=-11..42,z=-10..38\n" *
        "on x=-20..34,y=-40..6,z=-44..1\n" *
        "off x=26..39,y=40..50,z=-2..11\n" *
        "on x=-41..5,y=-41..6,z=-36..8\n" *
        "off x=-43..-33,y=-45..-28,z=7..25\n" *
        "on x=-33..15,y=-32..19,z=-34..11\n" *
        "off x=35..47,y=-46..-34,z=-11..5\n" *
        "on x=-14..36,y=-6..44,z=-16..29\n" *
        "on x=-57795..-6158,y=29564..72030,z=20435..90618\n" *
        "on x=36731..105352,y=-21140..28532,z=16094..90401\n" *
        "on x=30999..107136,y=-53464..15513,z=8553..71215\n" *
        "on x=13528..83982,y=-99403..-27377,z=-24141..23996\n" *
        "on x=-72682..-12347,y=18159..111354,z=7391..80950\n" *
        "on x=-1060..80757,y=-65301..-20884,z=-103788..-16709\n" *
        "on x=-83015..-9461,y=-72160..-8347,z=-81239..-26856\n" *
        "on x=-52752..22273,y=-49450..9096,z=54442..119054\n" *
        "on x=-29982..40483,y=-108474..-28371,z=-24328..38471\n" *
        "on x=-4958..62750,y=40422..118853,z=-7672..65583\n" *
        "on x=55694..108686,y=-43367..46958,z=-26781..48729\n" *
        "on x=-98497..-18186,y=-63569..3412,z=1232..88485\n" *
        "on x=-726..56291,y=-62629..13224,z=18033..85226\n" *
        "on x=-110886..-34664,y=-81338..-8658,z=8914..63723\n" *
        "on x=-55829..24974,y=-16897..54165,z=-121762..-28058\n" *
        "on x=-65152..-11147,y=22489..91432,z=-58782..1780\n" *
        "on x=-120100..-32970,y=-46592..27473,z=-11695..61039\n" *
        "on x=-18631..37533,y=-124565..-50804,z=-35667..28308\n" *
        "on x=-57817..18248,y=49321..117703,z=5745..55881\n" *
        "on x=14781..98692,y=-1341..70827,z=15753..70151\n" *
        "on x=-34419..55919,y=-19626..40991,z=39015..114138\n" *
        "on x=-60785..11593,y=-56135..2999,z=-95368..-26915\n" *
        "on x=-32178..58085,y=17647..101866,z=-91405..-8878\n" *
        "on x=-53655..12091,y=50097..105568,z=-75335..-4862\n" *
        "on x=-111166..-40997,y=-71714..2688,z=5609..50954\n" *
        "on x=-16602..70118,y=-98693..-44401,z=5197..76897\n" *
        "on x=16383..101554,y=4615..83635,z=-44907..18747\n" *
        "off x=-95822..-15171,y=-19987..48940,z=10804..104439\n" *
        "on x=-89813..-14614,y=16069..88491,z=-3297..45228\n" *
        "on x=41075..99376,y=-20427..49978,z=-52012..13762\n" *
        "on x=-21330..50085,y=-17944..62733,z=-112280..-30197\n" *
        "on x=-16478..35915,y=36008..118594,z=-7885..47086\n" *
        "off x=-98156..-27851,y=-49952..43171,z=-99005..-8456\n" *
        "off x=2032..69770,y=-71013..4824,z=7471..94418\n" *
        "on x=43670..120875,y=-42068..12382,z=-24787..38892\n" *
        "off x=37514..111226,y=-45862..25743,z=-16714..54663\n" *
        "off x=25699..97951,y=-30668..59918,z=-15349..69697\n" *
        "off x=-44271..17935,y=-9516..60759,z=49131..112598\n" *
        "on x=-61695..-5813,y=40978..94975,z=8655..80240\n" *
        "off x=-101086..-9439,y=-7088..67543,z=33935..83858\n" *
        "off x=18020..114017,y=-48931..32606,z=21474..89843\n" *
        "off x=-77139..10506,y=-89994..-18797,z=-80..59318\n" *
        "off x=8476..79288,y=-75520..11602,z=-96624..-24783\n" *
        "on x=-47488..-1262,y=24338..100707,z=16292..72967\n" *
        "off x=-84341..13987,y=2429..92914,z=-90671..-1318\n" *
        "off x=-37810..49457,y=-71013..-7894,z=-105357..-13188\n" *
        "off x=-27365..46395,y=31009..98017,z=15428..76570\n" *
        "off x=-70369..-16548,y=22648..78696,z=-1892..86821\n" *
        "on x=-53470..21291,y=-120233..-33476,z=-44150..38147\n" *
        "off x=-93533..-4276,y=-16170..68771,z=-104985..-24507\n"
    @test AdventOfCode2021.Day22.day22(sample1) == [39, 39]
    @test AdventOfCode2021.Day22.day22(sample2) == [590784, 39769202357779]
    @test AdventOfCode2021.Day22.day22(sample3) == [474140, 2758514936282235]
    @test AdventOfCode2021.Day22.day22() == [587097, 1359673068597669]
end

@testset "Day 23" begin
    sample = "#############\n" *
             "#...........#\n" *
             "###B#C#B#D###\n" *
             "  #A#D#C#A#\n" *
             "  #########\n"
    sample_state = AdventOfCode2021.Day23.parse_input(sample)
    @test AdventOfCode2021.Day23.parse_input(sprint(AdventOfCode2021.Day23.show, sample_state)) == sample_state
    @test AdventOfCode2021.Day23.day23(sample) == [12521, 44169]
    @test AdventOfCode2021.Day23.day23() == [18300, 50190]
end

@testset "Day 24" begin
    @test AdventOfCode2021.Day24.day24() == [59996912981939, 17241911811915]
end

@testset "Day 25" begin
    sample = "v...>>.vv>\n" *
             ".vv>>.vv..\n" *
             ">>.>v>...v\n" *
             ">>v>>.>.v.\n" *
             "v>v.vv.v..\n" *
             ">.>>..v...\n" *
             ".vv..>.>v.\n" *
             "v.v..>>v.v\n" *
             "....v..v.>\n"
    @test AdventOfCode2021.Day25.day25(sample) == 58
    @test AdventOfCode2021.Day25.day25() == 308
end
