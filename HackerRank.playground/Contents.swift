import UIKit
import Foundation

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
InterviewBitArrays.spiralOrder([[ 1, 2, 3 ],
                                [ 4, 5, 6 ],
                                [ 7, 8, 9 ]])

var coverPointsA = [ 4, 8, -7, -5, -13, 9, -7, 8 ]
var coverPointsB = [ 4, -15, -10, -3, -13, 12, 8, -8 ]
InterviewBitArrays.coverPoints(&coverPointsA, &coverPointsB)

InterviewBitArrays.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])

var APlusOne = [ 9, 9, 9, 9, 9 ]
InterviewBitArrays.plusOne(&APlusOne)

var waveArr = [ 6, 17, 15, 13 ]
InterviewBitArrays.wave(&waveArr)

InterviewBitArrays.solve(5)

var rotateMatrix = [[1, 2],
                    [3, 4]]
InterviewBitArrays.rotate(&rotateMatrix)

var mergeIntervals: [ClosedRange<Int>] = [(1...3),(2...4),(5...7),(6...8)]
//var mergeIntervals: [ClosedRange<Int>] = [(3...6),(7...9),(0...4)]
InterviewBitArrays.mergeIntervals(interval: &mergeIntervals)

var fmp = [ 417, 929, 845, 462, 675, 175, 73, 867, 14, 201, 777, 407, 80, 882, 785, 563, 209, 261, 776, 362, 730, 74, 649, 465, 353, 801, 503, 154, 998, 286, 520, 692, 68, 805, 835, 210, 819, 341, 564, 215, 984, 643, 381, 793, 726, 213, 866, 706, 97, 538, 308, 797, 883, 59, 328, 743, 694, 607, 729, 821, 32, 672, 130, 13, 76, 724, 384, 444, 884, 192, 917, 75, 551, 96, 418, 840, 235, 433, 290, 954, 549, 950, 21, 711, 781, 132, 296, 44, 439, 164, 401, 505, 923, 136, 317, 548, 787, 224, 23, 185, 6, 350, 822, 457, 489, 133, 31, 830, 386, 671, 999, 255, 222, 944, 952, 637, 523, 494, 916, 95, 734, 908, 90, 541, 470, 941, 876, 264, 880, 761, 535, 738, 128, 772, 39, 553, 656, 603, 868, 292, 117, 966, 259, 619, 836, 818, 493, 592, 380, 500, 599, 839, 268, 67, 591, 126, 773, 635, 800, 842, 536, 668, 896, 260, 664, 506, 280, 435, 618, 398, 533, 647, 373, 713, 745, 478, 129, 844, 640, 886, 972, 62, 636, 79, 600, 263, 52, 719, 665, 376, 351, 623, 276, 66, 316, 813, 663, 831, 160, 237, 567, 928, 543, 508, 638, 487, 234, 997, 307, 480, 620, 890, 216, 147, 271, 989, 872, 994, 488, 291, 331, 8, 769, 481, 924, 166, 89, 824, -4, 590, 416, 17, 814, 728, 18, 673, 662, 410, 727, 667, 631, 660, 625, 683, 33, 436, 930, 91, 141, 948, 138, 113, 253, 56, 432, 744, 302, 211, 262, 968, 945, 396, 240, 594, 684, 958, 343, 879, 155, 395, 288, 550, 482, 557, 826, 598, 795, 914, 892, 690, 964, 981, 150, 179, 515, 205, 265, 823, 799, 190, 236, 24, 498, 229, 420, 753, 936, 191, 366, 935, 434, 311, 920, 167, 817, 220, 219, 741, -2, 674, 330, 909, 162, 443, 412, 974, 294, 864, 971, 760, 225, 681, 689, 608, 931, 427, 687, 466, 894, 303, 390, 242, 339, 252, 20, 218, 499, 232, 184, 490, 4, 957, 597, 477, 354, 677, 691, 25, 580, 897, 542, 186, 359, 346, 409, 655, 979, 853, 411, 344, 358, 559, 765, 383, 484, 181, 82, 514, 582, 593, 77, 228, 921, 348, 453, 274, 449, 106, 657, 783, 782, 811, 333, 305, 784, 581, 746, 858, 249, 479, 652, 270, 429, 614, 903, 102, 378, 575, 119, 196, 12, 990, 356, 277, 169, 70, 518, 282, 676, 137, 622, 616, 357, 913, 161, 3, 589, 327 ]
InterviewBitArrays.firstMissingPositive(&fmp)

