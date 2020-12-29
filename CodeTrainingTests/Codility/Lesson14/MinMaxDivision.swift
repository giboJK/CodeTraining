//
//  MinMaxDivision.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2020/12/28.
//

import XCTest

/*
 You are given integers K, M and a non-empty array A consisting of N integers.
 Every element of the array is not greater than M.

 You should divide this array into K blocks of consecutive elements.
 The size of the block is any integer between 0 and N.
 Every element of the array should belong to some block.

 The sum of the block from X to Y equals A[X] + A[X + 1] + ... + A[Y].
 The sum of empty block equals 0.

 The large sum is the maximal sum of any block.

 For example, you are given integers K = 3, M = 5 and array A such that:

   A[0] = 2
   A[1] = 1
   A[2] = 5
   A[3] = 1
   A[4] = 2
   A[5] = 2
   A[6] = 2
 The array can be divided, for example, into the following blocks:

 [2, 1, 5, 1, 2, 2, 2], [], [] with a large sum of 15;
 [2], [1, 5, 1, 2], [2, 2] with a large sum of 9;
 [2, 1, 5], [], [1, 2, 2, 2] with a large sum of 8;
 [2, 1], [5, 1], [2, 2, 2] with a large sum of 6.
 The goal is to minimize the large sum. In the above example, 6 is the minimal large sum.

 Write a function:

 public func solution(_ K : Int, _ M : Int, _ A : inout [Int]) -> Int

 that, given integers K, M and a non-empty array A consisting of N integers,
 returns the minimal large sum.

 For example, given K = 3, M = 5 and array A such that:

   A[0] = 2
   A[1] = 1
   A[2] = 5
   A[3] = 1
   A[4] = 2
   A[5] = 2
   A[6] = 2
 the function should return 6, as explained above.

 Write an efficient algorithm for the following assumptions:

 N and K are integers within the range [1..100,000];
 M is an integer within the range [0..10,000];
 each element of array A is an integer within the range [0..M].
 https://app.codility.com/demo/results/trainingCK9DX8-M63/
 */
class MinMaxDivision: XCTestCase {
    
    func test() {
        var A: [Int]
        var K: Int
        var M: Int
        
        A = [2, 1, 5, 1, 2, 2, 2]
        K = 3
        M = 5
        XCTAssertEqual(6, solution(K, M, &A))
    }
    
    func test_large() {
        let largeSize = 100_000
        let largeNumberM = 10_000
        let range = 0 ... largeNumberM

        var A: [Int] = Array.init(repeating: 0, count: largeSize)
        var K: Int
        let M: Int = largeNumberM
        
        
        for i in 0 ..< largeSize {
            A[i] = Int.random(in: range)
        }
        K = Int.random(in: 0 ..< largeSize)
        
        measure {
            _ = solution(K, M, &A)
        }
    }
/*
    public func solution(_ K: Int, _ M: Int, _ A: inout [Int]) -> Int {
        var ans: Int = 0
        var lowSum = 0
        // 배열 중 가장 큰 요소의 값이 가장 작은 부분합의 크기가 된다.
        // 어떻게 자르든 하나의 구간에서는 가장 큰 요소를 포함해야 하니까
        var highSum = A.reduce(0) { (result: Int, element: Int) -> Int in
            lowSum = max(lowSum, element)
            return result + element
        } // 가장 부분합이 큰 경우의 수는 모든 요소들을 다 더한 값
        
        // mid는 가장 작은 큰 "값의 크기"에 대한 기대값이야
        // 기대값을 가장 큰 크기의 값과 가장 크기의 작은 값의 평균값이라고 생각하고 시작하는거지
        // 우리는 바이너리 서치할 때처럼 특정 값을 찾는 것이 아니라 특정 조건을 만족하는 "크기"를 찾는거지!
        // 바이너리 서치에서의 조건은 값이 정렬되어 있다는 것인데
        // 정렬이 필요없는 이유는 값을 찾는 것이 아니라 지금 이 상태에서의 조건을 만족하는 크기를 찾는 거니까
        // 우리가 찾는 크기는 이미 정렬이 되어있잖아. 1 2 3 4 5 ..
        // 만약에 x라는 기대값으로 찾다가 K개보다 많은 구간이 나왔어 그러면 기대값을 키우면 되고 -> lowSum값의 크기를 키운다
        // K개보다 작은 구간이 나왔어 그러면 기대값을 줄이면 된다 -> highSum값의 크기를 줄인다
        
        var mid: Int
        var sum: Int
        var count: Int
        while lowSum <= highSum {
            mid = (lowSum + highSum) / 2
            sum = 0
            count = 0
            for i in 0 ..< A.count {
                sum += A[i]
                if sum <= mid {
                    if i == A.count - 1 {
                        highSum = mid - 1
                        ans = mid
                    }
                } else {
                    sum = A[i]
                    count += 1
                    // 도는 중에 이미 조건을 어겨버리면(K개보다 많은 부분이 생긴다면 기대값디 더 커야한다는 소리이니까
                    // 기대값을 키우고 종료
                    if count > K - 1 {
                        lowSum = mid + 1
                        break
                    }
                }
                // 다 돌았으면 기대값을 좀 줄이고 다시 해보자
            }
        }
        
        return ans
    }
*/
    public func solution(_ K: Int, _ M: Int, _ A: inout [Int]) -> Int {
        var ans: Int = 0
        var lowSum = 0
        var highSum = 0
        A.forEach {
            lowSum = max(lowSum, $0)
            highSum += $0
        }
        
        var mid: Int
        var sum: Int
        var count: Int
        while lowSum <= highSum {
            mid = (lowSum + highSum) / 2
            sum = 0
            count = 0
            for i in 0 ..< A.count {
                sum += A[i]
                if sum > mid {
                    sum = A[i]
                    count += 1
                    if count > K - 1 {
                        lowSum = mid + 1
                        break
                    }
                }
                if i == A.count - 1 {
                    highSum = mid - 1
                    ans = mid
                }
            }
        }
        
        return ans
    }
}
