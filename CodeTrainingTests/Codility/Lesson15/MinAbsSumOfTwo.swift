//
//  MinAbsSumOfTwo.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/03.
//

import XCTest

/*
 Let A be a non-empty array consisting of N integers.

 The abs sum of two for a pair of indices (P, Q) is the absolute value |A[P] + A[Q]|,
 for 0 ≤ P ≤ Q < N.

 For example, the following array A:

   A[0] =  1
   A[1] =  4
   A[2] = -3
 has pairs of indices (0, 0), (0, 1), (0, 2), (1, 1), (1, 2), (2, 2).
 The abs sum of two for the pair (0, 0) is A[0] + A[0] = |1 + 1| = 2.
 The abs sum of two for the pair (0, 1) is A[0] + A[1] = |1 + 4| = 5.
 The abs sum of two for the pair (0, 2) is A[0] + A[2] = |1 + (−3)| = 2.
 The abs sum of two for the pair (1, 1) is A[1] + A[1] = |4 + 4| = 8.
 The abs sum of two for the pair (1, 2) is A[1] + A[2] = |4 + (−3)| = 1.
 The abs sum of two for the pair (2, 2) is A[2] + A[2] = |(−3) + (−3)| = 6.
 Write a function:

 class Solution { public int solution(int[] A); }

 that, given a non-empty array A consisting of N integers,
 returns the minimal abs sum of two for any pair of indices in this array.

 For example, given the following array A:

   A[0] =  1
   A[1] =  4
   A[2] = -3
 the function should return 1, as explained above.

 Given array A:

   A[0] = -8
   A[1] =  4
   A[2] =  5
   A[3] =-10
   A[4] =  3
 the function should return |(−8) + 5| = 3.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−1,000,000,000..1,000,000,000].
 */
class MinAbsSumOfTwo: XCTestCase {
    
    func test() {
        var A: [Int]
        A = [1, 4, -3]
        XCTAssertEqual(1, solution(&A))
        
        A = [0]
        XCTAssertEqual(0, solution(&A))
        
        A = [1, 2, 3, 4]
        XCTAssertEqual(2, solution(&A))
        
        A = [-10, -8, -1, 3, 4, 5]
        XCTAssertEqual(2, solution(&A))
        
        A = [-15, -10, -1, 0, 1, 3, 5, 6]
        XCTAssertEqual(0, solution(&A))
    }
    
    func test_large() {
        var A = Array.init(repeating: 0, count: 100_000)
        for i in 0 ..< 100_000 {
            A[i] = i
        }
        
        measure {
            _ = solution(&A)
        }
    }
    
    // 아래보다 직관적으로 이해가 된다!
    // 출처 : https://github.com/ZRonchy/Codility/blob/master/Lesson13/MinAbsSumOfTwo.java
    public func solution(_ A : inout [Int]) -> Int {
        // 오름차순으로 정렬
        A.sort()
        var front = 0
        var back = A.count - 1
        var minAbsSumOfTwo = Int.max
        
        while (front <= back) {
            let currentSum = A[front] + A[back]
            minAbsSumOfTwo = min(minAbsSumOfTwo, abs(currentSum))

            // 음수일 경우 덜 작은 수를 빼주면 되므로 front를 뒤 쪽으로 이동시킨다
            // 반대로 양수일 땐 더 작은 수를 더해야 더 작은 합을 구할 수 있으므로 back을 앞 쪽으로 이동
            if currentSum <= 0 {
                front += 1
            } else {
                back -= 1
            }
        }
        
        return minAbsSumOfTwo
    }
    
//    public func solution(_ A : inout [Int]) -> Int {
//        A.sort()
//        var ans = Int.max
//        var front = 0
//        var back = A.count - 1
//
//        repeat {
//            let a = A[front]
//            var minDif = Int.max
//            var i = back
//
//            repeat {
//                let b = A[i]
//                let dif = abs(b + a)
//                if dif <= minDif {
//                    minDif = dif
//                } else {
//                    break
//                }
//                i -= 1
//            } while front <= i
//
//            back = i + 1
//            front += 1
//
//            ans = min(ans, minDif)
//        } while front <= back
//
//        return ans
//    }
}
