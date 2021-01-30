//
//  BiggestNumber.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/30.
//

import XCTest

class BiggestNumber: XCTestCase {
    func test() {
        var numbers: [Int]
        
        numbers = [6, 10, 2]
        XCTAssertEqual("6210", solution(numbers))

        numbers = [1, 10, 100]
        XCTAssertEqual("110100", solution(numbers))

        numbers = [3, 30, 34, 5, 9]
        XCTAssertEqual("9534330", solution(numbers))

        numbers = [0, 0, 0, 0, 0]
        XCTAssertEqual("0", solution(numbers))

        numbers = [1, 0, 0, 0, 0]
        XCTAssertEqual("10000", solution(numbers))

        numbers = [9327, 909]
        XCTAssertEqual("9327909", solution(numbers))

        numbers = [9327, 9326]
        XCTAssertEqual("93279326", solution(numbers))
        
        numbers = [121, 12]
        XCTAssertEqual("12121", solution(numbers))
    }
    
    func solution(_ numbers:[Int]) -> String {
        let sorted = numbers.sorted {
            let aStr = String($0)
            let bStr = String($1)
            
            return aStr + bStr > bStr + aStr
        }
        
        return sorted[0] == 0 ? "0" : sorted.map{ String($0) }.joined()
//        return sorted[0] == 0 ? "0" : sorted.reduce(""){$0 + "\($1)"}
    }
}
