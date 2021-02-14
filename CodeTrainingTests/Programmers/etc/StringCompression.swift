//
//  StringCompression.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/02/07.
//

import XCTest

class StringCompression: XCTestCase {
    func test() {
        var s: String
        
        s = "aabbaccc"
        XCTAssertEqual(7, solution(s))
        
        s = "ababcdcdababcdcd"
        XCTAssertEqual(9, solution(s))
        
        s = "abcabcdede"
        XCTAssertEqual(8, solution(s))
        
        s = "abcabcabcabcdededededede"
        XCTAssertEqual(14, solution(s))
        
        s = "xababcdcdababcdcd"
        XCTAssertEqual(17, solution(s))
    }

    func solution(_ s: String) -> Int {
        return 0
    }
}
