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
    
    

    func triangle() {
        
    }

}
