//
//  DictionariesAndHashmaps.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/14.
//

import XCTest
@testable import CodeTraining

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
    
    func test_countTriplets() {
        var arr: [Int]
        var r: Int
        
        arr = [1, 2, 2, 4]
        r = 2
        XCTAssertEqual(2, countTriplets(arr: arr, r: r))
        
        arr = [1, 3, 9, 9, 27, 81]
        r = 3
        XCTAssertEqual(6, countTriplets(arr: arr, r: r))
        
        arr = [1, 1, 1, 1]
        r = 1
        XCTAssertEqual(4, countTriplets(arr: arr, r: r))
    }
    
    func fileRead(fileName: String) -> ([Int], Int)? {
        let testBundle = Bundle(for: type(of: self))
        if let filepath = testBundle.path(forResource: fileName, ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                let strings = contents.components(separatedBy: .newlines)
                let nr = strings[0].split(separator: " ").map { String($0) }
                guard let size = nr.first else { fatalError("Error - 1") }
                guard let r = nr.last else { fatalError("Error - 2") }
                
                print(size, r)
                let arr: [Int] = strings[1].split(separator: " ").map {
                    if let arrItem = Int($0) {
                        return arrItem
                    } else {
                        fatalError("Bad input")
                    }
                }
                
                guard arr.count == Int(size) else { fatalError("Bad input") }
                return (arr, Int(r)!)
            } catch {
                print("Error: contents could not be loaded")
                return nil
            }
        } else {
            print("Error: not found!")
            return nil
        }
    }
    
    func test_fileRead() {
        if let data = fileRead(fileName: "countTripletsSmall") {
            XCTAssertEqual(2, countTriplets(arr: data.0, r: data.1))
        }
    }
    
    func test_countTriplets_big_number() {
        if let data = fileRead(fileName: "countTriplets") {
            XCTAssertEqual(2325652489, countTriplets(arr: data.0, r: data.1))
        }
    }
    
    func countTriplets(arr: [Int], r: Int) -> Int {
        var ans = 0
        var elements = [Int: Int]()
        
        arr.forEach { v in
            if let count = elements[v] {
                elements.updateValue(count + 1, forKey: v)
            } else {
                elements.updateValue(1, forKey: v)
            }
        }
        
        if r == 1 {
            for (_, v) in elements.enumerated() {
                ans += (v.value * (v.value - 1) * (v.value - 2) / 6)
            }
        } else {
            for (_, v) in elements.enumerated() {
                if let r1 = elements[v.key * r],
                   let r2 = elements[v.key * r * r] {
                    ans += (v.value * r1 * r2)
                }
            }
        }
        
        return ans
    }
}
