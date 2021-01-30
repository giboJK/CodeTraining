//
//  ReverseShuffleMerge.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/24.
//

import XCTest
@testable import CodeTraining

class ReverseShuffleMerge: XCTestCase {

    func test() {
        print(pow(2, 3))
        var s: String
        s = "cbabac"
        XCTAssertEqual("abc", reverseShuffleMerge(s: s))
        s = "eggegg"
        XCTAssertEqual("egg", reverseShuffleMerge(s: s))
        s = "abcdefgabcdefg"
        XCTAssertEqual("agfedcb", reverseShuffleMerge(s: s))
        s = "aeiouuoiea"
        XCTAssertEqual("aeiou", reverseShuffleMerge(s: s))
        s = "bdabaceadaedaaaeaecdeadababdbeaeeacacaba"
        XCTAssertEqual("aaaaaabaaceededecbdb", reverseShuffleMerge(s: s))
    }
    
    func test_speed() {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        let s = String((0..<5_000).map{ _ in letters.randomElement()! })
        print(s)
        measure {
            _ = reverseShuffleMerge(s: s)
        }
    }
    
    func reverseShuffleMerge(s: String) -> String {
        var countMap = [Character: Int]()
        var requiredMap = [Character: Int]()
        var usedMap = [Character: Int]()
        var charPosition = [[Int]](repeating: [], count: 26)
        var ans = ""
        
        s.forEach { c in
            countMap.updateValue((countMap[c] ?? 0) + 1, forKey: c)
        }
        
        
        let sorted = usedMap.sorted { return $0.key < $1.key }
        for (_, count) in countMap.enumerated() {
            usedMap.updateValue(0, forKey: count.key)
            requiredMap.updateValue(count.value / 2, forKey: count.key)
        }
        
        for i in stride(from: s.count - 1, through: 0, by: -1) {
            let c = s[s.index(s.startIndex, offsetBy: i)]
            
            if usedMap[c]! >= requiredMap[c]! {
                countMap.updateValue(countMap[c]! - 1, forKey: c)
                continue
            }
//            var j = ans.count - 1
//            var last = Character("}")
//            while j >= 0, last > c {
//                last = ans[ans.index(ans.startIndex, offsetBy: j)]
//                if last > c {
//                    if countMap[last]! > requiredMap[last]! - usedMap[last]! {
//                        usedMap.updateValue(usedMap[last]! - 1, forKey: last)
//                        _ = ans.removeLast()
//                    }
//                }
//                j -= 1
//            }
            
            for i in Int(c.asciiValue!) - 97 ..< 26 {
                
            }
            
            ans.append(c)
            charPosition[Int(c.asciiValue!) - 97].append(ans.count - 1)
            usedMap.updateValue(usedMap[c]! + 1, forKey: c)
            countMap.updateValue(countMap[c]! - 1, forKey: c)
        }
        
        return ans
    }
}
