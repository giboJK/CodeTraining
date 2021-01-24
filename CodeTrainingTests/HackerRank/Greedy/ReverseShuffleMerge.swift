//
//  ReverseShuffleMerge.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/24.
//

import XCTest

class ReverseShuffleMerge: XCTestCase {

    func test() {
        var s: String
        s = "eggegg"
        XCTAssertEqual("egg", reverseShuffleMerge(s: s))
        s = "abcdefgabcdefg"
        XCTAssertEqual("agfedcb", reverseShuffleMerge(s: s))
        s = "aeiouuoiea"
        XCTAssertEqual("aeiou", reverseShuffleMerge(s: s))
        s = "bdabaceadaedaaaeaecdeadababdbeaeeacacaba"
        XCTAssertEqual("aaaaaabaaceededecbdb", reverseShuffleMerge(s: s))
    }
    
    func reverseShuffleMerge(s: String) -> String {
        var map = [Character: Int]()
        s.forEach { c in
            map.updateValue((map[c] ?? 0) + 1, forKey: c)
        }
        
        let sorted = map.sorted { return $0.key < $1.key }
        
        var smallest = ""
        for (_, dict) in sorted.enumerated() {
            for _ in 0 ..< dict.value / 2 {
                smallest.append(dict.key)
            }
        }

        return smallest
    }
}
