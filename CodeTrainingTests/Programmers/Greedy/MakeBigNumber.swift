//
//  MakeBigNumber.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/31.
//

import XCTest

class MakeBigNumber: XCTestCase {
    
    func test() {
        var number: String
        var k: Int
        
        number = "1924"
        k = 2
        XCTAssertEqual("94", solution(number, k))
        
        number = "1231234"
        k = 3
        XCTAssertEqual("3234", solution(number, k))
        
        number = "4177252841"
        k = 4
        XCTAssertEqual("775841", solution(number, k))
        
        number = "4177252841"
        k = 7
        XCTAssertEqual("841", solution(number, k))
        
        number = "99991"
        k = 3
        XCTAssertEqual("99", solution(number, k))
    }
    
    func solution(_ number:String, _ k:Int) -> String {
        let map = number.map{String($0)}
        var stack = [String]()
        var count = 0
        
        for i in 0 ..< map.count {
            if stack.isEmpty {
                stack.append(map[i])
            } else {
                while !stack.isEmpty, stack.last! < map[i] {
                    stack.removeLast()
                    count += 1
                    if count == k {
                        stack.append(contentsOf: map[i...])
                        return stack.joined()
                    }
                }
                stack.append(map[i])
            }
        }
        
        return stack.prefix(stack.count - k + count).joined()
    }
    
//    func solution(_ number: String, _ k: Int) -> String {
//        var result: [Int] = []
//        var count: Int = 0
//
//        Array(number).compactMap { Int(String($0)) }.forEach { item in
//            while count < k {
//                if let last = result.last, last < item {
//                    result.popLast()
//                    count += 1
//                } else {
//                    break
//                }
//            }
//            result.append(item)
//        }
//
//        return result[0..<(result.count - k + count)].map { "\($0)" }.joined()
//    }
}
