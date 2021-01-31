//
//  Joystick.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/31.
//

import XCTest

class Joystick: XCTestCase {
    
    func test() {
        var name: String
        
        name = "JEROEN"
        XCTAssertEqual(56, solution(name))
        
        name = "JAN"
        XCTAssertEqual(23, solution(name))
        
        name = "JBZ"
        XCTAssertEqual(13, solution(name))
        
        name = "JAAAAZ"
        XCTAssertEqual(11, solution(name))
        
        name = "JBAAAAAAAAZ"
        XCTAssertEqual(14, solution(name))
        
        name = "JBAAAAAAAAACAAZ"
        XCTAssertEqual(19, solution(name))
    }
    
    func solution(_ name:String) -> Int {
        var ans = 0
        var checked = [Bool](repeating: false, count: name.count)
        
        name.forEach { c in
            if c < Character("N") {
                ans += Int(c.asciiValue!) - Int(Character("A").asciiValue!)
            } else {
                ans += Int(Character("Z").asciiValue!) - Int(c.asciiValue!) + 1
            }
        }
        
        for i in 0 ..< name.count {
            if
        }
        
        return ans
    }
}
