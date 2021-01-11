//
//  MaxNonoverlappingSegments.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/10.
//

import XCTest

/*
 Located on a line are N segments, numbered from 0 to N − 1,
 whose positions are given in arrays A and B.
 For each I (0 ≤ I < N) the position of segment I is from A[I] to B[I] (inclusive).
 The segments are sorted by their ends, which means
 that B[K] ≤ B[K + 1] for K such that 0 ≤ K < N − 1.

 Two segments I and J, such that I ≠ J,
 are overlapping if they share at least one common point.
 In other words, A[I] ≤ A[J] ≤ B[I] or A[J] ≤ A[I] ≤ B[J].

 We say that the set of segments is non-overlapping
 if it contains no two overlapping segments.
 The goal is to find the size of a non-overlapping set containing the maximal number of segments.

 For example, consider arrays A, B such that:

     A[0] = 1    B[0] = 5
     A[1] = 3    B[1] = 6
     A[2] = 7    B[2] = 8
     A[3] = 9    B[3] = 9
     A[4] = 9    B[4] = 10
 The segments are shown in the figure below.


 The size of a non-overlapping set containing a maximal number of segments is 3.
 For example, possible sets are {0, 2, 3}, {0, 2, 4}, {1, 2, 3} or {1, 2, 4}.
 There is no non-overlapping set with four segments.

 Write a function:

 public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int

 that, given two arrays A and B consisting of N integers,
 returns the size of a non-overlapping set containing a maximal number of segments.

 For example, given arrays A, B shown above, the function should return 3, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..30,000];
 each element of arrays A, B is an integer within the range [0..1,000,000,000];
 A[I] ≤ B[I], for each I (0 ≤ I < N);
 B[K] ≤ B[K + 1], for each K (0 ≤ K < N − 1).
 */
class MaxNonoverlappingSegments: XCTestCase {
    func test() {
        var A: [Int]
        var B: [Int]
        
        A = [1, 3, 7, 9, 9]
        B = [5, 6, 8, 9, 10]
        XCTAssertEqual(3, solution(&A, &B))
        
        A = []
        B = []
        XCTAssertEqual(0, solution(&A, &B))
        A = [1]
        B = [1]
        XCTAssertEqual(1, solution(&A, &B))
        
        A = [0, 2, 100]
        B = [0, 50, 1000]
        XCTAssertEqual(3, solution(&A, &B))
    }
    
    // performance fail
//    public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
//        if A.isEmpty { return 0 }
//
//        var maxCount = 0
//
//        var count = 0
//        for i in 0 ..< B.count - 1 {
//            count = 1
//            var end = B[i]
//            var j = i + 1
//            while j < B.count {
//                if A[j] > end {
//                    count += 1
//                    end = B[j]
//                }
//                j += 1
//            }
//
//            maxCount = max(maxCount, count)
//        }
//
//        return maxCount
//    }

    // 끝점으로 정렬되어 주어진다.
    // 무조건 앞에 나오는 것은 앞선 곳에서 끝나는 것이라는 뜻!
    // 끝나는 위치를 저장해놓은 후 끝나는 위치보다 큰 시작위치가 나오면
    // 해당 시작위치와 같은 인덱스의 끝 위치로 값을 업데이트하고 다음으로 진행
    // 즉 끝 위치보다 뒤에서 시작하는지 다 돌면서 확인하면서 값만 적절하가 업데이트 해주면 된다.
    public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
        if A.isEmpty { return 0 }
        
        var count = 1
        
        var end = B[0]
        
        for i in 0 ..< A.count {
            let start = A[i]
            
            if end < start {
                count += 1
                end = B[i]
            }
        }
        
        return count
    }
}
