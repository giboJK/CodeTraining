//
//  Lesson17.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/14.
//

import XCTest
@testable import CodeTraining

class Lesson17: XCTestCase {
    let sut = Codility()
    
    func test_dynamic_coin_changing() {
        var C: [Int]
        var K: Int
        
        C = [1, 3, 4]
        K = 6
        
        XCTAssertEqual(2, sut.dynamicCoinChanging(C: C, k: K))
    }

}
