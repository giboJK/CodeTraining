//
//  CountingInversions.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/23.
//

import XCTest

class CountingInversions: XCTestCase {
    
    func test() {
        var A: [Int]
        A = [2, 1, 3, 1, 2]
        XCTAssertEqual(4, countInversions(arr: A))
        
        A = [7, 5, 3, 1]
        XCTAssertEqual(6, countInversions(arr: A))
        
        A = [3, 2, 1]
        XCTAssertEqual(3, countInversions(arr: A))
    }
    
    func countInversions(arr: [Int]) -> Int {
        var cnt = 0

        
        return cnt
    }
}
