//
//  Codility12.swift
//  CodeTraining
//
//  Created by 정김기보 on 2020/12/24.
//

import Foundation

// MARK - Euclidean algorithm

extension Codility {
    // precondition: a is greater or equal than b
    
//    func gcd(a: Int, b: Int) -> Int {
//        if a == b {
//            return a
//        }
//
//        if a > b {
//            return gcd(a: a - b, b: b)
//        } else {
//            return gcd(a: a, b: b - a)
//        }
//    }
    
    // gcd algorithm by dividing.
    // A = B*t + R 일 때, gcd(A, B) = gcd(B, R)임을 이용한 함수
    // Let's prove it!!
    // A = Ga, B = Gb라고 하자 a와 b는 서로소.
    // A = B*t + R 이므로 R = A - B*t = G(a - b*t)가 된다
    // 이제 b와 a - b*t가 서로소 임을 증명해보자
    // 만약 b와 a - b*t가 서로소가 아니라면
    // b = m*k, a - b*t = m*k'가 되므로
    // a = b*t + m * k' = m(k*t + k')이 되므로
    // a와 b는 서로소라는 가정에 모순된다. 따라서 b와 a - b*t는 서로소
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a % b == 0 {
            return b
        } else {
            return gcd(b, a % b)
        }
    }
    
/*
     12.3. Binary Euclidean algorithm(Stein's algorithm)
     Divide and Conquer technique.
     gcd(a, b, res) = gcd(a, b, 1) * res
     이진 최대공약수 알고리즘
     36과 24의 최대공약수를 구하는 예시를 들어보자
     36 -> 18 -> 9 -> 9 -> 6 -> 3 -> 3
     24 -> 12 -> 6 -> 3 -> 3 -> 3 -> 0
     - 규칙 -
     1. 두 수가 짝수일 때는 2로 나눈다
     2. 한 수만 짝수일 때는 그 수를 2로 나눈다
     3. 두 수가 홀수일 때는 큰 수에서 작은 수를 뺀다
     4. 0이 되는 수가 있으면 종료한다
     
     두 수가 짝수여서 2로 나눌 때마다 2의 횟수를 나타내는 a(2^a에서 사용할)의 값을 1씩 증가시킨다
     마지막에 남은 0이 아닌 수를 b라고 하면
     2^a*b의 값을 반환한다
     두 수가 2로 a번 나눠진다는 것은 두 수의 공약수에 2가 a번 들어있다는 것이므로!
     두 수가 홀수일 때 빼주는 것은 위에서 증명한 것을 사용한 것!
 */
    func binaryGcd(_ a: Int, _ b: Int, _ res: Int = 1) -> Int {
        if a == b {
            return res * a
        } else if a % 2 == 0,
                  b % 2 == 0 {
            return binaryGcd(a / 2, b / 2, 2 * res)
        } else if a % 2 == 0 {
            return binaryGcd(a / 2, b, res)
        } else if b % 2 == 0 {
            return binaryGcd(a, b / 2, res)
        } else if a > b {
            return binaryGcd(a - b, b, res)
        } else {
            return binaryGcd(a, b - a, res)
        }
    }
    
    // Least common multiple
    func lcm(_ a: Int, _ b: Int) -> Int {
        let greatestCommonDividor = binaryGcd(a, b)
        
        return a * b / greatestCommonDividor
    }
}