var linearFirstMissing = [2, 3, 7, 6, 8, -1, -10, 15]
InterviewBitArrays.linearfirstMissingPositive(&linearFirstMissing)

// MARK: - Check whether two strings are anagram of each other
func areAnagrams(str1: String, str2: String) -> Bool { //O(n log n)
    //If length of both strings is not same, then they cannot be anagram
    if str1.count != str2.count {
        return false
    }
    if str1.sorted() == str2.sorted() {
        return true
    }
    return false
}
areAnagrams(str1: "acab", str2: "caad")

// MARK: - InterviewBit Math
InterviewBitMath.allFactors(36)
InterviewBitMath.isPrime(7)
InterviewBitMath.sieve(10)
InterviewBitMath.sieveOfEratosthenes(10)
InterviewBitMath.findDigitsInBinary(1)
InterviewBitMath.findDigitsInDecimal(5670)
InterviewBitMath.fizzBuzz(5)
InterviewBitMath.titleToNumber(column: "AF")
InterviewBitMath.isPalindrome(number: 121)
InterviewBitMath.isPalindromeLinear(121)
InterviewBitMath.greatDivisor(1,0)
InterviewBitMath.solve([0,1,5], 1,5)
var arrangeArr = [3,2,0,1]
InterviewBitMath.arrange(&arrangeArr)
InterviewBitMath.exponencialUniquePaths(3, 5)
InterviewBitMath.dynamicProgrammingGridUniquePaths(3, 2)
InterviewBitMath.combinationGridUNiquePaths(12, 5)

// MARK: - InterviewBit BinarySearch - O(log n)
func binarySearch(array: [Int], find: Int) -> Int { //array previously sorted
    var start = 0, end = array.count-1
    while start <= end {
        let mid = Int((start+end)/2)
        if array[mid] == find { //match
            return mid
        } else if array[mid] < find { //go to right side
            start = mid+1
        } else { //go to left side
            end = mid-1
        }
    }
    return -1 //array doesn't have element
}

func binarySearch(array: [Int], find: Int, searchFirst: Bool) -> Int {
    var start = 0, end = array.count-1, result = -1
    while start <= end {
        let mid = Int((start+end)/2)
        if array[mid] == find {
            result = mid
            if searchFirst {
                end = mid-1
            } else {
                start = mid+1
            }
        } else if array[mid] > find {
            end = mid-1
        } else {
            start = mid+1
        }
    }
    return result
}
binarySearch(array: [1,2,3,4,5,5,5,6,7,8], find: 5, searchFirst: true)

// MARK: - EXAMPLE: Count Element Occurence
func findCount(_ A: [Int], _ B: Int) -> Int {
    let start = binarySearch(array: A, find: B, searchFirst: true)
    if start == -1 { return 0 }
    let end = binarySearch(array: A, find: B, searchFirst: false)
    return end-start+1
}
findCount([5, 7, 8, 9, 10], 8)

// MARK: - EXAMPLE: Rotated Array
func findMin(_ A: [Int]) -> Int { //modification of binary search: find pivot (next and previous are greater)
    //This algorithm work if there are no duplicates in the array
    var low = 0, high = A.count-1
    while low <= high {
        //Case 1
        if A[low] <= A[high] { return low }
        let mid = Int((high+low)/2)
        let prev = (mid+A.count-1) % A.count
        //+A.count-1 since the array is rotated and % A.count goes to the first element if it's on the end
        //Case 2
        if A[prev] > A[mid] {
            return mid
        } else if A[mid] >= A[low] {
            low = mid+1
        } else {
            high = mid-1
        }
    }
    return -1
}
findMin([15,22,23,28,31,38,5,6,8,10,12])

func sqrt(_ A: Int) -> Int {
    //0 <= result <= A
    //If r*r <= x, S >= r
    //If r*r > x, S < r
    if A == 0 {
        return A
    }
    var start = 1, end = A, result = -1
    while start <= end {
        let mid = Int((start+end)/2)
        if mid <= A/mid {
            start = mid+1
            result = mid
        } else {
            end = mid-1
        }
    }
    return result
}
sqrt(11)

// MARK: - Search for a Range
func searchRange(_ A: [Int], _ B: Int) -> [Int] {
    //binarysearch - findfirst and last
    return [binarySearch(array: A, find: B, searchFirst: true), binarySearch(array: A, find: B, searchFirst: false)]
}
searchRange([5, 7, 7, 8, 8, 10], 7)
