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
            if !skill.contains(temp) || skill.first != temp.first {
                ans -= 1
            }
            
        }
        
        return ans
    }
}
