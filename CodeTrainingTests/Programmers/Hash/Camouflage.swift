//
//  Camouflage.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/31.
//

import XCTest

class Camouflage: XCTestCase {

    func test() {
        var clothes: [[String]]
        
        clothes = [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]
        XCTAssertEqual(5, solution(clothes))
    }
    
    
    func solution(_ clothes:[[String]]) -> Int {
        var map = [String: Int]()
        clothes.forEach { item in
            map.updateValue((map[item[1]] ?? 1) + 1, forKey: item[1])
        }
        
        let ans = map.values.reduce(1) { $0 * $1 }
        
        return ans - 1
    }
}
