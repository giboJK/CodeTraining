//
//  FraudulentActivtyNotifications.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/21.
//

import XCTest

class FraudulentActivtyNotifications: XCTestCase {
    
    func test() {
        var expenditure: [Int]
        var d: Int
        
        expenditure = [10, 20, 30, 40, 50]
        d = 3
        XCTAssertEqual(1, activityNotifications(expenditure: expenditure, d: d))
        
        expenditure = [2, 3, 4, 2, 3, 6, 8, 4, 5]
        d = 5
        XCTAssertEqual(2, activityNotifications(expenditure: expenditure, d: d))
    }
    
    func test_big() {
        if let (expenditure, d) = fileRead(fileName: "fraud1") {
            XCTAssertEqual(633, activityNotifications(expenditure: expenditure, d: d))
        }
    }
    
    func test_speed() {
        var expenditure = [Int]()
        let d: Int = 100
        
        for _ in 0 ..< 20_000 {
            expenditure.append(Int.random(in: 0..<200))
        }
        
        measure {
            _ = activityNotifications(expenditure: expenditure, d: d)
        }
    }
    
    
    func activityNotifications(expenditure: [Int], d: Int) -> Int {
        var notifications = 0
        var slice = expenditure.prefix(d)
        var median = 0
        
        
        for i in d ..< expenditure.count {
            if d % 2 == 0 {
            } else {
            }
            
            _ = slice.removeFirst()
            slice.append(expenditure[i])
        }
        
        return notifications
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
}
