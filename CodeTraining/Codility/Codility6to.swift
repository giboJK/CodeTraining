//
//  Codility6to.swift
//  CodeTraining
//
//  Created by 정김기보 on 2020/12/13.
//

import Foundation

extension Codility {
    func distinct(_ A: [Int]) -> Int {
        var ans = Set<Int>()
        
        A.forEach {
            ans.insert($0)
        }
        
        return ans.count
    }

    func maxProductOfThree(_ A: [Int]) -> Int {
        let sorted = A.sorted()
        var maxProduct = Int.min
        
        maxProduct = max(maxProduct, sorted[0] * sorted[1] * sorted[A.count - 1])
        maxProduct = max(maxProduct, sorted[A.count - 1] * sorted[A.count - 2] * sorted[A.count - 3])
        
        return maxProduct
    }

    func numberOfDiscInterections(_ A: [Int]) -> Int {
        var ans = 0
        
        var openPoints = [Int]()
        var closePoints = [Int]()
        var intersections: Int = 0
        
        for i in 0 ..< A.count {
            openPoints.append(i - A[i])
            closePoints.append(i + A[i])
        }
        openPoints = openPoints.sorted()
        closePoints = closePoints.sorted()
        
        var closePointsIndex = 0
        for i in 0 ..< A.count {
            while( closePoints[closePointsIndex] < openPoints[i]) {
                intersections -= 1
                closePointsIndex += 1
            }
            ans += intersections
            intersections += 1
        }
        
        if ans > 10000000 { return -1 }
        return ans
    }
    
    

    func triangle(_ A: [Int]) -> Int {
        let sorted = A.sorted()
        if A.count < 3 {
            return 0
        }
        
        for i in 0 ..< A.count - 2 {
            if sorted[i] + sorted[i + 1] > sorted[i + 2] {
                return 1
            }
        }
        
        return 0
    }

    func brackets(_ S: String) -> Int {
        var stack: Array<Character> = []
        
        for i in 0 ..< S.count {
            if S[String.Index(encodedOffset: i)] == "(" {
                stack.append(S[String.Index(encodedOffset: i)])
            } else if S[String.Index(encodedOffset: i)] == "{" {
                stack.append(S[String.Index(encodedOffset: i)])
            } else if S[String.Index(encodedOffset: i)] == "[" {
                stack.append(S[String.Index(encodedOffset: i)])
            } else if S[String.Index(encodedOffset: i)] == ")" {
                if stack.last == "(" {
                    _ = stack.popLast()
                } else { return 0 }
            } else if S[String.Index(encodedOffset: i)] == "}" {
                if stack.last == "{" {
                    _ = stack.popLast()
                } else { return 0 }
            } else if S[String.Index(encodedOffset: i)] == "]" {
                if stack.last == "[" {
                    _ = stack.popLast()
                } else { return 0 }
            }
        }
        
        return stack.isEmpty ? 1 : 0
    }
    
    func fish(A: [Int], _ B: [Int]) -> Int {
        return 0
    }
    
    func nesting() {
        
    }
    
    func stoneWall() {
        
    }
}
