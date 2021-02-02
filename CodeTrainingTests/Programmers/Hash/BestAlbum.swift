//
//  BestAlbum.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/31.
//

import XCTest

class BestAlbum: XCTestCase {
    
    func test() {
        var genres: [String]
        var plays: [Int]
        
        genres = ["classic", "pop", "classic", "classic", "pop"]
        plays = [500, 600, 150, 800, 2500]
        XCTAssertEqual([4, 1, 3, 0], solution(genres, plays))
        
        genres = ["classic", "pop", "classic", "classic", "pop", "pop", "pop"]
        plays = [500, 2500, 150, 800, 2500, 100, 100]
        XCTAssertEqual([1, 4, 3, 0], solution(genres, plays))
        
        genres = ["classic", "pop", "classic", "classic", "pop", "pop", "jazz"]
        plays = [500, 2500, 150, 800, 2500, 100, 100, 50]
        XCTAssertEqual([1, 4, 3, 0, 6], solution(genres, plays))
    }

    func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
        var map = [String: Int]()
        var topTwo = [String: [Int]]()
        var ans: [Int] = []
        
        for i in 0 ..< genres.count {
            map.updateValue((map[genres[i]] ?? 0) + plays[i], forKey: genres[i])
            if topTwo.contains(where: { return $0.0 == genres[i] }) {
                if var playCount = topTwo[genres[i]] {
                    if playCount.count < 2 {
                        playCount.append(plays[i])
                        playCount.sort(by: >)
                    } else {
                        if playCount[1] < plays[i] {
                            playCount.removeLast()
                            playCount.append(plays[i])
                            playCount.sort(by: >)
                        }
                    }
                    topTwo.updateValue(playCount, forKey: genres[i])
                }
            } else {
                topTwo.updateValue([plays[i]], forKey: genres[i])
            }
        }
        let sorted = map.sorted { $0.value > $1.value }
        
        sorted.forEach { info in
            let playCount = topTwo[info.key]!
            var order = 0
            var i = 0
            while i < genres.count {
                if genres[i] == info.key, plays[i] == playCount[order] {
                    ans.append(i)
                    order += 1
                    if playCount.count < 2{
                        i = genres.count
                    } else if order == 2 {
                        i = genres.count
                    } else if playCount[0] != playCount[1] {
                        i = -1
                    }
                }
                i += 1
            }
        }
        
        return ans
    }
}
