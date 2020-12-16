//
//  Codility9to.swift
//  CodeTraining
//
//  Created by 정김기보 on 2020/12/16.
//

import Foundation

extension Codility {
    func maxDoubleSliceSum(_ A: [Int]) -> Int {
        var maxEnding = 0
        var maxSlice = 0
        
        for i in 1 ..< A.count {
            maxEnding = max(0, maxEnding + A[i])
            maxSlice = max(maxSlice, maxEnding)
        }
        
        return maxSlice
    }
    
    func maxProfit() {
        
    }
    
    func maxSliceSum() {
        
    }
}
