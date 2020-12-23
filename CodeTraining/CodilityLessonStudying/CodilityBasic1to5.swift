//
//  CodilityBasic1to5.swift
//  CodeTraining
//
//  Created by 정김기보 on 2020/12/12.
//

import Foundation

class Codility {
    func binaryGap(_ N: Int) -> Int {
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

    func cyclicRotation(_ A: [Int], _ K: Int) -> [Int] {
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

    func oddOccurrencesInArray(_ A: [Int]) -> Int {
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

    func frogJmp(_ X: Int, _ Y: Int, _ D: Int) -> Int {
        let distance = Double(Y - X)
        return Int(ceil(distance / Double(D)))
    }

    func permMissingElem(_ A: [Int]) -> Int {
        let sorted = A.sorted()
        
        for i in 0 ..< sorted.count {
            if (i + 1) != sorted[i] {
                return i + 1
            }
        }
        
        return sorted.count + 1
    }

    func tapeEquilibrium(_ A: [Int]) -> Int {
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

    func frogRiverOne(_ X: Int, _ A: [Int]) -> Int {
        var fallenLeafs = Array<Bool>.init(repeating: false, count: X + 1)
        var frogPosition = 0
        
        for i in 0 ..< A.count {
            if A[i] <= X {
                fallenLeafs[A[i]] = true
            }
            
            while frogPosition < fallenLeafs.count - 1,
                  fallenLeafs[frogPosition + 1] {
                frogPosition += 1
            }
            
            if frogPosition == X {
                return i
            }
        }
        
        return -1
    }

    func maxCounters(_ N: Int, _ A: [Int]) -> [Int] {
        var counters = Array<Int>.init(repeating: 0, count: N)
        var lastSetMax: Int = 0
        var currentMax: Int = 0
        
        A.forEach { operation in
            if operation < N + 1 {
                counters[operation - 1] = max(lastSetMax + 1, counters[operation - 1] + 1)
                currentMax = max(counters[operation - 1], currentMax)
            } else {
                lastSetMax = currentMax
            }
        }
        
        for i in 0 ..< counters.count {
            counters[i] = max(counters[i], lastSetMax)
        }
        
        return counters
    }

    func missingInteger(_ A: [Int]) -> Int {
        var smallestPositiveInteger = 1
        var givenPositiveIntegers = Array<Bool>.init(repeating: false, count: A.count + 1)
        
        A.forEach { number in
            if number > 0,
               number < givenPositiveIntegers.count {
                givenPositiveIntegers[number] = true
            }
        }
        
        for i in 1 ..< givenPositiveIntegers.count {
            if givenPositiveIntegers[i] {
                smallestPositiveInteger += 1
            } else {
                return i
            }
        }
        
        return smallestPositiveInteger
    }

    func permCheck(_ A: [Int]) -> Int  {
        var elementCheckList = Array<Bool>.init(repeating: false, count: A.count + 1)
        
        for i in 0 ..< A.count {
            if A[i] >= elementCheckList.count {
                return 0
            }
            elementCheckList[A[i]] = true
        }
        
        for i in 1 ..< elementCheckList.count {
            if !elementCheckList[i] {
                return 0
            }
        }
        
        return 1
    }

    func countDiv(_ A : Int, _ B : Int, _ K : Int) -> Int {
        let divideA: Int = A / K
        let divideB: Int = B / K
        
        var ans = divideB - divideA
        if A % K == 0 {
            ans += 1
        }
        
        return ans
    }

    func genomicRangeQuery(_ S: String, _ P: [Int], _ Q: [Int]) -> [Int] {
        var ans = [Int]()
        let factors: [String: Int] = ["A": 0, "C": 1, "G": 2, "T": 3]
        var frequencies = Array<[Int]>.init(repeating: Array<Int>.init(repeating: 0,
                                                                       count: S.count + 1),
                                            count: factors.count)
    //    let firstCharacterIndex = factors["\(S[String.Index(utf16Offset: 0, in: S)])"]!
        for i in 0 ..< S.count {
            for j in 0 ..< factors.count {
                frequencies[j][i + 1] = frequencies[j][i]
            }
            if let index = factors["\(S[String.Index(encodedOffset: i)])"] {
                frequencies[index][i + 1] += 1
            }
        }
        
        for i in 0 ..< P .count {
            if Q[i] == P[i] {
                ans.append(factors["\(S[String.Index(encodedOffset: Q[i])])"]! + 1)
            } else {
                for j in 0 ..< factors.count {
                    if (frequencies[j][Q[i] + 1] - frequencies[j][P[i]]) != 0 {
                        ans.append(j + 1)
                        break
                    }
                }
            }
        }
        
        return ans
    }

    func minAvgTwoSlice(_ A: [Int]) -> Int {
        var ans = 0
        var minAvg: Float = Float((A[0] + A[1])) / 2
        
        for i in 2 ..< A.count {
            var avg = Float(A[i-2] + A[i-1] + A[i]) / Float(3)
            if avg < minAvg {
                minAvg = avg
                ans = i - 2
            }
            
            avg = Float(A[i-1] + A[i]) / Float(2)
            if avg < minAvg {
                minAvg = avg
                ans = i - 1
            }
        }
        
        return ans
    }

    func passingCar(_ A: [Int]) -> Int {
        var ans = 0
        var prefixSum = [0, A[0]]
        
        for i in 1 ..< A.count {
            prefixSum.append(prefixSum[i] + A[i])
        }
        for i in 0 ..< A.count - 1 {
            if A[i] == 0 {
                ans += prefixSum[A.count] - prefixSum[i]
            }
            if ans > 1000000000 {
                return -1
            }
        }
        return ans
    }

}
