//
//  LuckBalance.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/24.
//

import XCTest

class LuckBalance: XCTestCase {
    
    func test() {
        var k: Int
        var contests: [[Int]]
        
//        k = 1
//        contests = [[5, 1], [1, 1], [4, 0]]
//        XCTAssertEqual(8, luckBalance(k: k, contests: contests))
        
        k = 3
        contests = [[5, 1], [2, 1], [1, 1], [8, 1], [10, 0], [5, 0]]
        XCTAssertEqual(29, luckBalance(k: k, contests: contests))
    }
    
    func luckBalance(k: Int, contests: [[Int]]) -> Int {
        var luck = 0
        var importants = [[Int]]()
        
        contests.forEach { contest in
            if contest[1] == 1 {
                importants.append(contest)
            } else {
                luck += contest[0]
            }
        }
        
        importants.sort { return $0[0] < $1[0] }
        for i in 0 ..< importants.count {
            if i < importants.count - k {
                luck -= importants[i][0]
            } else {
                luck += importants[i][0]
            }
        }
        
        return luck
    }
}
