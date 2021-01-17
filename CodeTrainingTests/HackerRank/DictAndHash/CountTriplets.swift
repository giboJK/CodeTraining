//
//  CountTriplets.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/17.
//

import XCTest

class CountTriplets: XCTestCase {
    func test() {
        var arr: [Int]
        var r: Int
        
        arr = [1, 2, 2, 4]
        r = 2
        XCTAssertEqual(2, countTriplets(arr: arr, r: r))
        
        arr = [1, 3, 9, 9, 27, 81]
        r = 3
        XCTAssertEqual(6, countTriplets(arr: arr, r: r))
        
        arr = [1, 1, 1, 1]
        r = 1
        XCTAssertEqual(4, countTriplets(arr: arr, r: r))
    }
    
    func fileRead(fileName: String) -> ([Int], Int)? {
        let testBundle = Bundle(for: type(of: self))
        if let filepath = testBundle.path(forResource: fileName, ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                let strings = contents.components(separatedBy: .newlines)
                let nr = strings[0].split(separator: " ").map { String($0) }
                guard let size = nr.first else { fatalError("Error - 1") }
                guard let r = nr.last else { fatalError("Error - 2") }
                
                let arr: [Int] = strings[1].split(separator: " ").map {
                    if let arrItem = Int($0) {
                        return arrItem
                    } else {
                        fatalError("Bad input")
                    }
                }
                
                guard arr.count == Int(size) else { fatalError("Bad input") }
                return (arr, Int(r)!)
            } catch {
                print("Error: contents could not be loaded")
                return nil
            }
        } else {
            print("Error: not found!")
            return nil
        }
    }
    
    func test_fileRead() {
        if let data = fileRead(fileName: "countTripletsSmall") {
            XCTAssertEqual(2, countTriplets(arr: data.0, r: data.1))
        }
    }
    
    func test_expected_value_is_zero() {
        if let data = fileRead(fileName: "expectedZero") {
            XCTAssertEqual(0, countTriplets(arr: data.0, r: data.1))
        }
    }
    
    func test_countTriplets_big_number() {
        if let data = fileRead(fileName: "countTriplets") {
            XCTAssertEqual(2325652489, countTriplets(arr: data.0, r: data.1))
        }
    }
    
//    func countTriplets(arr: [Int], r: Int) -> Int {
//        if arr.count < 3 { return 0 }
//
//        var ans = 0
//        var singlets = [Int: Int]()
//        var duplets = [Int: Int]()
//
//        for i in stride(from: arr.count - 1, through: 0, by: -1) {
//            let t1 = arr[i]
//            let t2 = t1 * r
//            if t2 > 10_000_000_000 { continue }
//            let t3 = t2 * r
//
//            ans += duplets[t3] ?? 0
//
//            if let duplet = duplets[t2] {
//                duplets.updateValue(duplet + (singlets[t2] ?? 0), forKey: t2)
//            } else {
//                if let singlet = singlets[t2] {
//                    duplets.updateValue(singlet, forKey: t2)
//                } else {
//                    duplets.updateValue(0, forKey: t2)
//                }
//            }
//
//            singlets.updateValue((singlets[t1] ?? 0) + 1, forKey: t1)
//        }
//
//        return ans
//    }
    
    /*
     (a/r, r, ar) approach
     */
    func countTriplets(arr: [Int], r: Int) -> Int {
        var ans = 0
        var left = [Int: Int]()
        var right = [Int: Int]()
        
        arr.forEach { value in
            right.updateValue((right[value] ?? 0) + 1, forKey: value)
        }
        
        for i in arr.enumerated() {
            right.updateValue(right[i.element]! - 1, forKey: i.element)
            
            if i.element % r == 0 {
                ans += (left[i.element / r] ?? 0) * (right[i.element * r] ?? 0)
            }
            
            left.updateValue((left[i.element] ?? 0) + 1, forKey: i.element)
        }
        
        return ans
    }
}
