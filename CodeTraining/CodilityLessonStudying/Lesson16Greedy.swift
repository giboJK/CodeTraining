//
//  Lesson16Greedy.swift
//  CodeTraining
//
//  Created by 정김기보 on 2021/01/10.
//

import Foundation
/*
 https://codility.com/media/train/14-GreedyAlgorithms.pdf
 */

extension Codility {
    func greedyCoinChanging(coins: inout [Int], money: inout Int) -> [Int] {
        var ans = [Int]()
        coins.sort()
        coins.reverse()
        
        coins.forEach { coin in
            ans.append(money / coin)
            money %= coin
        }
        return ans
    }
    
    
}
