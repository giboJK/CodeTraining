//
//  Lesson13Fibonacci.swift
//  CodeTraining
//
//  Created by 정김기보 on 2020/12/26.
//

import Foundation

/*
 https://codility.com/media/train/11-Fibonacci.pdf
 행렬을 사용하는 방법은 나중에 해봅시다!
 */
extension Codility {
    func fibonacciDynamic(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        
        var fib = Array<Int>.init(repeating: 0, count: n + 2)
        fib[1] = 1
        for i in 2 ... n + 1 {
            fib[i] = fib[i - 1] + fib[i - 2]
        }
        return fib[n]
    }
}
