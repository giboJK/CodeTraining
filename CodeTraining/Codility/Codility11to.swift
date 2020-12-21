//
//  Codility11to.swift
//  CodeTraining
//
//  Created by 정김기보 on 2020/12/20.
//

import Foundation

extension Codility {
    func sieve(_ n: Int) -> [Bool] {
        if n < 2 { return [false] }
        var isCompositeNumber = Array<Bool>.init(repeating: true, count: n + 1)
        isCompositeNumber[0] = false
        isCompositeNumber[1] = false
        
        var i = 2
        while i * i <= n {
            var k = 0
            if isCompositeNumber[i] {
                k = i * i
                while k <= n {
                    isCompositeNumber[k] = false
                    k += i
                }
            }
            
            i += 1
        }
        
        return isCompositeNumber
    }
    
    // This function returns minimum factor of numbers
    // which are smaller than given number as array.
    func arrayF(_ n: Int) -> [Int] {
        var factors = Array<Int>.init(repeating: 0, count: n + 1)
        
        var i = 2
        while i * i <= n {
            var k = 0
            if factors[i] == 0 {
                k = i * i
                while k <= n {
                    if factors[k] == 0 {
                        factors[k] = i
                    }
                    k += i
                }
            }
            i += 1
        }
        
        return factors
    }
    
    func factorization(x: Int, factors: [Int]) -> [Int] {
        var a = x
        var primeFactors = [Int]()
        while factors[a] > 0 {
            primeFactors.append(factors[a])
            a /= factors[a]
        }
        
        primeFactors.append(x)
        return primeFactors
    }
    
    func countNonDivisible (_ A: [Int]) -> [Int] {
        var numbers: [Int: Int] = [:]
        var ans: [Int] = []

        for i in 0 ..< A.count {
            if let value = numbers[A[i]] {
                numbers.updateValue(value + 1, forKey: A[i])
            } else {
                numbers.updateValue(1, forKey: A[i])
            }
        }

        for i in 0 ..< A.count {
            var j = 1
            var divisors = 0
            while j * j < A[i] {
                if A[i] % j == 0 {
                    if let divisor = numbers[j] {
                        divisors += divisor
                    }

                    if let divisor = numbers[A[i] / j] {
                        divisors += divisor
                    }
                }

                j += 1
            }

            if j * j == A[i],
               let divisor = numbers[j] {
                divisors += divisor
            }

            ans.append(A.count - divisors)
        }

        return ans
    }
    
//    func countNonDivisible (_ A: [Int]) -> [Int] {
//        var numbers = Array<Int>.init(repeating: 0, count: A.count * 2 + 1)
//        var ans = Array<Int>.init(repeating: 0, count: A.count)
//
//        A.forEach {
//            numbers[$0] += 1
//        }
//
//        var j = 1
//        var divisors = 0
//        for i in 0 ..< A.count {
//            j = 1
//            divisors = 0
//            while j * j < A[i] {
//                if A[i] % j == 0 {
//                    divisors += numbers[j]
//                    divisors += numbers[A[i] / j]
//                }
//                j += 1
//            }
//
//            if j * j == A[i] {
//                divisors += numbers[j]
//            }
//
//            ans[i] = A.count - divisors
//        }
//
//        return ans
//    }
    
    
    func countSemiprimes() {
        
    }
}
