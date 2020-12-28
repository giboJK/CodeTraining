//
//  Lesson14BinarySearch.swift
//  CodeTraining
//
//  Created by 정김기보 on 2020/12/28.
//

import Foundation

/*
 https://codility.com/media/train/12-BinarySearch.pdf
 행렬을 사용하는 방법은 나중에 해봅시다!
 */
extension Codility {
    func binarySearch(_ A: [Int], _ x: Int) -> Int {
        let length = A.count
        var beg = 0
        var end = length - 1
        var result = 0
        
        while beg <= end {
            let mid = (beg + end) / 2
            if A[mid] <= x {
                beg = mid + 1
                result = mid
            } else {
                end = mid - 1
            }
        }
        
        return result
    }
}
