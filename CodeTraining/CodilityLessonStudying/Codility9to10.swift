//
//  Codility9to.swift
//  CodeTraining
//
//  Created by 정김기보 on 2020/12/16.
//

import Foundation

extension Codility {
    func maxDoubleSliceSum(_ A: [Int]) -> Int {
        var frontSum = Array<Int>.init(repeating: 0, count: A.count)
        var backSum = Array<Int>.init(repeating: 0, count: A.count)
        
        for i in 1 ..< A.count - 1 {
            frontSum[i] = max(frontSum[i - 1] + A[i], 0)
        }
        
        for i in stride(from: A.count - 2, to: 0, by: -1) {
            backSum[i] = max(0, backSum[i + 1] + A[i])
        }
        
        var maxDoubleSliceSum = 0
        
        for i in 1 ..< A.count - 1 {
            maxDoubleSliceSum = max(maxDoubleSliceSum, frontSum[i-1] + backSum[i+1])
        }
        
        return maxDoubleSliceSum
    }
    
    func maxProfit(_ A: [Int]) -> Int {
        var maxProfit = 0
        var maxEnding = 0
        var delta = Array<Int>.init(repeating: 0, count: A.count)
        
        if A.count < 2 {
            return 0
        }
        
        for i in 1 ..< A.count {
            delta[i] = A[i] - A[i - 1]
        }
        
        for i in 1 ..< A.count {
            maxEnding = max(0, maxEnding + delta[i])
            maxProfit = max(maxProfit, maxEnding)
        }
        
        return maxProfit
    }
    
    func maxSliceSum(_ A: [Int]) -> Int {
        //        var maxEnd = 0
        //        var maxSlice = 0
        //
        //        for i in 0 ..< A.count {
        // 이게 0일 수 있는 이유는 하나도 안 포함하는 0의 경우를 가질 수 있기 때문에
        //            maxEnd = max(0, maxEnd + A[i])
        //            maxSlice = max(maxSlice, maxEnd)
        //        }
        //
        //        if maxSlice == 0 {
        //            maxSlice = A[0]
        //            for i in 1 ..< A.count {
        //                maxSlice = max(maxSlice, A[i])
        //            }
        //        }
        //
        //        return maxSlice
        // 무조건 하나를 포함해야 하므로 A[0]
        var maxEnd = A[0]
        var maxSlice = A[0]
        
        for i in 1 ..< A.count {
            // 여기까지의 합의 최대값
            // i까지의 경우 무조건 A[i]를 포함해야 하므로 A[i]와 비교하는 것
            maxEnd = max(maxEnd + A[i], A[i])
            // 부분합의 최대값
            maxSlice = max(maxEnd, maxSlice)
        }
        
        return maxSlice
    }
    // The numbert of operation can be estimated by n/1 + n/2 + ... + n/n,
    // what equals n(1/1 + 1/2 + 1/3 + ... + 1/n) O(NlogN)
    
    private func reversingCoins(_ n: Int) -> Int {
        var result = 0
        var coins = Array<Int>.init(repeating: 0, count: n + 1)
        
        for i in 1 ..< n + 1 {
            var k = i
            while k <= n {
                coins[k] = (coins[k] + 1) % 2
                k += i
            }
            result += coins[i]
        }
        return result
    }
    
    
    // Based on one divisor, we can find the symmetric divisor.
    // More precisely, if number a is a divisor of n, then n/a is also a divisor.
    // One of these two divisors is less than or equal to root n.
    // (If that were not the case, n would be a product of two numbers
    // greater than root n, which is impossible.)
    func countFactors(_ n: Int) -> Int {
        var i = 1
        var result = 0
        
        while (i * i < n) {
            if n % i == 0 {
                result = result + 2
            }
            i += 1
        }
        
        if i * i == n {
            result += 1
        }
        
        return result
    }
    
    private func createPeaks(_ A: [Int]) -> [Bool] {
        var peaks: [Bool] = Array<Bool>.init(repeating: false, count: A.count)
        
        for i in 1 ..< A.count - 1 {
            if A[i] > A[i - 1],
               A[i] > A[i + 1] {
                peaks[i] = true
            }
        }
        
        return peaks
    }
    
    private func nextPeak(_ A: [Int]) -> [Int] {
        let peaks = createPeaks(A)
        var next = Array<Int>.init(repeating: 0, count: A.count)
        next[A.count - 1] = -1
        
        for i in (0...A.count - 2).reversed() {
            if peaks[i] {
                next[i] = i
            } else {
                next[i] = next[i + 1]
            }
        }
        
        return next
    }
    
//    func flags(_ A: [Int]) -> Int {
//        if A.count < 3 { return 0 }
//        var count = 0; var peaks = 0; var result = 0
//
//        var i = 1
//        while count * (count - 1) <= A.count {
//            count += 1; i = 1; peaks = 0
//
//            while i < A.count - 1,
//                peaks < count {
//                if A[i] > A[i - 1],
//                   A[i] > A[i + 1] {
//                    peaks += 1
//                    i = i + count
//                } else {
//                    i += 1
//                }
//            }
//            if peaks == count {
//                result = max(result, peaks)
//            }
//        }
//
//        return result
//    }
    func flags(_ A: [Int]) -> Int {
        if A.count < 3 { return 0 }
        let next = nextPeak(A)
        var i = 1
        var result = 0

        while (i - 1) * i <= A.count {
            var pos = 0
            var num = 0
            while pos < A.count,
                  num < i {
                pos = next[pos]
                if pos == -1 {
                    break
                }
                num += 1
                pos += i
            }
            result = max(result, num)
            i += 1
        }

        return result
    }
    
    func minPerimeterRectangle(_ N: Int) -> Int {
        var minValue = Int.max
        var set: [Int: Int] = [:]
        
        var i = 1
        while i * i < N {
            if N % i == 0 {
                set.updateValue(i, forKey: N / i)
            }
            i += 1
        }
        
        if i * i == N {
            set.updateValue(i, forKey: i)
        }
        
        set.forEach { (arg0) in
            let (key, value) = arg0
            minValue = min(2 * (key + value), minValue)
        }
        
        return minValue
    }
    
    func peaks(_ A : [Int]) -> Int {
        if A.count < 3 { return 0 }

        let next = nextPeak(A)

        var blocks = 0
        var i = 1
        var pos = 1
        var blockNumber = 0

        while i * 3 <= A.count {
            if A.count % i != 0 {
                i += 1
                continue
            }
            pos = 1
            blockNumber = 0
            while pos < A.count - 1 {
                if next[pos] == -1 {
                    break
                }
                if next[pos] < (blockNumber + 1) * (A.count / i) {
                    blockNumber += 1
                    pos = blockNumber * (A.count / i)
                } else {
                    break
                }
            }
            if blockNumber == i {
                blocks = i
            }
            i += 1
        }

        return blocks
    }
}
