//
//  FineSquare.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/02/04.
//

import XCTest

class FineSquare: XCTestCase {
    func test() {
        var w: Int
        var h: Int
        
        w = 8
        h = 12
        XCTAssertEqual(80, solution(w, h))
        
        w = 4
        h = 4
        XCTAssertEqual(12, solution(w, h))
        
        w = 3
        h = 11
        XCTAssertEqual(20, solution(w, h))
    }
    
//    func solution(_ w: Int, _ h: Int) -> Int64 {
//        var ans: Int64 = 0
//        let h64 = Int64(h)
//        let w64 = Int64(w)
//        for i in 0 ..< w {
//            ans += h64 * Int64(i) / w64
//        }
//
//        return ans * 2
//    }
    
    func binaryGcd(_ a: Int, _ b: Int, _ res: Int = 1) -> Int {
        if a == b {
            return res * a
        } else if a % 2 == 0,
                  b % 2 == 0 {
            return binaryGcd(a / 2, b / 2, 2 * res)
        } else if a % 2 == 0 {
            return binaryGcd(a / 2, b, res)
        } else if b % 2 == 0 {
            return binaryGcd(a, b / 2, res)
        } else if a > b {
            return binaryGcd(a - b, b, res)
        } else {
            return binaryGcd(a, b - a, res)
        }
    }
    
    func solution(_ w:Int, _ h:Int) -> Int64{
        let w64: Int64 = Int64(w)
        let h64: Int64 = Int64(h)
        return w64 * h64 - w64 - h64 + Int64(binaryGcd(w, h))
    }
}
