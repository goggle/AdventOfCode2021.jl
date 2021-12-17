module Day16

using AdventOfCode2021

struct Packet
    version::Int
    id::Int
    value::Int
    subpackets::Vector{Packet}
end

function day16(input::String = readInput(joinpath(@__DIR__, "..", "data", "day16.txt")))
    inpbits = vcat([BitVector(reverse(x)) for x in digits.(parse.(Int, split(rstrip(input), ""), base=16), base=2, pad=4)]...)
    packets = Vector{Packet}()
    parse_packet!(packets, inpbits, 1)
    return [part1(packets[1]), part2(packets[1])]
end

function parse_packet!(packets::Vector{Packet}, inpbits::BitVector, i::Int)
    (i > length(inpbits) || !any(inpbits[i:end])) && return i
    version = _to_int(inpbits[i:i+2])
    id = _to_int(inpbits[i+3:i+5])
    i += 6
    if id == 4
        numberbits = BitVector()
        while true
            push!(numberbits, inpbits[i+1:i+4]...)
            if inpbits[i] == 0
                i += 5
                break
            end
            i += 5
        end
        push!(packets, Packet(version, id, _to_int(numberbits), Vector{Packet}()))
    else
        lengthtypeid = inpbits[i]
        i += 1
        if lengthtypeid == 0
            tlib = _to_int(inpbits[i:i+14])
            i += 15
            p = Packet(version, id, lengthtypeid, Vector{Packet}())
            start = i
            while i - start < tlib
                i = parse_packet!(p.subpackets, inpbits, i)
            end
            push!(packets, p)

        else
            nos = _to_int(inpbits[i:i+10])
            i += 11
            p = Packet(version, id, lengthtypeid, Vector{Packet}())
            for _ = 1:nos
                i = parse_packet!(p.subpackets, inpbits, i)
            end
            push!(packets, p)
        end
    end
    return i
end

function _to_int(arr)
    return sum(arr .* (2 .^ collect(length(arr)-1:-1:0)))
end

function part1(packet::Packet)
    length(packet.subpackets) == 0 && return packet.version
    return packet.version + sum(part1(p) for p in packet.subpackets)
end

function part2(packet::Packet)
    packet.id == 4 && return packet.value
    packet.id == 0 && return sum(part2(p) for p in packet.subpackets)
    packet.id == 1 && return prod(part2(p) for p in packet.subpackets)
    packet.id == 2 && return minimum(part2(p) for p in packet.subpackets)
    packet.id == 3 && return maximum(part2(p) for p in packet.subpackets)
    packet.id == 5 && return part2(packet.subpackets[1]) > part2(packet.subpackets[2]) ? 1 : 0
    packet.id == 6 && return part2(packet.subpackets[1]) < part2(packet.subpackets[2]) ? 1 : 0
    packet.id == 7 && return part2(packet.subpackets[1]) == part2(packet.subpackets[2]) ? 1 : 0
end

end # module
