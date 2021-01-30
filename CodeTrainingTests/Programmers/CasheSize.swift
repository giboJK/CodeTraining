//
//  CasheSize.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/30.
//

import XCTest

class CasheSize: XCTestCase {
    func test() {
        var cacheSize: Int
        var cities: [String]
        
        cacheSize = 3
        cities = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]
        XCTAssertEqual(50, solution(cacheSize, cities))
        
    }
    
    
    func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
        var cache = [String]()
        var ans = 0
        
        for i in 0 ..< cities.count {
            let city = cities[i].lowercased()
            if !cache.contains(city) {
                if cache.count < cacheSize {
                    cache.append(city)
                } else if cacheSize > 0 {
                    cache.removeFirst()
                    cache.append(city)
                }
                ans += 5
            } else {
                cache.remove(at: cache.firstIndex(of: city)!) 
                cache.append(city)
                ans += 1
            }
        }
        
        return ans
    }
}
