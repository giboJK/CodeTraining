//
//  FrequencyQueries.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/01/17.
//

import XCTest

class FrequencyQueries: XCTestCase {

    func answerFileRead(fileName: String) -> [Int]? {
        let testBundle = Bundle(for: type(of: self))
        if let filepath = testBundle.path(forResource: fileName, ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                let strings = contents.components(separatedBy: .newlines)
                var arr = [Int]()
                
                for i in 0 ..< strings.count {
                    if let num = Int(strings[i]) {
                        arr.append(num)
                    }
                }
                
                return arr
            } catch {
                print("Error: contents could not be loaded")
                return nil
            }
        } else {
            print("Error: not found!")
            return nil
        }
    }
    
    func dataFileRead(fileName: String) -> [[Int]]? {
        let testBundle = Bundle(for: type(of: self))
        if let filepath = testBundle.path(forResource: fileName, ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                let strings = contents.components(separatedBy: .newlines)
                let size = Int(strings[0])
                
                var queries = [[Int]]()
                
                for i in 1 ..< strings.count {
                    let nr = strings[i].split(separator: " ").map { String($0) }
                    if let op = nr.first, let num = nr.last {
                        queries.append([Int(op)!, Int(num)!])
                    }
                }
                
                guard queries.count == size else { fatalError("Bad input") }
                
                return queries
            } catch {
                print("Error: contents could not be loaded")
                return nil
            }
        } else {
            print("Error: not found!")
            return nil
        }
    }
    
    func test() {
        var queries: [[Int]]
        queries = [[1, 1], [2, 2], [3, 2], [1, 1], [1, 1], [2, 1], [3, 2]]
        XCTAssertEqual([0, 1], freqQuery(queries: queries))
    }
    
    func test_big() {
        guard let queries = dataFileRead(fileName: "frequencyBig") else { fatalError("error1") }
        guard let ans = answerFileRead(fileName: "frequencyBigAnswer") else { fatalError("error2")}
        XCTAssertEqual(ans, freqQuery(queries: queries))
    }
    
    func freqQuery(queries: [[Int]]) -> [Int] {
        var ans = [Int]()
        var freqMap = [Int: Int]()
        var countArray = [Int](repeating: 0, count: queries.count + 1)
        
        for (_, op) in queries.enumerated() {
            switch op[0] {
            case 1:
                if let occurrence = freqMap[op[1]] {
                    countArray[occurrence] -= 1
                    freqMap.updateValue(occurrence + 1, forKey: op[1])
                } else {
                    freqMap.updateValue(1, forKey: op[1])
                }
                countArray[freqMap[op[1]]!] += 1
            case 2:
                let currentCount = freqMap[op[1]] ?? 0
                if currentCount > 0 {
                    countArray[currentCount] -= 1
                    freqMap.updateValue(currentCount - 1, forKey: op[1])
                    countArray[currentCount - 1] += 1
                }
            case 3:
                if op[1] > queries.count {
                    ans.append(0)
                } else {
                    ans.append(countArray[op[1]] > 0 ? 1 : 0)
                }
                
            default:
                break
            }
        }
        
        return ans
    }
}
