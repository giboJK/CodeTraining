//
//  MarkAndToys.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/18.
//

import XCTest

class MarkAndToys: XCTestCase {

    func maximumToys(prices: [Int], k: Int) -> Int {
        let sorted = prices.sorted()
        var left = k
        var cnt = 0
        for i in 0 ..< sorted.count {
            if left > sorted[i] {
                left -= sorted[i]
                cnt += 1
            }
        }
        
        return cnt
    }
}
