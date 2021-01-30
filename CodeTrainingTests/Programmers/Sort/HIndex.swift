//
//  HIndex.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/30.
//

import XCTest

class HIndex: XCTestCase {
    
    func test() {
        var citations: [Int]
        
        citations = [3, 0, 6, 1, 5]
        XCTAssertEqual(3, solution(citations))
        
        citations = [100, 10]
        XCTAssertEqual(2, solution(citations))
    }
    
    func solution(_ citations:[Int]) -> Int {
        let sorted = citations.sorted(by: >)
        
        for i in 0 ..< sorted.count {
            if sorted[i] <= i {
                return i
            }
        }
        return sorted.count
    }
}
