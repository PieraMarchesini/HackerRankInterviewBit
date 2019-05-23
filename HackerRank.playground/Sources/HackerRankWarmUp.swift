import Foundation

public class HackerRankWarmUp {
    
    public static func sockMerchant(n: Int, arr: [Int]) -> Int {
        let sorted = arr.sorted()
        var i = 0, cont = 0
        while i < sorted.count-1 {
            if sorted[i] == sorted[i+1] {
                cont += 1
                i += 1
            }
            i += 1
        }
        return cont
    }

    public static func countingValleys(n: Int, s: String) -> Int {
        var valley = 0, level = 0
        for char in s {
            if char == "U" {
                level += 1
                if level == 0 {
                    valley += 1
                }
            } else {
                level -= 1
            }
        }
        return valley
    }

    public static func jumpingOnClouds(c: [Int]) -> Int {
        var jumps = 0, i = 0
        while i < c.count-1 {
            if c[i] == 0 {
                if i+2 < c.count && c[i+2] == 0 {
                    jumps += 1
                    i += 2
                } else if c[i+1] == 0 {
                    jumps += 1
                    i += 1
                }
            }
        }
        return jumps
    }

    public static func repeatedString(s: String, n: Int) -> Int {
        let atimes = s.components(separatedBy: "a").count-1
        var repeated = atimes*(n/s.count)

        let dif = s.count % n - 1
        if dif > 0 && s.count > dif {
            var subs = s
            subs.removeLast(dif)
            repeated += subs.components(separatedBy: "a").count-1
        }
        return repeated
    }
}
