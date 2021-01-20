//
//  MaxArraySum.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/20.
//

import XCTest

class MaxArraySum: XCTestCase {
    
    func test() {
        var A: [Int]
        A = [-2, 1, 3, -4, 5]
        XCTAssertEqual(8, maxSubsetSum(arr: A))
        
        A = [-2, -3, -1]
        XCTAssertEqual(0, maxSubsetSum(arr: A))
        
        A = [1, 0, 3, 100, 5]
        XCTAssertEqual(101, maxSubsetSum(arr: A))
        
        A = [2, 1, 5, 8, 4]
        XCTAssertEqual(11, maxSubsetSum(arr: A))
    }
    
    
    func maxSubsetSum(arr: [Int]) -> Int {
        var sum = [Int]()
        arr.forEach { num in
            sum.append(num)
        }
        
        for i in 1 ..< arr.count {
            if i - 2 >= 0 {
                for j in stride(from: i - 2, through: 0, by: -1) {
                    sum[i] = max(sum[i], sum[j] + arr[i])
                }
            }
        }
        
        var ans = max(sum[0], 0)
        
        sum.forEach {
            ans = max(ans, $0)
        }
        
        return ans
    }
}
