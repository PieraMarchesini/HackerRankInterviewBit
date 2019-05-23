import UIKit

// MARK: - HackerRank - WarmUp
HackerRankWarmUp.sockMerchant(n: 9, arr: [10,20,20,10,10,30,50,10,20])
HackerRankWarmUp.countingValleys(n: 8, s: "UDDDUDUU")
HackerRankWarmUp.jumpingOnClouds(c: [0, 0, 0, 1, 0, 0])
HackerRankWarmUp.repeatedString(s: "epsxyyflvrrrxzvnoenvpegvuonodjoxfwdmcvwctmekpsnamchznsoxaklzjgrqruyzavshfbmuhdwwmpbkwcuomqhiyvuztwvq", n: 549382313570)
HackerRankWarmUp.repeatedString(s: "ojowrdcpavatfacuunxycyrmpbkvaxyrsgquwehhurnicgicmrpmgegftjszgvsgqavcrvdtsxlkxjpqtlnkjuyraknwxmnthfpt", n: 685118368975)

// MARK: - HackerRank - Arrays
HackerRankArrays.hourglassSum(arr: [[1, 1, 1, 0, 0, 0],
                   [0, 1, 0, 0, 0, 0],
                   [1, 1, 1, 0, 0, 0],
                   [0, 0, 2, 4, 4, 0],
                   [0, 0, 0, 2, 0, 0],
                   [0, 0, 1, 2, 4, 0]])
HackerRankArrays.rotLeft(a: [1, 2, 3, 4, 5], d: 4)
HackerRankArrays.minimumBribes(q: [2, 1, 5, 3, 4])
HackerRankArrays.minimumSwaps(arr: [1, 5, 4, 3, 2])
HackerRankArrays.arrayManipulation(n: 4, queries: [[2, 3, 603],
                                                   [1, 1, 286],
                                                   [4, 4, 882]])

// MARK: InverviewBit - Arrays
// MARK: Spiral Order
func spiralOrder(_ A: [[Int]]) -> [Int] {
    var arr: [Int] = []
    var top = 0, bottom = A.count-1, left = 0, right = A[0].count-1, dir = 0
    while top <= bottom && left <= right {
        if dir == 0 {
            for i in left...right {
                arr.append(A[top][i])
            }
            top += 1
            dir = 1
        } else if dir == 1 {
            for i in top...bottom {
                arr.append(A[i][right])
            }
            right -= 1
            dir = 2
        } else if dir == 2 {
            for i in (left...right).reversed() {
                arr.append(A[bottom][i])
            }
            bottom -= 1
            dir = 3
        } else if dir == 3 {
            for i in (top...bottom).reversed() {
                arr.append(A[i][left])
            }
            left += 1
            dir = 0
        }
    }
    return arr
}

spiralOrder([
    [ 1, 2, 3 ],
    [ 4, 5, 6 ],
    [ 7, 8, 9 ]
    ])


// MARK: - Min Steps in Infinite Grid
func coverPoints(_ A: inout [Int], _ B: inout [Int]) -> Int {
    var steps = 0
    for i in 0..<A.count-1 {
        steps += abs(A[i+1] - A[i]) <= abs(B[i+1] - B[i]) ? abs(B[i+1] - B[i]) : abs(A[i+1] - A[i])
    }
    return steps
}
var aArr = [ 4, 8, -7, -5, -13, 9, -7, 8 ]
var bArr = [ 4, -15, -10, -3, -13, 12, 8, -8 ]
coverPoints(&aArr, &bArr)

//Max Sum Contiguous Subarray
func maxSubArray(_ A: [Int]) -> Int {
    var maxSoFar = 0, maxEndingHere = 0
    let max = A.max() ?? 0
    if max < 0 {
        return max
    }
    for i in 0..<A.count {
        maxEndingHere += A[i]
        if maxEndingHere < 0 {
            maxEndingHere = 0
        }
        if maxSoFar < maxEndingHere {
            maxSoFar = maxEndingHere
        }
    }
    return maxSoFar
}

maxSubArray([-2,1,-3,4,-1,2,1,-5,4])

