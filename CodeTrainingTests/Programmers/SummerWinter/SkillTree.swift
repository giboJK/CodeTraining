//
//  SkillTree.swift
//  CodeTrainingTests
//
//  Created by 정김기보 on 2021/02/07.
//

import XCTest

class SkillTree: XCTestCase {
    func test() {
        var skill: String
        var skill_trees: [String]
        
        skill = "CBD"
        skill_trees = ["BACDE", "CBADF", "AECB", "BDA"]
        XCTAssertEqual(2, solution(skill, skill_trees))
        
        skill = "CBD"
        skill_trees = ["AEF", "ZJW"]
        XCTAssertEqual(2, solution(skill, skill_trees))
        
        skill = "REA"
        skill_trees = ["REA", "POA"]
        XCTAssertEqual(1, solution(skill, skill_trees))
        
        skill = "CBDK"
        skill_trees = ["CB", "CXYB", "BD", "AECD", "ABC", "AEX", "CDB", "CBKD", "IJCB", "LMDK"]
        XCTAssertEqual(4, solution(skill, skill_trees))
        
        skill = "BDC"
        skill_trees = ["AAAABAAC"]
        XCTAssertEqual(0, solution(skill, skill_trees))
        
        skill = "CBD"
        skill_trees = ["C", "D", "CB", "BDA"]
        XCTAssertEqual(2, solution(skill, skill_trees))
    }
    
    func solution(_ skill: String, _ skill_trees: [String]) -> Int {
        var temp: String = ""
        var ans = 0
        
        for (_ ,tree) in skill_trees.enumerated() {
            temp.removeAll()
            ans += 1
            for (_, s) in tree.enumerated() {
                if skill.contains(s) {
                    temp.append(s)
                }
            }
            if temp.isEmpty {
                continue
            }
            if !skill.contains(temp) || skill.first != temp.first {
                ans -= 1
            }
        }
        
        return ans
    }
    
//    func solution(_ skill: String, _ skill_trees: [String]) -> Int {
//        return skill_trees.filter {
//            let filteredSkill = $0.filter {
//                return skill.firstIndex(of: $0) != nil
//            }
//            return skill.hasPrefix(filteredSkill)
//        }.count
//    }
}
