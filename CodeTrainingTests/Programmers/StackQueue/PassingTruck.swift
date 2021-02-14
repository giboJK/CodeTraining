//
//  PassingTruck.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/02/14.
//

import XCTest

class PassingTruck: XCTestCase {

    func test() {
        var bridge_length: Int
        var weight: Int
        var truck_weights: [Int]
        
        bridge_length = 2
        weight = 10
        truck_weights = [7, 4, 5, 6]
        XCTAssertEqual(8, solution(bridge_length, weight, truck_weights))
        
        bridge_length = 100
        weight = 100
        truck_weights = [10]
        XCTAssertEqual(101, solution(bridge_length, weight, truck_weights))
    }
    
    func test_speed() {
        let bridge_length: Int = 100
        let weight: Int = 5_000
        var truck_weights = [Int]()
        
        let range = 1...weight
        for _ in 0 ..< 10_000 {
            truck_weights.append(Int.random(in: range))
        }
        
        measure {
            _ = solution(bridge_length, weight, truck_weights)
        }
        
    }
    
    func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
        var ans = bridge_length
        var passing = [Int]()
        var currentWeight = 0
        
        for (_, truck) in truck_weights.enumerated() {
            if currentWeight + truck > weight {
                var passedCarCount = 0
                while currentWeight + truck > weight {
                    currentWeight -= passing.removeFirst()
                    passedCarCount += 1
                }
                ans += bridge_length - passing.count
                    
//                    if passing.count == bridge_length {
//                        currentWeight -= passing.removeFirst()
//                    } else {
//                        passing.append(0)
//                        ans += 1
//                    }
            }
            if passing.count == bridge_length {
                currentWeight -= passing.removeFirst()
            }
            
            passing.append(truck)
            currentWeight += truck
            ans += 1
        }
        
        return ans
    }
}
