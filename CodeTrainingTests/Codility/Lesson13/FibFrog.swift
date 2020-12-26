//
//  FibFrog.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2020/12/26.
//

import XCTest

/*
 The Fibonacci sequence is defined using the following recursive formula:

     F(0) = 0
     F(1) = 1
     F(M) = F(M - 1) + F(M - 2) if M >= 2
 A small frog wants to get to the other side of a river. The frog is initially located at one bank of the river (position −1) and wants to get to the other bank (position N). The frog can jump over any distance F(K), where F(K) is the K-th Fibonacci number. Luckily, there are many leaves on the river, and the frog can jump between the leaves, but only in the direction of the bank at position N.

 The leaves on the river are represented in an array A consisting of N integers. Consecutive elements of array A represent consecutive positions from 0 to N − 1 on the river. Array A contains only 0s and/or 1s:

 0 represents a position without a leaf;
 1 represents a position containing a leaf.
 The goal is to count the minimum number of jumps in which the frog can get to the other side of the river (from position −1 to position N). The frog can jump between positions −1 and N (the banks of the river) and every position containing a leaf.

 For example, consider array A such that:

     A[0] = 0
     A[1] = 0
     A[2] = 0
     A[3] = 1
     A[4] = 1
     A[5] = 0
     A[6] = 1
     A[7] = 0
     A[8] = 0
     A[9] = 0
     A[10] = 0
 The frog can make three jumps of length F(5) = 5, F(3) = 2 and F(5) = 5.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A consisting of N integers, returns the minimum number of jumps by which the frog can get to the other side of the river. If the frog cannot reach the other side of the river, the function should return −1.

 For example, given:

     A[0] = 0
     A[1] = 0
     A[2] = 0
     A[3] = 1
     A[4] = 1
     A[5] = 0
     A[6] = 1
     A[7] = 0
     A[8] = 0
     A[9] = 0
     A[10] = 0
 the function should return 3, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..100,000];
 each element of array A is an integer that can have one of the following values: 0, 1.
 
 0 / 1 / 1 / 2 / 3 / 5 / 8 / 13 / 21 / 34 / 55 / 89 / 144 / 233 / 377 / 610 / 987
 */

class FibFrog: XCTestCase {
    
    func appendValue(_ A : inout [Int], _ size: Int) {
        for _ in 0 ..< size - 1 {
            A.append(0)
        }
        A.append(1)
    }
    
    func test() {
        var A: [Int]
        
        A = [0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0]
        XCTAssertEqual(3, solution(&A))
        
        A = [1, 1, 0, 0, 0]
        XCTAssertEqual(2, solution(&A))
        
        // jumps - 13, 2, 13
        A = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,
             1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        XCTAssertEqual(3, solution(&A))
        
        // One jump! The number of (A.count + 1) is the fibonaccit number itself.
        A = [0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0]
        XCTAssertEqual(1, solution(&A))
        
        A = [0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        XCTAssertEqual(-1, solution(&A))
        
        A = []
        XCTAssertEqual(1, solution(&A))
    }
    
    func test_500() {
        var A: [Int] = []
        
        // 143 287 431
        for _ in 0 ..< 3 {
            appendValue(&A, 144)
        }
        XCTAssertEqual(4, solution(&A))
        
        A.removeAll()
        // 1 34 377 89
        A = [1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0,
             1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1,
             1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1,
             1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1,
             1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
             0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0,
             1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0,
             0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1,
             0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1,
             0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0,
             1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1,
             1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0,
             1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0,
             0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1,
             0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0,
             0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0,
             0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1,
             0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0,
             1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1,
             1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0]
        XCTAssertEqual(4, solution(&A))
    }
    
    func test_large_number() {
        let largeNumber = 100_000
        var A = Array<Int>.init(repeating: 0, count: largeNumber)
        let valueRange = 0 ... 1

        for i in 0 ..< largeNumber {
            A[i] = Int.random(in: valueRange)
        }

        measure {
            _ = solution(&A)
        }
    }

    public func solution(_ A : inout [Int]) -> Int {
        var fibonacciNumbers = [0, 1]

        A.append(1)
        var distance = 1
        while distance <= A.count {
            fibonacciNumbers.append(distance)
            distance = fibonacciNumbers[fibonacciNumbers.count - 1] + fibonacciNumbers[fibonacciNumbers.count - 2]
        }

        var pos: Int
        var jumps: Int
        var j: Int
        var minJumps = Int.max
        for i in stride(from: fibonacciNumbers.count - 1, to: 1, by: -1) {
            pos = -1
            jumps = 0
            j = i

            while j > 0 {
                if fibonacciNumbers[j] + pos <= A.count - 1 {
                    if A[fibonacciNumbers[j] + pos] == 1 {
                        pos += fibonacciNumbers[j]
                        jumps += 1
                        j = fibonacciNumbers.count - 1
                        if pos == A.count - 1 {
                            minJumps = min(minJumps, jumps)
                            break
                        }
                    } else {
                        j -= 1
                    }
                } else {
                    j -= 1
                }
            }
        }

        if minJumps != Int.max {
            return minJumps
        }
        return -1
    }
    
//    public func solution(_ A : inout [Int]) -> Int {
//        var fibonacciNumbers = [0, 1]
//
//        var distance = 1
//        A.append(1)
//        while distance <= A.count {
//            fibonacciNumbers.append(distance)
//            distance = fibonacciNumbers[fibonacciNumbers.count - 1] + fibonacciNumbers[fibonacciNumbers.count - 2]
//        }
//
//        var reachable = Array<Int>.init(repeating: -1, count: A.count)
//        for jump in fibonacciNumbers {
//            if jump == 0 { continue }
//            if A[jump - 1] == 1 {
//                reachable[jump - 1] = 1
//            }
//        }
//
//        for i in 0 ..< A.count {
//            if A[i] == 0 || reachable[i] > 0 {
//                continue
//            }
//            var minIdx = -1
//            var minValue = 100_000
//
//            for jump in fibonacciNumbers {
//                let previousIdx = i - jump
//                if previousIdx < 0 {
//                    break
//                }
//                if reachable[previousIdx] > 0,
//                   minValue > reachable[previousIdx] {
//                    minValue = reachable[previousIdx]
//                    minIdx = previousIdx
//                }
//            }
//
//            if minIdx != -1 {
//                reachable[i] = minValue + 1
//            }
//        }
//
//        return reachable[A.count - 1]
//    }
}
