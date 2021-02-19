//
//  Printer.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/02/19.
//

import XCTest

class Printer: XCTestCase {
    
    func test() {
        var priorities: [Int]
        var location: Int
        
        priorities = [1]
        location = 0
        XCTAssertEqual(1, solution(priorities, location))

        priorities = [1, 1, 9]
        location = 2
        XCTAssertEqual(1, solution(priorities, location))

        priorities = [3, 3, 3, 3, 3, 3]
        location = 3
        XCTAssertEqual(4, solution(priorities, location))
       
       priorities = [1, 1, 6, 2, 3, 2]
       location = 3
       XCTAssertEqual(4, solution(priorities, location))
        
        /*
         [1, 9, '1', 6, 1, 4, 1, 8, 1]
         [9, '1', 6, 1, 4, 1, 8, 1, 1]
         ['1', 6, 1, 4, 1, 8, 1, 1] -> 9
         [6, 1, 4, 1, 8, 1, 1, '1']
         [1, 4, 1, 8, 1, 1, '1', 6]
         [4, 1, 8, 1, 1, '1', 6, 1]
         [1, 8, 1, 1, '1', 6, 1, 4]
         [8, 1, 1, '1', 6, 1, 4, 1]
         [1, 1, '1', 6, 1, 4, 1] -> 8
         [6, 1, 4, 1, 1, 1, '1']
         [1, 4, 1, 1, 1, '1'] -> 6
         [4, 1, 1, 1, '1', 1]
         [1, 1, 1, '1', 1] -> 4
         9 - 8 - 6 - 4 - 1 - 1 - 1 - '1'
         */
        priorities = [1, 9, 1, 6, 1, 4, 1, 8, 1]
        location = 2
        XCTAssertEqual(8, solution(priorities, location))
    }
    
    func solution(_ priorities: [Int], _ location: Int) -> Int {
        var dict = [Int: Int]()
        var count = 0
        var curlocation = location
        
        priorities.forEach { p in
            dict.updateValue((dict[p] ?? 0) + 1, forKey: p)
        }
        
        var keys = Array(dict.keys)
        keys.sort(by: >)
        var temp = priorities
        
        while !temp.isEmpty {
            if temp.first! == keys.first! {
                temp.removeFirst()
                count += 1
                curlocation -= 1
                if curlocation == -1 {
                    break
                }
                dict.updateValue((dict[keys.first!] ?? 0) - 1, forKey: keys.first!)
                if dict[keys.first!] == 0 {
                    keys.removeFirst()
                }
            } else {
                temp.append(temp.removeFirst())
                curlocation -= 1
                if curlocation == -1 {
                    curlocation = temp.count - 1
                }
            }
        }
        
        return count
    }
}
