import Foundation

public class HackerRankArrays {

    // MARK: - 2D Array DS
    public static func hourglassSum(arr: [[Int]]) -> Int {
        var sum: [Int] = []
        for i in 0..<arr.count-2 {
            for j in 0..<arr[0].count-2 {
                let top = arr[i][j]+arr[i][j+1]+arr[i][j+2]
                let mid = arr[i+1][j+1]
                let bottom = arr[i+2][j]+arr[i+2][j+1]+arr[i+2][j+2]
                sum.append(top + mid + bottom)
            }
        }
        return sum.max()!
    }

    // MARK: - Arrays Left Rotation
    public static func rotLeft(a: [Int], d: Int) -> [Int] {
        let times = d % a.count
        if times > 0 {
            var tmp: [Int] = []
            for i in 0..<a.count-times {
                tmp.append(a[i+times])
            }
            let size = tmp.count
            for i in 0..<a.count-size {
                tmp.append(a[i])
            }
            return tmp
        }
        return a
    }

    // MARK: - New Year Chaos
    public static func minimumBribes(q: [Int]) -> Void {
        var count = 0
        var array = q
        for i in (0...array.count-1).reversed() {
            if array[i] != i+1 {
                if i-1 >= 0 && array[i-1] == i+1 {
                    count += 1
                    array.swapAt(i, i-1)
                } else if i-2 >= 0 && array[i-2] == i+1 {
                    count += 2
                    array[i-2] = array[i-1]
                    array[i-1] = array[i]
                    array[i] = i+1
                } else {
                    print("Too chaotic")
                    return
                }
            }
        }
        //    print(count) -- faz parte da solução
    }

    // MARK: - Minimum Swaps 2 -> Time Complexity: O(n Log n) and Auxiliary Space: O(n)
    //Deve-se normalizar pq está usando index começando no 0 e os vlores começando em 1. Evitar mexer no offset. só no element
    //sortedArr.contains(where: {$0.offset == i && $0.element == i+1})
    //sortedArr.first(where: {$0.offset == j})!.element-1
    public static func minimumSwaps(arr: [Int]) -> Int {
        let newArr = arr.enumerated()
        let sortedArr = newArr.sorted(by: { $0.element < $1.element})
        var visited = Array(repeating: false, count: arr.count)

        var swaps = 0
        for i in 0..<arr.count {
            if visited[i] || sortedArr.contains(where: {$0.offset == i && $0.element == i+1}) {
                continue
            }
            var cycleSize = 0
            var j = i
            while !visited[j] {
                visited[j] = true
                j = sortedArr.first(where: {$0.offset == j})!.element-1
                cycleSize += 1
            }
            if cycleSize > 0 {
                swaps += cycleSize - 1
            }
        }
        return swaps
    }

    // MARK: - Array Manipulation
    public static func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
        var arr = Array(repeating: 0, count: n).enumerated()
        for i in 0..<queries.count {
            arr = arr.map({ (offset, element) -> Int in
                if offset >= queries[i][0]-1 && offset <= queries[i][1]-1 {
                    return element + queries[i][2]
                }
                return element
            }).enumerated()
        }
        let (_, maxValue) = arr.max(by: { $0.element < $1.element }) ?? (0,0)
        return maxValue
    }
}
