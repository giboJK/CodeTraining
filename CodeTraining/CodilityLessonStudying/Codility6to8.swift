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
    
    func fish(_ A: [Int], _ B: [Int]) -> Int {
        var stack = [Int]()
        var survivedFishes = 0
        
        for i in 0 ..< A.count {
            if B[i] == 0 {
                while !stack.isEmpty {
                    let thatBoy = stack.last!
                    if thatBoy > A[i] {
                        break
                    }
                    _ = stack.popLast()
                }
                if stack.isEmpty {
                    survivedFishes += 1
                }
            } else {
                stack.append(A[i])
            }
        }
        
        return stack.count + survivedFishes
    }
    
    func nesting(_ S: String) -> Int {
        var stack: Array<Character> = []
        
        for i in 0 ..< S.count {
            if S[String.Index(encodedOffset: i)] == "(" {
                stack.append(S[String.Index(encodedOffset: i)])
            } else {
                if stack.last == "(" {
                    _ = stack.popLast()
                } else { return 0 }
            }
        }
        
        return stack.isEmpty ? 1 : 0
    }
    
    func stoneWall(_ H: [Int]) -> Int {
        var blocks = [Int]()
        var count = 0
        
        H.forEach { height in
            if blocks.isEmpty {
                blocks.append(height)
            } else if height > blocks.last! {
                blocks.append(height)
            } else if height < blocks.last! {
                while !blocks.isEmpty &&
                      (blocks.last! > height) {
                    count += 1
                    _ = blocks.removeLast()
                }
                
                if blocks.isEmpty {
                    blocks.append(height)
                } else if height != blocks.last! {
                    blocks.append(height)
                }
            }
        }
        
        return count + blocks.count
    }
    
    func dominator(_ A: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        
        for i in 0 ..< A.count {
            if let occurance = dict[A[i]] {
                dict.updateValue(occurance + 1, forKey: A[i])
                if occurance + 1 > A.count / 2 {
                    return i
                }
            } else {
                dict.updateValue(1, forKey: A[i])
            }
        }
        
        if A.count == 1 {
            return 0
        }
        
        return -1
    }
    
    func equiLeader(_ A: [Int]) -> Int {
        var ans = 0
        var dict: [Int: Int] = [:]
        var dominator: Int?
        var countOfDominator = 0
        
        for i in 0 ..< A.count {
            if let occurance = dict[A[i]] {
                dict.updateValue(occurance + 1, forKey: A[i])
                if occurance + 1 > A.count / 2 {
                    dominator = A[i]
                }
            } else {
                dict.updateValue(1, forKey: A[i])
            }
        }
        
        if dominator == nil {
            return 0
        }
        
        for i in 0 ..< A.count {
            if A[i] == dominator {
                countOfDominator += 1
            }
            
            if countOfDominator > (i + 1) / 2,
               dict[dominator!]! - countOfDominator > (A.count - 1 - i) / 2 {
                ans += 1
            }
        }
        
        return ans
    }
}
