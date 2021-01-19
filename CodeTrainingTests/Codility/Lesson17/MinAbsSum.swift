//
//  MinAbsSum.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/18.
//

import XCTest

/*
 For a given array A of N integers and a sequence S of N integers from the set {−1, 1},
 we define val(A, S) as follows:

 val(A, S) = |sum{ A[i]*S[i] for i = 0..N−1 }|

 (Assume that the sum of zero elements equals zero.)

 For a given array A, we are looking for such a sequence S that minimizes val(A,S).

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A of N integers,
 computes the minimum value of val(A,S) from all possible values of val(A,S)
 for all possible sequences S of N integers from the set {−1, 1}.

 For example, given array:

   A[0] =  1
   A[1] =  5
   A[2] =  2
   A[3] = -2
 your function should return 0, since for S = [−1, 1, −1, 1], val(A, S) = 0,
 which is the minimum possible value.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..20,000];
 each element of array A is an integer within the range [−100..100].
 https://app.codility.com/demo/results/training5J3BER-C6X/
 */
class MinAbsSum: XCTestCase {
    
    func test() {
        var A: [Int]
        A = [1, 5, 2, -2, 1, 3, 3]
        XCTAssertEqual(1, solution(&A))
        
        A = []
        XCTAssertEqual(0, solution(&A))
    }

    // 모든 원소를 양수로 바꾸고 생각한다. 양이냐 음이냐는 중요하지 않다
    // 전체 집합에서 부분집합을 2번 뺀 값의 절대값이 가장 작은 경우의 수를 구하는 것
    // 따라서 부분합의 크기가 전체 합/2 까지만 찾으면 된다
    // 일정 크기에 해당하는 부분합이 존재하냐 안 하냐를 체크해주면 된다.
    // 부분합크기 배열을 만들고 부분합 크기 배열의 값을 -1로 초기화한다(-1은 없다는 뜻)
    // 부분합의 크기가 0인 경우는 공집합이므로 언제나 존재한다. 따라서 0번째에 해당하는 값을 0으로 세팅해준다
    // 이제 부분집합을 어떻게 구할 것이냐 인데
    // 부분집합은 또 다른 부분집합과 다른 부분집합의 합으로 볼 수 있다는 것을 이용한다
    // 예를 들어 3인 원소를 가지고 8에 해당하는 부분집합을 만드려면 합이 5인 부분집합에 3을 더하면 된다.
    // 이런 식으로 부분집합을 찾고 다음 원소로 찾은 부분집합에 더해서 모든 집합을 찾으면 된다.
    public func solution(_ A : inout [Int]) -> Int {
        var ans = 0
        var sum = 0
        var numMap = [Int: Int]()
        A.forEach { a in
            sum += abs(a)
            numMap.updateValue((numMap[abs(a)] ?? 0) + 1, forKey: abs(a))
        }
        
        var subSets = [Int](repeating: -1, count: sum/2 + 1)
        subSets[0] = 0
        
        for (_, num) in numMap.enumerated() {
            for i in 0 ..< sum / 2 + 1 {
                if subSets[i] >= 0 {
                    subSets[i] = num.value
                } else if i >= num.key, subSets[i - num.key] > 0 {
                    subSets[i] = subSets[i - num.key] - 1
                }
            }
        }
        
        ans = sum
        for i in 0 ..< sum / 2 + 1 {
            if subSets[i] >= 0 {
                ans = min(ans, sum - i * 2)
            }
        }
        
        return ans
    }
}
