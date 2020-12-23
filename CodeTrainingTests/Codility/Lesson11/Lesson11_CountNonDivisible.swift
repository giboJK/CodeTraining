//
//  Lesson11_CountNonDivisible.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2020/12/23.
//

import XCTest

/*
 CountNonDivisible
 Calculate the number of elements of an array that are not divisors of each element.
 
 
 You are given an array A consisting of N integers.
 
 For each number A[i] such that 0 ≤ i < N, we want to count the number of elements of the array that are not the divisors of A[i]. We say that these elements are non-divisors.
 
 For example, consider integer N = 5 and array A such that:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 3
 A[4] = 6
 For the following elements:
 
 A[0] = 3, the non-divisors are: 2, 6,
 A[1] = 1, the non-divisors are: 3, 2, 3, 6,
 A[2] = 2, the non-divisors are: 3, 3, 6,
 A[3] = 3, the non-divisors are: 2, 6,
 A[4] = 6, there aren't any non-divisors.
 Write a function:
 
 public func solution(_ A : inout [Int]) -> [Int]
 that, given an array A consisting of N integers, returns a sequence of integers representing the amount of non-divisors.
 
 Result array should be returned as an array of integers.
 
 For example, given:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 3
 A[4] = 6
 the function should return [2, 4, 3, 2, 0], as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..50,000];
 each element of array A is an integer within the range [1..2 * N].
 
 https://app.codility.com/demo/results/training2X2C3Y-3KF/
 */

class Lesson11_CountNonDivisible: XCTestCase {
    
    func test() {
        var a = [Int]()
        
        a = [3, 1, 2, 3, 6]
        XCTAssertEqual(solution(&a), [2, 4, 3, 2, 0])
    }
    
    func testPerformance() {
        var array = [Int]()
        let range = 1...(2 * 50_000)
        for _ in 1...5000 {
            array.append(Int.random(in: range))
        }
        measure {
            _ = solution(&array)
        }
    }
    
    func testAllTheSameValuesPerformance() {
        var array = [Int](repeating: 20_000, count: 50_000)
        measure {
            _ = solution(&array)
        }
    }
    
    // 가장 오래 걸린 건 0.072
    // 아래에서 타임 아웃 걸린 부분은 0.05초로 약 5배 빨랐음
    func solution (_ A: inout [Int]) -> [Int] {
        var maxValue = 1
        var numbers: [Int: Int] = [:]
        var ans: [Int] = []
        
        for i in 0 ..< A.count {
            if let value = numbers[A[i]] {
                numbers[A[i]] = value + 1
            } else {
                numbers[A[i]] = 1
            }
            maxValue = max(maxValue, A[i])
        }
        
        var divisorsDict: [Int: Int] = [:]
        
        for (key, value) in numbers {
            var divisor = key * 2
            while divisor <= maxValue {
                if let dividend = numbers[divisor] {
                    if let allDivisorCount = divisorsDict[divisor] {
                        divisorsDict[divisor] = allDivisorCount + value
                    } else {
                        divisorsDict[divisor] = value
                    }
                }
                divisor += key
            }
        }
        
        for i in 0 ..< A.count {
            if let selfCount = numbers[A[i]] {
                if let divisorCount = divisorsDict[A[i]] {
                    ans.append(A.count - selfCount - divisorCount)
                } else {
                    ans.append(A.count - selfCount)
                }
            }
        }
        
        return ans
    }
    
    
// 타임 아웃 나온 방식. Dictionary로 하면 좀 더 빨랐고 0.240초..
//    func countNonDivisible (_ A: [Int]) -> [Int] {
//        var numbers = Array<Int>.init(repeating: 0, count: A.count * 2 + 1)
//        var ans = Array<Int>.init(repeating: 0, count: A.count)
//
//        A.forEach {
//            numbers[$0] += 1
//        }
//
//        var j = 1
//        var divisors = 0
//        for i in 0 ..< A.count {
//            j = 1
//            divisors = 0
//            while j * j < A[i] {
//                if A[i] % j == 0 {
//                    divisors += numbers[j]
//                    divisors += numbers[A[i] / j]
//                }
//                j += 1
//            }
//
//            if j * j == A[i] {
//                divisors += numbers[j]
//            }
//
//            ans[i] = A.count - divisors
//        }
//
//        return ans
//    }
    
}
