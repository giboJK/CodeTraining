//
//  CodilityTests.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2020/12/12.
//

import XCTest
@testable import CodeTraining

class CodilityTests: XCTestCase {
    var sut: Codility!
    override func setUp() {
        super.setUp()
        sut = Codility()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_binaryGap() {
        XCTAssertEqual(5, sut.binaryGap(1043))
        XCTAssertEqual(0, sut.binaryGap(15))
        XCTAssertEqual(0, sut.binaryGap(32))
    }
    
    func test_cyclicRotation() {
        XCTAssertEqual([9, 7, 6, 3, 8], sut.cyclicRotation([3, 8, 9, 7, 6], 3))
        XCTAssertEqual([0, 0, 0], sut.cyclicRotation([0, 0, 0], 1))
        XCTAssertEqual([1, 2, 3, 4], sut.cyclicRotation([1, 2, 3, 4], 12))
        XCTAssertEqual([], sut.cyclicRotation([], 3))
    }
    
    func test_oddOccurrencesInArray() {
        XCTAssertEqual(7, sut.oddOccurrencesInArray([9, 3, 9, 3, 9, 7, 9]))
    }
    
    func test_frogJmp() {
        XCTAssertEqual(3, sut.frogJmp(10, 85, 30))
    }
    
    func test_permMissingElem() {
        XCTAssertEqual(4, sut.permMissingElem([2, 3, 1, 5]))
    }
    
    func test_tapeEquilibrium() {
        XCTAssertEqual(1, sut.tapeEquilibrium([3, 1, 2, 4, 3]))
        XCTAssertEqual(2000, sut.tapeEquilibrium([-1000, 1000]))
    }
    
    func test_frogRiverOne() {
        XCTAssertEqual(6, sut.frogRiverOne(5, [1, 3, 1, 4, 2, 3, 5, 4]))
    }
    
    func test_maxCounters() {
        XCTAssertEqual([3, 2, 2, 4, 2], sut.maxCounters(5, [3, 4, 4, 6, 1, 4, 4]))
    }
    
    func test_missingInteger() {
        XCTAssertEqual(5, sut.missingInteger([1, 3, 6, 4, 1, 2]))
        XCTAssertEqual(4, sut.missingInteger([1, 2, 3]))
        XCTAssertEqual(1, sut.missingInteger([-1, -3]))
    }
    
    func test_permCheck() {
        XCTAssertEqual(1, sut.permCheck([4, 1, 3, 2]))
        XCTAssertEqual(0, sut.permCheck([4, 1, 3]))
        XCTAssertEqual(0, sut.permCheck([1, 1]))
    }
    
    func test_countDiv() {
        XCTAssertEqual(3, sut.countDiv(6, 11, 2))
        XCTAssertEqual(3, sut.countDiv(5, 11, 2))
        XCTAssertEqual(3, sut.countDiv(5, 10, 2))
        XCTAssertEqual(3, sut.countDiv(6, 10, 2))
        XCTAssertEqual(1, sut.countDiv(0, 0, 11))
        XCTAssertEqual(1, sut.countDiv(0, 1, 11))
    }
    
    func test_genomicRangeQuery() {
        XCTAssertEqual([2, 4, 1], sut.genomicRangeQuery("CAGCCTA", [2, 5, 0], [4, 5, 6]))
        XCTAssertEqual([1, 1, 2], sut.genomicRangeQuery("AC", [0, 0, 1], [0, 1, 1]))
    }
    
    func test_minAvgTwoSlice() {
        XCTAssertEqual(0, sut.minAvgTwoSlice([2, 4]))
        XCTAssertEqual(0, sut.minAvgTwoSlice([2, 2, 2]))
        XCTAssertEqual(1, sut.minAvgTwoSlice([2, 4, -10]))
        XCTAssertEqual(1, sut.minAvgTwoSlice([4, 2, 2, 5, 1, 5, 8]))
        XCTAssertEqual(3, sut.minAvgTwoSlice([10, 10, 10, 3, 9, 2]))
        XCTAssertEqual(3, sut.minAvgTwoSlice([10, 10, 10, 3, 9, 2, 2000]))
        XCTAssertEqual(2, sut.minAvgTwoSlice([-10, 15, -20, 0, 30, 1, 20]))
        XCTAssertEqual(9, sut.minAvgTwoSlice([2, 2, 2, 2, 2, 2, 2, 2, 2, 2, -1]))
        XCTAssertEqual(0, sut.minAvgTwoSlice([-10, -10, -10, -1]))
    }
    
    func test_passingCar() {
        XCTAssertEqual(5, sut.passingCar([0, 1, 0, 1, 1]))
    }
    
    func test_distinct() {
        XCTAssertEqual(3, sut.distinct([2, 1, 1, 2, 3, 1]))
    }
    
    func test_maxProductOfThree() {
        XCTAssertEqual(60, sut.maxProductOfThree([-3, 1, 2, -2, 5, 6]))
        XCTAssertEqual(48000, sut.maxProductOfThree([-200, -40, 2, -2, 5, 6]))
        XCTAssertEqual(1200, sut.maxProductOfThree([-200, 40, 2, 2, 5, 6]))
        XCTAssertEqual(0, sut.maxProductOfThree([200, 0, 4]))
        XCTAssertEqual(-80, sut.maxProductOfThree([-10, -2, -4]))
    }
    
    func test_numberOfDiscInterections() {
        XCTAssertEqual(11, sut.numberOfDiscInterections([1, 5, 2, 1, 4, 0]))
    }
}
