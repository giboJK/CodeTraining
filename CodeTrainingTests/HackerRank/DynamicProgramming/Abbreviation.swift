//
//  Abbreviation.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/21.
//

import XCTest

class Abbreviation: XCTestCase {
    
    func test() {
        var a: String
        var b: String
        a = "daBcd"
        b = "ABC"
        XCTAssertEqual("YES", abbreviation(a: a, b: b))
        
        a = "AbcDE"
        b = "AFDE"
        XCTAssertEqual("NO", abbreviation(a: a, b: b))
        
        a = "KXzQ"
        b = "K"
        XCTAssertEqual("NO", abbreviation(a: a, b: b))
        
        a = "AbCdE"
        b = "AFE"
        XCTAssertEqual("NO", abbreviation(a: a, b: b))
        
        a = "beFgH"
        b = "EFG"
        XCTAssertEqual("NO", abbreviation(a: a, b: b))
        
        a = "beFgH"
        b = "EFH"
        XCTAssertEqual("YES", abbreviation(a: a, b: b))
    }

    func abbreviation(a: String, b: String) -> String {
        var posA = 0
        let upperA = a.uppercased()
        var hasCharacter = false
        
        for i in 0 ..< b.count {
            let indexB = b.index(b.startIndex, offsetBy: i)
            hasCharacter = false
            for j in posA ..< upperA.count {
                let indexA = upperA.index(upperA.startIndex, offsetBy: j)
                if upperA[indexA] == b[indexB] {
                    posA = j + 1
                    hasCharacter = true
                    break
                }
            }
            
            if !hasCharacter { return "NO" }
        }
        
        return "YES"
    }
}
