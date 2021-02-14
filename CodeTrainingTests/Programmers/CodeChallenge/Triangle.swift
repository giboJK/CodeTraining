//
//  Triangle.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/02/06.
//

import XCTest

class Triangle: XCTestCase {
    func test() {
        var n: Int
        
        n = 4
        XCTAssertEqual([1,2,9,3,10,8,4,5,6,7], solution(n))
        
        n = 5
        XCTAssertEqual([1,2,12,3,13,11,4,14,15,10,5,6,7,8,9], solution(n))
        
        n = 6
        XCTAssertEqual([1,2,15,3,16,14,4,17,21,13,5,18,19,20,12,6,7,8,9,10,11], solution(n))
    }
    
    
    func solution(_ n:Int) -> [Int] {
        var ans = [Int]()
        var triangle = [[Int]](repeating: [], count: n)
        var total = 0
        
        for i in 1 ... n { total += i }
        var arr = [Int](repeating: 0, count: total + 1)
        for i in 1 ... total {
            arr[i] = i
        }
        
        var direction = n
        var down = 0
        var right = 0
        var up = 0
        var i = 1
        while i <= total {
            if (n - direction) % 3 == 0 {
                let start = down * 2
                let end = n - down
                for j in start ..< end {
                    triangle[j].insert(i, at: down)
                    i += 1
                }
                down += 1
            } else if (n - direction) % 3 == 1 {
                triangle[n - 1 - right].insert(contentsOf: arr[i..<i+direction], at: down)
                right += 1
                i = i + direction
            } else {
                let start = n - up - 2
                let end = 1 + (up * 2)
                for j in stride(from: start, through: end, by: -1) {
                    triangle[j].insert(i, at: triangle[j].count - up)
                    i += 1
                }
                up += 1
            }
            direction -= 1
        }
        
        triangle.forEach { ans.append(contentsOf: $0) }
        
        return ans
    }
}
