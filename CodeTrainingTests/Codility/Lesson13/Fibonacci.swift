//
//  Fibonacci.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2020/12/26.
//

import XCTest
@testable import CodeTraining

class Fibonacci: XCTestCase {
    var sut: Codility!
    
    override func setUp() {
        super.setUp()
        sut = Codility()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test() {
        var n: Int
        n = 0
        XCTAssertEqual(0, sut.fibonacciDynamic(n))
        
        n = 1
        XCTAssertEqual(1, sut.fibonacciDynamic(n))
        
        n = 2
        XCTAssertEqual(1, sut.fibonacciDynamic(n))
    }
}
