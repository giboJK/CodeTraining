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
        
        name = "A"
        XCTAssertEqual(0, solution(name))
        
        name = "AA"
        XCTAssertEqual(0, solution(name))
    }
    
    func solution(_ name:String) -> Int {
        var ans = 0
        var notA = [Int]()
        
        for i in 0 ..< name.count {
            let c = name[name.index(name.startIndex, offsetBy: i)]
            if c < Character("N") {
                ans += Int(c.asciiValue!) - Int(Character("A").asciiValue!)
            } else {
                ans += Int(Character("Z").asciiValue!) - Int(c.asciiValue!) + 1
            }
            
            if c != Character("A") { notA.append(i) }
        }
        
        if !notA.isEmpty, notA[0] != 0 {
            notA.insert(0, at: 0)
        }
        
        while notA.count >= 2 {
            let right = notA[1] - notA[0]
            let left = name.count - (notA.last! - notA[0])
            
            ans += min(left, right)
            notA.remove(at: 0)
        }
        
        let info = [String]()
        let query = "s asd as"
        
        let conditions = query.split(separator: " ")
        var ansbb = [Int]()
        
        for i in 0 ..< query.count {
            let conditions = query.split(separator: " ")
            let languagePasser = info.filter { $0.contains(String(conditions[0])) }
            let partPasser = languagePasser.filter { $0.contains(String(conditions[2])) }
            let careerPasser = partPasser.filter { $0.contains(String(conditions[4])) }
            let soulPasser = careerPasser.filter { $0.contains(String(conditions[6])) }
            var pointPasser = 0
            
            let passPoint = Int(conditions[0])!
            for (i, passer) in soulPasser.enumerated() {
                let point = Int(passer.split(separator: " ").last!)!
                if point > passPoint {
                    pointPasser += 1
                }
            }
            
            ansbb.append(pointPasser)
        }
        return ans
    }
}