// MARK: - Add One To Number
func plusOne(_ A: inout [Int]) -> [Int] {
    while A.first == 0 && A.count > 1 {
        A.removeFirst()
    }
    var i = A.count - 1
    if A[i] < 9 {
        A[i] += 1
        return A
    }
    while i >= 0 && A[i] == 9 {
        A[i] = 0
        i -= 1
    }
    if i == -1 {
        A.insert(1, at: 0)
    } else {
        A[i] += 1
    }
    return A
}

var APlusOne = [ 9, 9, 9, 9, 9 ]
plusOne(&APlusOne)

// MARK: - Wave Array
func wave(_ A: inout [Int]) -> [Int] {
    A = A.sorted(by: { $0 < $1 })
    for i in stride(from: 0, to: A.count-1, by: 2) {
        let temp = A[i]
        A[i] = A[i+1]
        A[i+1] = temp
    }
    return A
}

var waveArr = [ 6, 17, 15, 13 ]
wave(&waveArr)

// MARK: - Pascal Triangle
func solve(_ A: Int) -> [[Int]] {
    var matrix = [[Int]]()
    for i in 0..<A {
        var row = [Int]()
        for j in 0...i {
            if j == 0 || j == i {
                row.append(1)
            } else {
                row.append(matrix[i-1][j] + matrix[i-1][j-1])
            }
        }
        matrix.append(row)
    }
    return matrix
}
solve(5)

// MARK: - Rotate Matrix
func rotate(_ A: inout [[Int]]) -> [[Int]] {
    let n = A.count
    for i in 0..<n/2 { //Consider all squares within the matrix
        for j in i..<n-i-1 {
            let temp = A[i][j]
            A[i][j] = A[n-1-j][i] //move value from left to top
            A[n-1-j][i] = A[n-1-i][n-1-j] //move value from bottom to left
            A[n-1-i][n-1-j] = A[j][n-1-i] //move value from right to bottom
            A[j][n-1-i] = temp //move value from top to right
        }
    }
    return A
}
var rotateMatrix = [
    [1, 2],
    [3, 4]
]
rotate(&rotateMatrix)

// MARK: - Merge Overlapping Intervals
//Time complexity of the method is O(nLogn) which is for sorting. Merging takes linear time.
func mergeIntervals(interval: inout [ClosedRange<Int>]) -> [ClosedRange<Int>] {
    interval.sort(by: {$0.lowerBound < $1.lowerBound })
    var size = interval.count-1
    var i = 0
    while i < size {
        if interval[i].upperBound > interval[i+1].lowerBound {
            let newLower = interval[i].lowerBound
            let newUpper = interval[i+1].upperBound
            interval.remove(at: i+1)
            interval.remove(at: i)
            interval.insert(newLower...newUpper, at: i)
            size -= 2
        }
        i += 1
    }
    interval.sort(by: {$0.lowerBound < $1.lowerBound })
    return interval
}
//var mergeIntervals: [ClosedRange<Int>] = [(47...76),(51...99),(28...78),(54...94),(12...72),(31...72),(12...55),(24...40),(59...79),(41...100),(46...99),(5...27),(13...23),(9...69),(39...75),(51...53),(81...98),(14...14),(27...89),(73...78),(28...35),(19...30),(39...87),(60...94),(71...90),(9...44),(56...79),(58...70),(25...76),(18...46),(14...96),(43...95),(70...77),(13...59),(52...91),(47...56),(63...67),(28...39),(51...92),(30...66),(4...4),(29...92),(58...90),(6...20),(31...93),(52...75),(41...41),(64...89),(64...66),(24...90),(25, 46),(39...49),(15...99),(50...99),(9...34),(58...96),(85...86),(13...68),(45...57),(55...56),(60...74),(89...98),(23...79),(16...59),(56...57),(54...85),(16...29),(72...86),(10...45),(6...25),(19...55),(21...21),(17...83),(49...86),(67...84),(8...48),(63...85),(5...31),(43...48),(57...62),(22...68),(48...92),(36...77),(27...63),(39...83),(38...54),(31...69),(36...65),(52...68)]

