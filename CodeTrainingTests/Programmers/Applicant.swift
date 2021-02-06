//
//  Applicant.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/02/06.
//

import XCTest

class Applicant: XCTestCase {
    
    func test() {
        var info: [String]
        var query: [String]
        
        info = ["java backend junior pizza 150",
                "python frontend senior chicken 210",
                "python frontend senior chicken 150",
                "cpp backend senior pizza 260",
                "java backend junior chicken 80",
                "python backend senior chicken 50"]
        query = ["java and backend and junior and pizza 100",
                 "python and frontend and senior and chicken 200",
                 "cpp and - and senior and pizza 250",
                 "- and backend and senior and - 150",
                 "- and - and - and chicken 100",
                 "- and - and - and - 150"]
        XCTAssertEqual([1, 1, 1, 1, 2, 4], solution(info, query))
    }
    
    
    func solution(_ info:[String], _ query:[String]) -> [Int] {
        var ans = [Int]()
        
//        for i in 0 ..< query.count {
//            let conditions = query[i].split(separator: " ")
//            
//            let languagePasser = info.filter { $0.contains(String(conditions[0])) }
//            
//            var partPasser = []
//            partPasser = languagePasser.filter { $0.contains(String(conditions[2])) }
//            let careerPasser = partPasser.filter { $0.contains(String(conditions[4])) }
//            let soulPasser = careerPasser.filter { $0.contains(String(conditions[6])) }
//            
//            var pointPasser = 0
//            if String(conditions[2]) != "-" {
//            let partPasser = languagePasser.filter { $0.contains(String(conditions[2])) }
//            } else { partPasser = languagePassr }
//            passPoint = Int(conditions[7])!
//            for (_, passer) in soulPasser.enumerated() {
//                let point = Int(passer.split(separator: " ").last!)!
//                if point >= passPoint {
//                    pointPasser += 1
//                }
//            }
//            
//            ans.append(pointPasser)
//        }
        return ans
    }
}
