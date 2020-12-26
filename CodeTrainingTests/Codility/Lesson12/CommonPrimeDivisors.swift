//
//  CommonPrimeDivisors.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2020/12/25.
//

import XCTest

/*
 A prime is a positive integer X that has exactly two distinct divisors: 1 and X.
 The first few prime integers are 2, 3, 5, 7, 11 and 13.

 A prime D is called a prime divisor of a positive integer P if there exists
 a positive integer K such that D * K = P. For example, 2 and 5 are prime divisors of 20.

 You are given two positive integers N and M.
 The goal is to check whether the sets of prime
 divisors of integers N and M are exactly the same.

 For example, given:

 N = 15 and M = 75, the prime divisors are the same: {3, 5};
 N = 10 and M = 30, the prime divisors aren't the same: {2, 5} is not equal to {2, 3, 5};
 N = 9 and M = 5, the prime divisors aren't the same: {3} is not equal to {5}.
 Write a function:

 public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int

 that, given two non-empty arrays A and B of Z integers,
 returns the number of positions K for which the prime divisors of A[K]
 and B[K] are exactly the same.

 For example, given:

     A[0] = 15   B[0] = 75
     A[1] = 10   B[1] = 30
     A[2] = 3    B[2] = 5
 the function should return 1,
 because only one pair (15, 75) has the same set of prime divisors.

 Write an efficient algorithm for the following assumptions:

 Z is an integer within the range [1..6,000];
 each element of arrays A, B is an integer within the range [1..2,147,483,647].
 */

/*
 두 수의 인수가 = 최대공약수의 인수인 것을 찾으면 된다!
 이걸 모르고 소인수분해 알고리즘까지 찾아보았는데 알면 좋을듯하다
 아래는 소인수분해 알고리즘 설명글이다
 https://koosaga.com/239
 
 채점 결과표
 https://app.codility.com/demo/results/training3497JB-HRN/
 */
class CommonPrimeDivisors: XCTestCase {

    func test() {
        var A: [Int]
        var B: [Int]
        
        A = [15, 10, 3]
        B = [75, 30, 5]
        XCTAssertEqual(1, solution(&A, &B))
        
        A = [13, 27]
        B = [169, 36]
        XCTAssertEqual(1, solution(&A, &B))
    }
    
    func test_maxCases() {
        let maxValue = 2_147_483_647
        let maxCases = 6_000
        let range = 1 ... maxValue
        var A = [Int]()
        var B = [Int]()
        
        for _ in 0 ..< maxCases {
            A.append(Int.random(in: range))
            B.append(Int.random(in: range))
        }
        
        measure {
            _ = solution(&A, &B)
        }
    }
    
    
    func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
        var ans = 0
        
        func binaryGcd(_ a: Int, _ b: Int, _ res: Int = 1) -> Int {
            if a == b {
                return a * res
            } else if a % 2 == 0,
                      b % 2 == 0 {
                return binaryGcd(a / 2, b / 2, res * 2)
            } else if a % 2 == 0 {
                return binaryGcd(a / 2, b, res)
            } else if b % 2 == 0 {
                return binaryGcd(a, b / 2, res)
            } else if a > b {
                return binaryGcd(a - b, a, res)
            } else {
                return binaryGcd(a, b - a, res)
            }
        }
        
        for i in 0 ..< A.count {
            let gcd = binaryGcd(A[i], B[i])
            var gcdWithA = 0
            var gcdWithB = 0
            
            var tempA = A[i]
            while gcdWithA != 1 {
                gcdWithA = binaryGcd(tempA, gcd)
                tempA /= gcdWithA
            }
            
            var tempB = B[i]
            while gcdWithB != 1 {
                gcdWithB = binaryGcd(tempB, gcd)
                tempB /= gcdWithB
            }
            
            if tempA == 1,
               tempB == 1 {
                ans += 1
            }
        }
        
        return ans
    }
}
