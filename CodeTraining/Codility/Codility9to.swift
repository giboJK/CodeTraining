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
        return maxProfit
    }
    
    func maxSliceSum() {
        
    }
}
