import Foundation

public class InterviewBitMath {
    // MARK: - EXAMPLE: All Factors
    // a * b = N
    // if a < b && a < sqrt(n) && b > sqrt(n)
    public static func allFactors(_ A: Int) -> [Int] {
        if A == 1 { return [1] }
        var factors = [1, A]
        for i in 2...Int(sqrt(Double(A))) {
            if A % i == 0 {
                factors.append(i)
                if A/i != i {
                    factors.append(A/i)
                }
            }
        }
        return factors.sorted()
    }

    // MARK: - EXAMPLE: Verify Primes
    public static func isPrime(_ A: Int) -> Int {
        if A == 1 { return 0 }
        if A == 2 || A == 3 { return 1 }
        for i in 2...Int(sqrt(Double(A))) {
            if A % i == 0 { return 0 }
        }
        return 1
    }

    // MARK: - EXAMPLE: All Prime Numbers up to N
    public static func sieve(_ A: Int) -> [Int] { //O(n*sqrt(n)
        var primeNumbers = [Int]()
        for i in 2...A {
            if isPrime(i) == 1 {
                primeNumbers.append(i)
            }
        }
        return primeNumbers
    }

    public static func sieveOfEratosthenes(_ n: Int) -> [Int] {
        var primeNumbers = Array(repeating: 1, count: n+1)
        primeNumbers[0] = 0
        primeNumbers[1] = 0
        for i in 2...n {
            if primeNumbers[i] == 1 {
                var j = 2
                while j*i <= n {
                    primeNumbers[i*j] = 0
                    j += 1
                }
            }
        }
        return primeNumbers.enumerated()
            .filter({$0.element == 1})
            .map({$0.offset})
    }

    // MARK: - EXAMPLE: Binary Representation
    public static func findDigitsInBinary(_ A: Int) -> String {
        if A == 0 { return "0" }
        var binary = ""
        var remainder = [Int]()
        var dividend = A
        while dividend > 0 {
            remainder.append(dividend%2)
            dividend = Int(dividend/2)
        }
        for i in (0..<remainder.count).reversed() {
            binary += "\(remainder[i])"
        }
        return binary
    }

    public static func findDigitsInDecimal(_ A: Int) -> [Int] {
        var digits = [Int]()
        var n = A
        while n > 0 {
            digits.append(n%10)
            n /= 10
        }
        return digits.reversed()
    }

    // MARK: - FizzBuzz
    public static func fizzBuzz(_ A: Int) -> [String] {
        var fbArr = [String]()
        for i in 1...A {
            switch (i % 3 == 0, i % 5 == 0) {
            case (true, true):
                fbArr.append("FizzBuzz")
            case (true, false):
                fbArr.append("Fizz")
            case (false, true):
                fbArr.append("Buzz")
            default:
                fbArr.append("\(i)")
            }
        }
        return fbArr
    }

    // MARK: - Excel Column Number: A extension of String is required for this exercise
    public static func number(by letter: Character) -> Int {
        switch letter {
        case "A": return 1
        case "B": return 2
        case "C": return 3
        case "D": return 4
        case "E": return 5
        case "F": return 6
        case "G": return 7
        case "H": return 8
        case "I": return 9
        case "J": return 10
        case "K": return 11
        case "L": return 12
        case "M": return 13
        case "N": return 14
        case "O": return 15
        case "P": return 16
        case "Q": return 17
        case "R": return 18
        case "S": return 19
        case "T": return 20
        case "U": return 21
        case "V": return 22
        case "W": return 23
        case "X": return 24
        case "Y": return 25
        case "Z": return 26
        default: return 0
        }
    }

    public static func titleToNumber(column: String) -> Int {
        guard column.isEmpty == false else { return 0 }

        var result = 0
        let reverseColumn: [Character] = column.reversed()
        for index in 0..<Int(column.count) {
            result += number(by: reverseColumn[index])*Int(truncating: NSDecimalNumber(decimal: Decimal(pow(Double(26), Double(index)))))
        }
        return result
    }

    // MARK: - Palindrome Integer
    public static func isPalindrome(number: Int) -> Int {
        if number < 0 {
            return 0
        }
        //take each digit and reverse the order
        var digits = findDigitsInDecimal(number)
        var digitsReversed = Array(digits.reversed())
        for i in 0..<digits.count {
            if digits[i] != digitsReversed[i] {
                return 0
            }
        }
        return 1
    }

