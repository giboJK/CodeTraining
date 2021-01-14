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
        
    }
    
    func sherlockAndAnagrams() {
        
    }
}
