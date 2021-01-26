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
    
//    func reverseShuffleMerge(s: String) -> String {
//        var map = [Character: Int]()
//        s.forEach { c in
//            map.updateValue((map[c] ?? 0) + 1, forKey: c)
//        }
//
//        let sorted = map.sorted { return $0.key < $1.key }
//
//        var smallest = ""
//        for (_, dict) in sorted.enumerated() {
//            for _ in 0 ..< dict.value / 2 {
//                smallest.append(dict.key)
//            }
//        }
//
//
//        return smallest
//    }
    
    func reverseShuffleMerge(s: String) -> String {
        let n = s.count
        var j = 0
        var wrdCount = [Character: Int]()
        var solCount = [Character: Int]()
        var remCount = [Character: Int]()
        var sol = [Character?](repeating: nil, count: 26) // number of alphabet?
        
        s.forEach { c in
            wrdCount.updateValue((wrdCount[c] ?? 0) + 1, forKey: c)
            remCount.updateValue((wrdCount[c] ?? 0) + 1, forKey: c)
        }

        for (_, count) in wrdCount.enumerated() {
            wrdCount.updateValue(count.value / 2, forKey: count.key)
        }

        var char: Character

        for i in stride(from: n - 1, through: 0, by: -1) {
            char = s[i]
            if i == (n - 1) {
                sol[j] = char
                j += 1
                wrdCount.updateValue(wrdCount[char]! - 1, forKey: char)
                solCount.updateValue((solCount[char] ?? 0) + 1, forKey: char)
                continue
            }

            if solCount[char]! < wrdCount[char]! {

                if char >= sol[j - 1]! {
                    sol[j] = char
                    j += 1
                    remCount.updateValue((solCount[char] ?? 0) - 1, forKey: char)
                    solCount.updateValue((solCount[char] ?? 0) + 1, forKey: char)
                }else{
                    while j > 0,
                          char < sol[j-1]!,
                          solCount[sol[j-1]!]!-1 + remCount[sol[j-1]!]! >= wrdCount[sol[j-1]!]! {
                        j -= 1
                        solCount.updateValue(solCount[sol[j]!]! - 1, forKey: sol[j]!)
                    }
                    sol[j] = char
                    j += 1
                    remCount.updateValue((solCount[char] ?? 0) - 1, forKey: char)
                    solCount.updateValue((solCount[char] ?? 0) + 1, forKey: char)
                }

            }else{
                remCount.updateValue((solCount[char] ?? 0) - 1, forKey: char)
            }

        }

        var ans = ""
        sol.forEach { c in
            if let char = c {
                ans += String(char)
            }
        }
        return ans
    }

}
