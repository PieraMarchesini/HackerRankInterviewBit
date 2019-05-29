import Foundation

public class InterviewBitBinarySearch {
    // MARK: - InterviewBit BinarySearch - O(log n)
    public static func binarySearch(array: [Int], find: Int) -> Int { //array previously sorted
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

    public static func binarySearch(array: [Int], find: Int, searchFirst: Bool) -> Int {
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

    // MARK: - EXAMPLE: Count Element Occurence
    public static func findCount(_ A: [Int], _ B: Int) -> Int {
        let start = binarySearch(array: A, find: B, searchFirst: true)
        if start == -1 { return 0 }
        let end = binarySearch(array: A, find: B, searchFirst: false)
        return end-start+1
    }

    // MARK: - EXAMPLE: Rotated Array
    public static func findMin(_ A: [Int]) -> Int { //modification of binary search: find pivot (next and previous are greater)
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

    public static func sqrt(_ A: Int) -> Int {
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

    // MARK: - Search for a Range
    public static func searchRange(_ A: [Int], _ B: Int) -> [Int] {
        //binarysearch - findfirst and last
        return [binarySearch(array: A, find: B, searchFirst: true), binarySearch(array: A, find: B, searchFirst: false)]
    }

    // MARK: - Implement Power Function
    public static func powmod(x: Int, n: Int, p: Int) -> Int {
        if x == 0 {
            return 1 % p
        }
        var answer: Float = 1, base = Float(x), exp = Float(n), mod = Float(p)
        while exp > 0 {
            // We need (base ** n) % p.
            // Now there are 2 cases.
            // 1) n is even. Then we can make base = base^2 and n = n / 2.
            // 2) n is odd. So we need base * base^(n-1
            if n % 2 == 1 { //even number
                answer = (answer * base).truncatingRemainder(dividingBy: mod)
                exp -= 1
            } else {
                base = (base * base).truncatingRemainder(dividingBy: mod)
                exp /= 2
            }
        }
        if answer < 0 {
            answer = (answer + mod).truncatingRemainder(dividingBy: mod)
        }
        return Int(answer)
    }

    //MARK: - Rotated Sorted Array Search
    public static func search(A: [Int], target: Int) -> Int {
        var low = 0, high = A.count-1
        while low <= high {
            let mid: Int = (low+high)/2
            if A[mid] == target {
                return mid
            }
            if A[low] <= A[mid] { //Left is sorted
                if A[low] <= target && target <= A[mid] {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            } else { //Right is sorted
                if A[mid] < target && target <= A[high] {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
        }
        return -1
    }

    // MARK: - Painter's Partition Problem
    //https://greedforcode.blogspot.com/2017/03/painter-partition-problem-binary-search.html
    /*
     1. Here we will apply binary search on "length of board allocated" to each painter.
     2. Note that maximum length of board from all available boards will be the least length per painter because since a board cannot be shared by two painters, hence there will be at least one painter who will paint that board, so minimum length of board per painter is max of length of boards.
     3. The maximum length a painter can paint is sum of all board length present. That is one painter only paints all the boards.
     4. Hence after applying binary search to (max length, sum of lengths) we will check if that length per painter satisfies the constraints and all painters can be allocated to the boards. Because length per painter will be minimum when all painters have been used.
     */
    public static func tryAssignPainting(targetTime: Int, painters: Int, time: Int, boards: [Int]) -> Int? {
        var painter = 0
        var painterTime = 0
        var maxTime = 0
        for board in boards {
            if painter >= painters {
                return nil
            }
            let timeToPaint = board * time
            if painterTime + timeToPaint > targetTime {
                painter += 1
                maxTime = max(maxTime, painterTime)
                painterTime = timeToPaint
                continue
            }
            painterTime += timeToPaint
        }
        if painter >= painters {
            return nil
        }
        maxTime = max(maxTime, painterTime)
        return maxTime
    }
    public static func paint(painters: Int, time: Int, boards: [Int]) -> Int {
        let max = boards.max() ?? 1
        guard boards.count > 1, boards.count > painters else {
            return (max * time) % 10000003
        }
        let maxTime = max * (boards.count / painters) * time

        var start = 0
        var end = maxTime
        var currentTime = (start + end) / 2
        var maxTimeCalculated: Int?
        while end >= start {
            let nextTryTime = tryAssignPainting(targetTime: currentTime, painters: painters, time: time, boards: boards)
            if nextTryTime != nil {
                maxTimeCalculated = nextTryTime
                end = currentTime - 1
            } else {
                start = currentTime + 1
            }
            currentTime = (start + end) / 2
        }
        return (maxTimeCalculated ?? 0) % 10000003
    }

    // MARK : - Allocate Books
    public static func isPossible(_ books: [Int], _ students: Int, _ min: Int) -> Bool {
    var requiredStudents = 1
        var sum = 0
        for book in books {
            if book > min { //the minimum amount of pages can't be less that a book of the collection
                return false
            }
            if (book+sum) > min {
                requiredStudents += 1
                sum = book
                if requiredStudents > students {
                    return false
                }
            } else {
                sum += book
            }
        }
        return true
    }
    public static func books(books: [Int], students: Int) -> Int {
        if books.count < students {
            return -1
        }
        let sum = books.reduce(0, +)
        var start = 0, end = sum, result = Int.max
        while start <= end {
            let mid = (start+end)/2
            if isPossible(books, students, mid) {
                result = min(result, mid)
                end = mid-1 //check if result could be less than actual
            } else {
                start = mid+1
            }
        }
        return result
    }
}
