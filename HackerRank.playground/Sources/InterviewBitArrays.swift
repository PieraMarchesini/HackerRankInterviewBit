import Foundation

public class InterviewBitArrays {
    // MARK: Spiral Order
    public static func spiralOrder(_ A: [[Int]]) -> [Int] {
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

    // MARK: - Min Steps in Infinite Grid
    public static func coverPoints(_ A: inout [Int], _ B: inout [Int]) -> Int {
        var steps = 0
        for i in 0..<A.count-1 {
            steps += abs(A[i+1] - A[i]) <= abs(B[i+1] - B[i]) ? abs(B[i+1] - B[i]) : abs(A[i+1] - A[i])
        }
        return steps
    }

    // MARK: - Max Sum Contiguous Subarray
    public static func maxSubArray(_ A: [Int]) -> Int {
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

    // MARK: - Add One To Number
    public static func plusOne(_ A: inout [Int]) -> [Int] {
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

    // MARK: - Wave Array
    public static func wave(_ A: inout [Int]) -> [Int] {
        A = A.sorted(by: { $0 < $1 })
        for i in stride(from: 0, to: A.count-1, by: 2) {
            let temp = A[i]
            A[i] = A[i+1]
            A[i+1] = temp
        }
        return A
    }

    // MARK: - Pascal Triangle
    public static func solve(_ A: Int) -> [[Int]] {
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

    // MARK: - Rotate Matrix
    public static func rotate(_ A: inout [[Int]]) -> [[Int]] {
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

    // MARK: - Merge Overlapping Intervals
    //Time complexity of the method is O(nLogn) which is for sorting. Merging takes linear time.
    public static func mergeIntervals(interval: inout [ClosedRange<Int>]) -> [ClosedRange<Int>] {
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

    // MARK: - First Missing Integer
    // O(n log n)
    public static func firstMissingPositive(_ A: inout [Int]) -> Int {
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

    // MARK: - Linear First Missing Positive
    //O(n)
    public static func segregate(A: inout [Int]) -> Int {
        var j = 0
        for i in 0..<A.count {
            if A[i] <= 0 {
                let temp = A[i]
                A[i] = A[j]
                A[j] = temp
                j += 1 //increment count of non-positive
            }
        }
        return j
    }
    public static func findMissingPositive(A: inout [Int]) -> Int { //Find missing in an array that contains positive integer
        for i in 0..<A.count {
            let x = abs(A[i])
            if x - 1 < A.count && A[x-1] > 0 {
                A[x-1] = -A[x-1] //1 is subtracted because index start from 0 and positive numbers start from 1
            }
        }
        for i in 0..<A.count {
            if A[i] > 0 {
                return i+1
            }
        }
        return A.count+1
    }
    public static func linearfirstMissingPositive(_ A: inout [Int]) -> Int {
        let shift = segregate(A: &A)
        let slice = A.suffix(from: shift)
        var newA = Array(slice)
        return findMissingPositive(A: &newA)
    }
}
