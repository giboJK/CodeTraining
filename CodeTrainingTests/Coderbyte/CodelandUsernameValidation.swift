//
//  CodelandUsernameValidation.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/20.
//

import XCTest

class CodelandUsernameValidation: XCTestCase {

    func test() {
        var str: String
        str = "aa_"
        XCTAssertEqual("false", CodelandUsernameValidation(str))
        
        str = "u__hello_world123"
        XCTAssertEqual("true", CodelandUsernameValidation(str))
        
        str = "__hello_world123"
        XCTAssertEqual("false", CodelandUsernameValidation(str))
        
        str = "asds*a"
        XCTAssertEqual("false", CodelandUsernameValidation(str))
        
        str = "asdasd_"
        XCTAssertEqual("false", CodelandUsernameValidation(str))
    }
    
    func CodelandUsernameValidation(_ str: String) -> String {
        // code goes here
        if str.count > 25 || str.count < 4 {
            return "false"
        }
        
        if !(str.first?.isLetter ?? false) {
            return "false"
        }
        
        for (_, c) in str.enumerated() {
            if !c.isLetter,
               !c.isNumber,
               c != "_" {
                return "false"
            }
        }
        
        if str.last == "_" {
            return "false"
        }
        
        return "true"
    }
}