var mergeIntervals: [ClosedRange<Int>] = [(1...3),(2...4),(5...7),(6...8)]
//var mergeIntervals: [ClosedRange<Int>] = [(3...6),(7...9),(0...4)]
mergeIntervals(interval: &mergeIntervals)

// MARK: - First Missing Integer
// O(n log n)
func firstMissingPositive(_ A: inout [Int]) -> Int {
    var miss = 0
    A.sort(by: {Int($0) < Int($1)})
    if A.max()! < 1 || A.filter({$0 == 1}).count < 1 {
        return 1
    }
    for i in 0..<A.count-1 {
        if A[i] < 1 { continue }
        if A[i+1] > A[i]+1 {
            miss = A[i]+1
            break
        }
    }
    if miss == 0 { return A.max()!+1 }
    return miss
}
var fmp = [ 417, 929, 845, 462, 675, 175, 73, 867, 14, 201, 777, 407, 80, 882, 785, 563, 209, 261, 776, 362, 730, 74, 649, 465, 353, 801, 503, 154, 998, 286, 520, 692, 68, 805, 835, 210, 819, 341, 564, 215, 984, 643, 381, 793, 726, 213, 866, 706, 97, 538, 308, 797, 883, 59, 328, 743, 694, 607, 729, 821, 32, 672, 130, 13, 76, 724, 384, 444, 884, 192, 917, 75, 551, 96, 418, 840, 235, 433, 290, 954, 549, 950, 21, 711, 781, 132, 296, 44, 439, 164, 401, 505, 923, 136, 317, 548, 787, 224, 23, 185, 6, 350, 822, 457, 489, 133, 31, 830, 386, 671, 999, 255, 222, 944, 952, 637, 523, 494, 916, 95, 734, 908, 90, 541, 470, 941, 876, 264, 880, 761, 535, 738, 128, 772, 39, 553, 656, 603, 868, 292, 117, 966, 259, 619, 836, 818, 493, 592, 380, 500, 599, 839, 268, 67, 591, 126, 773, 635, 800, 842, 536, 668, 896, 260, 664, 506, 280, 435, 618, 398, 533, 647, 373, 713, 745, 478, 129, 844, 640, 886, 972, 62, 636, 79, 600, 263, 52, 719, 665, 376, 351, 623, 276, 66, 316, 813, 663, 831, 160, 237, 567, 928, 543, 508, 638, 487, 234, 997, 307, 480, 620, 890, 216, 147, 271, 989, 872, 994, 488, 291, 331, 8, 769, 481, 924, 166, 89, 824, -4, 590, 416, 17, 814, 728, 18, 673, 662, 410, 727, 667, 631, 660, 625, 683, 33, 436, 930, 91, 141, 948, 138, 113, 253, 56, 432, 744, 302, 211, 262, 968, 945, 396, 240, 594, 684, 958, 343, 879, 155, 395, 288, 550, 482, 557, 826, 598, 795, 914, 892, 690, 964, 981, 150, 179, 515, 205, 265, 823, 799, 190, 236, 24, 498, 229, 420, 753, 936, 191, 366, 935, 434, 311, 920, 167, 817, 220, 219, 741, -2, 674, 330, 909, 162, 443, 412, 974, 294, 864, 971, 760, 225, 681, 689, 608, 931, 427, 687, 466, 894, 303, 390, 242, 339, 252, 20, 218, 499, 232, 184, 490, 4, 957, 597, 477, 354, 677, 691, 25, 580, 897, 542, 186, 359, 346, 409, 655, 979, 853, 411, 344, 358, 559, 765, 383, 484, 181, 82, 514, 582, 593, 77, 228, 921, 348, 453, 274, 449, 106, 657, 783, 782, 811, 333, 305, 784, 581, 746, 858, 249, 479, 652, 270, 429, 614, 903, 102, 378, 575, 119, 196, 12, 990, 356, 277, 169, 70, 518, 282, 676, 137, 622, 616, 357, 913, 161, 3, 589, 327 ]
firstMissingPositive(&fmp)

//O(n)
func linearfirstMissingPositive(_ A: inout [Int]) -> Int {
    return 0
}
