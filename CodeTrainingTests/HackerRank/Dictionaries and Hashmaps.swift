//
//  DictionariesAndHashmaps.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/14.
//

import XCTest

class DictionariesAndHashmaps: XCTestCase {
    func test_checkMagazine() {
        var magazine: [String]
        var note: [String]
        
        magazine = ["two", "times", "three", "is", "not", "four"]
        note = ["two", "times", "two", "is", "four"]
        XCTAssertEqual("No", checkMagazine(magazine: magazine, note: note))
    }
    
    func checkMagazine(magazine: [String], note: [String]) -> String {
        var ransomHash = [String: Int]()
        
        magazine.forEach { word in
            if ransomHash[word] != nil {
                ransomHash.updateValue(ransomHash[word]! + 1, forKey: word)
            } else {
                ransomHash.updateValue(1, forKey: word)
            }
        }
        
        for i in 0 ..< note.count {
            let word = note[i]
            if let count = ransomHash[word],
               count > 0 {
                ransomHash.updateValue(count - 1, forKey: word)
            } else {
                return "No"
            }
        }
        return "Yes"
    }
    
    // Sherlock and Anagrams
    
    func test_sherlockAndAnagrams() {
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
