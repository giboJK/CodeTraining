//
//  NextBigNumber.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/30.
//

import XCTest

class NextBigNumber: XCTestCase {
    func test() {
        XCTAssertEqual(23, solution(15))
    }
    
    func solution(_ n: Int) -> Int {
        var answer : Int = n + 1

        while true {
            if n.nonzeroBitCount == answer.nonzeroBitCount {
                break;
            }
            answer += 1
        }

        return answer
    }
    
    
//    func solution(_ n:Int) -> Int
//    {
//        var answer: Int = 0
//        var bStr = String(n, radix:2)
//        var ones = 0
//        bStr.forEach { c in
//            if c == Character("1") {
//                ones += 1
//            }
//        }
//        var startNum = 0
//        for i in stride(from: bStr.count - 1, through: 0, by: -1) {
//            let c = bStr[bStr.index(bStr.startIndex, offsetBy: i)]
//            if c == Character("1") {
//                startNum = n + max(1, 2 * (bStr.count - i - 1))
//                break
//            }
//        }
//
//        for i in startNum ..< 1_000_000 {
//            let str = String(i, radix:2)
//            var count = 0
//            str.forEach { c in
//                if c == Character("1") {
//                    count += 1
//                }
//            }
//            if ones == count {
//                return i
//            }
//        }
//
//        return answer
//    }
}
