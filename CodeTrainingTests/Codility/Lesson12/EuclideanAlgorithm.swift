//
//  EuclideanAlgorithm.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2020/12/24.
//

import XCTest
@testable import CodeTraining

// https://codility.com/media/train/10-Gcd.pdf

class EuclideanAlgorithm: XCTestCase {
    var sut: Codility!
    
    override func setUp() {
        super.setUp()
        sut = Codility()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_gcd() {
        XCTAssertEqual(12, sut.binaryGcd(36, 24))
    }
    
    func test_lcm() {
        XCTAssertEqual(72, sut.lcm(36, 24))
    }
}
