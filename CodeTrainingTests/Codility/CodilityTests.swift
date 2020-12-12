//
//  CodilityTests.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2020/12/12.
//

import XCTest
@testable import CodeTraining

class CodilityTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func test_binaryGap() {
        XCTAssertEqual(5, binaryGap(1043))
        XCTAssertEqual(0, binaryGap(15))
        XCTAssertEqual(0, binaryGap(32))
    }
    
    func test_cyclicRotation() {
        XCTAssertEqual([9, 7, 6, 3, 8], cyclicRotation([3, 8, 9, 7, 6], 3))
        XCTAssertEqual([0, 0, 0], cyclicRotation([0, 0, 0], 1))
        XCTAssertEqual([1, 2, 3, 4], cyclicRotation([1, 2, 3, 4], 12))
        XCTAssertEqual([], cyclicRotation([], 3))
    }
    
    func test_oddOccurrencesInArray() {
        XCTAssertEqual(7, oddOccurrencesInArray([9, 3, 9, 3, 9, 7, 9]))
    }
    
    func test_frogJmp() {
        XCTAssertEqual(3, frogJmp(10, 85, 30))
    }
    
    func test_permMissingElem() {
        XCTAssertEqual(4, permMissingElem([2, 3, 1, 5]))
    }
    
    func test_tapeEquilibrium() {
        XCTAssertEqual(1, tapeEquilibrium([3, 1, 2, 4, 3]))
        XCTAssertEqual(2000, tapeEquilibrium([-1000, 1000]))
    }
    
    func test_frogRiverOne() {
        
    }
    
    func test_maxCounters() {
        
    }
    
    func test_missingInteger() {
        
    }
    
    func test_permCheck() {
        
    }
}
