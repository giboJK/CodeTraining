//
//  CountingInversions.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/23.
//

import XCTest

/*
 Merge Sort: Counting Inversions
 */
class CountingInversions: XCTestCase {
    func test() {
        var A: [Int]

        A = [1, 1, 1, 2, 2]
        XCTAssertEqual(0, countInversions(arr: A))
        A = [7, 5, 3, 1]
        XCTAssertEqual(6, countInversions(arr: A))
        A = [2, 1, 3, 1, 2]
        XCTAssertEqual(4, countInversions(arr: A))
    }

    func test_speed() {
        var A: [Int] = []
        for _ in 0 ..< 100_000 { A.append(Int.random(in: 0..<100_000)) }
        
        measure {
            _ = countInversions(arr: A)
        }
    }
    
    func countInversions(arr: [Int]) -> Int {
        var cnt = 0
        _ = mergeSort(arr, &cnt)
        return cnt
    }
    
    func mergeSort<T: Comparable>(_ array: [T], _ count: inout Int) -> [T] {
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]), &count)
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]), &count)
        
        return merge(leftArray, rightArray, &count)
    }
    
    func merge<T: Comparable>(_ left: [T], _ right: [T], _ count: inout Int) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedArray: [T] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            if leftElement <= rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                count += left.count - leftIndex
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        
        return orderedArray
    }
}
