//
//  Lesson12_ChocolatesByNumbers.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2020/12/25.
//

import XCTest

/*
 Two positive integers N and M are given.
 Integer N represents the number of chocolates arranged in a circle,
 numbered from 0 to N − 1.
 
 You start to eat the chocolates. After eating a chocolate you leave only a wrapper.
 
 You begin with eating chocolate number 0.
 Then you omit the next M − 1 chocolates or wrappers on the circle,
 and eat the following one.
 
 More precisely, if you ate chocolate number X,
 then you will next eat the chocolate with number (X + M) modulo N (remainder of division).
 
 You stop eating when you encounter an empty wrapper.
 
 For example, given integers N = 10 and M = 4.
 You will eat the following chocolates: 0, 4, 8, 2, 6.
 
 The goal is to count the number of chocolates that you will eat,
 following the above rules.
 
 Write a function:
 
 public func solution(_ N : Int, _ M : Int) -> Int
 
 that, given two positive integers N and M,
 returns the number of chocolates that you will eat.
 
 For example, given integers N = 10 and M = 4. the function should return 5,
 as explained above.
 
 Write an efficient algorithm for the following assumptions:
 
 N and M are integers within the range [1..1,000,000,000].
 */
class Lesson12_ChocolatesByNumbers: XCTestCase {
    
    func test() {
        var N: Int
        var M: Int
        
        N = 10
        M = 4
        XCTAssertEqual(5, solution(N, M))
        
        N = 2
        M = 4
        XCTAssertEqual(1, solution(N, M))
    }
    
    func test_large_Number() {
        let N: Int = 1_000_000_000
        var M: Int
        let range = 1...N
        M = Int.random(in: range)
        
        measure {
            _ = solution(N, M)
        }
    }
    
    public func solution(_ N : Int, _ M : Int) -> Int {
        func binaryGcd(_ a: Int, _ b: Int, _ res: Int = 1) -> Int {
            if a == b {
                return res * a
            } else if a % 2 == 0,
                      b % 2 == 0 {
                return binaryGcd(a / 2, b / 2, 2 * res)
            } else if a % 2 == 0 {
                return binaryGcd(a / 2, b, res)
            } else if b % 2 == 0 {
                return binaryGcd(a, b / 2, res)
            } else if a > b {
                return binaryGcd(a - b, b, res)
            } else {
                return binaryGcd(a, b - a, res)
            }
        }
        
        let gcd = binaryGcd(N, M)
        
        return N / gcd
    }
}
