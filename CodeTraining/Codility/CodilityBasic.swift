//
//  CodilityBasic.swift
//  CodeTraining
//
//  Created by 정김기보 on 2020/12/12.
//

import Foundation

func binaryGap(_ N : Int) -> Int {
    var maxGap: Int = 0
    var gap: Int = 0
    let binaryString = String(N, radix: 2)

    binaryString.forEach { character in
        if character == "1" {
            maxGap = max(maxGap, gap)
            gap = 0
        } else {
            gap += 1
        }
    }
    
    return maxGap
}

func cyclicRotation(_ A : [Int], _ K : Int) -> [Int] {
    var answer = [Int]()
    let shiftSize = K % max(1, A.count)
    
    for i in (A.count - shiftSize) ..< A.count {
        answer.append(A[i])
    }
    
    for i in 0 ..< (A.count - shiftSize) {
        answer.append(A[i])
    }
    
    return answer
}

func oddOccurrencesInArray(_ A : [Int]) -> Int {
    var intSet: Set<Int> = Set()
    
    A.forEach { integer in
        if intSet.contains(integer) {
            intSet.remove(integer)
        } else {
            intSet.insert(integer)
        }
    }
    
    return intSet.first!
}

func frogJmp(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    let distance = Double(Y - X)
    return Int(ceil(distance / Double(D)))
}

func permMissingElem(_ A : [Int]) -> Int {
    let sorted = A.sorted()
    
    for i in 0 ..< sorted.count {
        if (i + 1) != sorted[i] {
            return i + 1
        }
    }
    
    return sorted.count + 1
}

func tapeEquilibrium(_ A : [Int]) -> Int {
    var sum: Int = 0
    var preSum: Int = 0
    var answer: Int = Int.max
    
    A.forEach { integer in
        sum += integer
    }
    
    for i in 0 ..< A.count - 1 {
        preSum += A[i]
        answer = min(answer, abs(sum - 2 * preSum))
    }
    
    return answer
}

// MARK - Lesson4

func frogRiverOne(_ X : Int, _ A : [Int]) -> Int {
    
    return 0
}

func maxCounters() {
    
}

func missingInteger() {
    
}

func permCheck() {
    
}
