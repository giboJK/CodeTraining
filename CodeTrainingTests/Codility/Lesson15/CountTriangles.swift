//
//  CountTriangles.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/03.
//

import XCTest

/*
 An array A consisting of N integers is given.
 A triplet (P, Q, R) is triangular if it is possible
 to build a triangle with sides of lengths A[P], A[Q] and A[R].
 In other words, triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:

 A[P] + A[Q] > A[R],
 A[Q] + A[R] > A[P],
 A[R] + A[P] > A[Q].
 For example, consider array A such that:

   A[0] = 10    A[1] = 2    A[2] = 5
   A[3] = 1     A[4] = 8    A[5] = 12
 There are four triangular triplets that can be constructed from elements of this array,
 namely (0, 2, 4), (0, 2, 5), (0, 4, 5), and (2, 4, 5).

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A consisting of N integers,
 returns the number of triangular triplets in this array.

 For example, given array A such that:

   A[0] = 10    A[1] = 2    A[2] = 5
   A[3] = 1     A[4] = 8    A[5] = 12
 the function should return 4, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..1,000];
 each element of array A is an integer within the range [1..1,000,000,000].
 https://codility.com/media/train/13-CaterpillarMethod.pdf
 */
class CountTriangles: XCTestCase {
    func test() {
        var A: [Int]
        A = [10, 2, 5, 1, 8, 12]
        XCTAssertEqual(4, solution(&A))
        
        A = [5, 5, 5, 5, 6, 7]
        XCTAssertEqual(20, solution(&A))
    }
    
    func test_large_number() {
        var A = [Int]()
        for i in 0 ..< 1000 {
            A.append(i)
        }
        
        measure {
            _ = solution(&A)
        }
        
    }
    
    public func solution(_ A : inout [Int]) -> Int {
        if A.count < 3 {
            return 0
        }
        
        var count = 0
        A.sort()
        
        for i in 0 ..< A.count - 2 {
            var k = i + 2
            for j in i + 1 ..< A.count - 1 {
                while k < A.count,
                      A[i] + A[j] > A[k] {
                    k += 1
                }
                
                count += k - 1 - j
            }
        }
        
        return count
    }
}