    public static func isPalindromeLinear(_ A: Int) -> Int {
        var number = A
        var reverseNumber = 0

        while number > 0 {
            let rightDigit = number%10
            reverseNumber = reverseNumber * 10 + rightDigit
            number = number/10
        }

        if A == reverseNumber {
            return 1
        } else {
            return 0
        }
    }

    // MARK: - Greatest Common Divisor
    public static func greatDivisor(_ A: Int, _ B: Int) -> Int {
        var dividend = max(A, B)
        var divisor = min(A, B)
        if divisor == 0 {
            return dividend
        }
        while dividend % divisor > 0 {
            let tempQuo = dividend % divisor
            dividend = divisor
            divisor = tempQuo
        }
        return divisor
    }

    // MARK: - Numbers of length N and value less than K
    public static func solve(_ A: [Int], _ B: Int, _ C: Int) -> Int {
        var count = 0
        var hasZero = false
        if A.count == 0 || B > String(C).count {
            return 0
        }
        if A[0] == 0 { hasZero = true}

        if String(C).count > B { //all numbers of lenght B
            if B > 1 && hasZero { //zero can't be in the first position
                return (A.count-1) * Int(pow(Double(A.count), Double(B-1)))
            } else {
                return Int(pow(Double(A.count), Double(B)))
            }
        }

        var pow10 = Int(pow(Double(10), Double(B-1)))
        var c = C
        for i in (0..<B).reversed() {
            let target = c/pow10
            c %= pow10
            pow10 /= 10
            var j = 0
            while j < A.count && A[j] < target {
                j += 1
            }
            count += (B > 1 && i+1 == B && hasZero ? j - 1 : j) * Int(pow(Double(A.count), Double(i)))
            if j == A.count || A[j] > target {
                break
            }
        }

        return count
    }

    // MARK: - Rearrange Array
    /*
     Let's encrypt each element to contain both A[i] and A[A[i]].

     encrypt each element such that old(A[i]) and new(A[A[i]]) can be recognized.
     so to distinguish add new data (A[A[i]]) in multiple of N.

     now if we % by N, new data(multiple of N) would be ineffective and old data accessed.
     and if we / by N, old data(which was < N) would be ineffective and new data accessed.
     */
    public static func arrange(_ A: inout [Int]) -> [Int] {
        for i in 0..<A.count {
            A[i] += A[A[i]] % A.count * A.count //Mod actually gives you what was there in actual input
        }
        for i in 0..<A.count {
            A[i] /= A.count
        }
        return A
    }

    // MARK: - Grid Unique Paths
    public static func exponencialUniquePaths(_ A: Int, _ B: Int) -> Int { //Recursion Problem -- Time complexity exponencial
        if A == 1 || B == 1 {
            return 1
        }
        return exponencialUniquePaths(A-1, B) + exponencialUniquePaths(A, B-1)
    }

    //Dynamic programming -- Time complexity O(a*b) -- Space complexity O(a*b)
    public static func dynamicProgrammingGridUniquePaths(_ A: Int, _ B: Int) -> Int {
        var count = Array(repeating: Array(repeating: 0, count: B), count: A)//sore result of subproblems
        //Count of paths to reach any cell in first column is 1
        for i in 0..<A {
            count[i][0] = 1
        }
        //Count of paths to reach any cell in first row is 1
        for i in 0..<B {
            count[0][i] = 1
        }
        //Calculate count of paths for other cells in bottom-up manner using the recursive solution
        for i in 1..<A {
            for j in 1..<B {
                count[i][j] = count[i-1][j] + count[i][j-1]
            }
        }
        return count[A-1][B-1]
    }

    //Combinatory Analysis: (A+B)!/(A!*B!) -- since it's a matrix and begins with 0 (A+B-2)!/((A-1)!*(B-1)!
    public static func combinationGridUNiquePaths(_ A: Int, _ B: Int) -> Int { //O(a+b)
        if A == 1 || B == 1 {
            return 1
        }
        var paths: Double = 1
        var quotient: Double = 1
        for i in 1..<A+B-1 {
            paths *= Double(i)
            if i < A {
                quotient *= Double(i)
            }
            if i < B {
                quotient *= Double(i)
            }
        }
        return Int(paths/quotient)
    }
}

// MARK: - Excel Column Number
extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }

}
