//
//  Lesson11_CountSemiprimes.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2020/12/23.
//

import XCTest

/*
 CountSemiprimes
 Count the semiprime numbers in the given range [a..b]
 
 
 A prime is a positive integer X that has exactly two distinct divisors: 1 and X. The first few prime integers are 2, 3, 5, 7, 11 and 13.
 
 A semiprime is a natural number that is the product of two (not necessarily distinct) prime numbers.
 The first few semiprimes are 4, 6, 9, 10, 14, 15, 21, 22, 25, 26.
 
 You are given two non-empty arrays P and Q, each consisting of M integers.
 These arrays represent queries about the number of semiprimes within specified ranges.
 
 Query K requires you to find the number of semiprimes within the range (P[K], Q[K]), where 1 ≤ P[K] ≤ Q[K] ≤ N.
 
 For example, consider an integer N = 26 and arrays P, Q such that:
 
 P[0] = 1    Q[0] = 26
 P[1] = 4    Q[1] = 10
 P[2] = 16   Q[2] = 20
 The number of semiprimes within each of these ranges is as follows:
 
 (1, 26) is 10,
 (4, 10) is 4,
 (16, 20) is 0.
 Write a function:
 
 public func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int]
 that, given an integer N and two non-empty arrays P and Q consisting of M integers,
 returns an array consisting of M elements specifying the consecutive answers to all the queries.
 
 For example, given an integer N = 26 and arrays P, Q such that:
 
 P[0] = 1    Q[0] = 26
 P[1] = 4    Q[1] = 10
 P[2] = 16   Q[2] = 20
 the function should return the values [10, 4, 0], as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..50,000];
 M is an integer within the range [1..30,000];
 each element of arrays P, Q is an integer within the range [1..N];
 P[i] ≤ Q[i].
 */


class Lesson11_CountSemiprimes: XCTestCase {
    
    func test() {
        let N = 26
        var p = [1, 4, 16]
        var q = [26, 10, 20]
        XCTAssertEqual(solution(N, &p, &q), [10, 4, 0])
    }
    
    func testMaxCasesPerformance() {
        let maxValue = 50_000
        let maxCases = 30000
        var arrayP = [Int]()
        var arrayQ = [Int]()
        let range = 1...maxValue
        var p: Int
        var q: Int
        for _ in 1...maxCases {
            p = Int.random(in: range)
            q = Int.random(in: range)
            
            arrayP.append(min(p, q))
            arrayQ.append(max(p, q))
        }
        measure {
            _ = solution(maxValue, &arrayP, &arrayQ)
        }
    }
    
    func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
        var ans = Array<Int>.init(repeating: 0, count: P.count)
        var primeNumbers = Array<Bool>.init(repeating: true, count: N + 1)
        primeNumbers[0] = false
        primeNumbers[1] = false
        
        var i = 2
        while i * i <= N {
            var n = i * 2
            if primeNumbers[i] {
                while n <= N {
                    primeNumbers[n] = false
                    n += i
                }
            }
            i += 1
        }
        
        var semiPrimeNumbers = Array<Bool>.init(repeating: false, count: N + 1)
        i = 2
        var j: Int
        while i * i <= N {
            j = i
            if primeNumbers[i] {
                while i * j <= N {
                    if primeNumbers[j] {
                        semiPrimeNumbers[i * j] = true
                    }
                    j += 1
                }
            }
            i += 1
        }
        
        var prefixSum = Array<Int>.init(repeating: 0, count: N + 1)
        for l in 1 ... N {
            if semiPrimeNumbers[l] {
                prefixSum[l] = prefixSum[l - 1] + 1
            } else {
                prefixSum[l] = prefixSum[l - 1]
            }
        }
        
        
        for j in 0 ..< P.count {
            ans[j] = prefixSum[Q[j]] - prefixSum[P[j] - 1]
        }
        
        return ans
    }
}
