//
//  Lesson17DynamicProgramming.swift
//  CodeTraining
//
//  Created by 정김기보 on 2021/01/14.
//

import Foundation

extension Codility {
    func dynamicCoinChanging(C: [Int], k: Int) -> Int {
        let n = C.count
        var dp = [Int](repeating: Int.max, count: k + 1)
        dp[0] = 0
        
        for i in 1 ..< n + 1 {
            for j in C[i - 1] ..< k + 1 {
                dp[j] = min(dp[j - C[i - 1]] + 1, dp[j])
            }
        }
        
        return dp[k]
    }
}

