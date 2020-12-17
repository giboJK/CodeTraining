//
//  Codility9to.swift
//  CodeTraining
//
//  Created by 정김기보 on 2020/12/16.
//

import Foundation

extension Codility {
    func maxDoubleSliceSum(_ A: [Int]) -> Int {
        var frontSum = Array<Int>.init(repeating: 0, count: A.count)
        var backSum = Array<Int>.init(repeating: 0, count: A.count)
        
        for i in 1 ..< A.count - 1 {
            frontSum[i] = max(frontSum[i - 1] + A[i], 0)
        }
        
        for i in stride(from: A.count - 2, to: 0, by: -1) {
            backSum[i] = max(0, backSum[i + 1] + A[i])
        }
        
        var maxDoubleSliceSum = 0
        
        for i in 1 ..< A.count - 1 {
            maxDoubleSliceSum = max(maxDoubleSliceSum, frontSum[i-1] + backSum[i+1])
        }
        
        return maxDoubleSliceSum
    }
    
    func maxProfit(_ A: [Int]) -> Int {
        var maxProfit = 0
        var maxEnding = 0
        var delta = Array<Int>.init(repeating: 0, count: A.count)
        
        if A.count < 2 {
            return 0
        }
        
        for i in 1 ..< A.count {
            delta[i] = A[i] - A[i - 1]
        }
        
        for i in 1 ..< A.count {
            maxEnding = max(0, maxEnding + delta[i])
            maxProfit = max(maxProfit, maxEnding)
        }
        
        return maxProfit
    }
    
    func maxSliceSum(_ A: [Int]) -> Int {
//        var maxEnd = 0
//        var maxSlice = 0
//
//        for i in 0 ..< A.count {
        // 이게 0일 수 있는 이유는 하나도 안 포함하는 0의 경우를 가질 수 있기 때문에
//            maxEnd = max(0, maxEnd + A[i])
//            maxSlice = max(maxSlice, maxEnd)
//        }
//
//        if maxSlice == 0 {
//            maxSlice = A[0]
//            for i in 1 ..< A.count {
//                maxSlice = max(maxSlice, A[i])
//            }
//        }
//
//        return maxSlice
        // 무조건 하나를 포함해야 하므로 A[0]
        var maxEnd = A[0]
        var maxSlice = A[0]
        
        for i in 1 ..< A.count {
            // 여기까지의 합의 최대값
            // i까지의 경우 무조건 A[i]를 포함해야 하므로 A[i]와 비교하는 것
            maxEnd = max(maxEnd + A[i], A[i])
            // 부분합의 최대값
            maxSlice = max(maxEnd, maxSlice)
        }

        return maxSlice
    }
}
