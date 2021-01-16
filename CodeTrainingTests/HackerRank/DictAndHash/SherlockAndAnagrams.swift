//
//  SherlockAndAnagrams.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/14.
//

import XCTest

class SherlockAndAnagrams: XCTestCase {
    // Sherlock and Anagrams
    
    func test() {
        var s: String
        s = "abba"
        XCTAssertEqual(4, sherlockAndAnagrams(s: s))

        s = "abcd"
        XCTAssertEqual(0, sherlockAndAnagrams(s: s))

        s = "cdcd"
        XCTAssertEqual(5, sherlockAndAnagrams(s: s))
    }
    
    func sherlockAndAnagrams(s: String) -> Int {
        var ans = 0
        var subStrings = [[Character]: Int]()
        
        for i in 0 ..< s.count {
            for j in i ..< s.count {
                let startIndex = s.index(s.startIndex, offsetBy: i)
                let endIndex = s.index(startIndex, offsetBy: j - i + 1)
                let chars = s[startIndex..<endIndex].sorted()
                
                if let count = subStrings[chars] {
                    subStrings.updateValue(count + 1, forKey: chars)
                } else {
                    subStrings.updateValue(1, forKey: chars)
                }
            }
        }
        
        subStrings.values.forEach { v in
            ans += v * (v - 1) / 2
        }

        return ans
    }
}
