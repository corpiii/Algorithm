//
//  newCrew.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/05.
//

import Foundation



func newCrew() {
    let fileIO = FileIO()
    let T = fileIO.readInt()
    for _ in 0..<T {
        let personCount = fileIO.readInt()
        var people: [Int] = Array(repeating: 0, count: personCount + 1)
        
        for _ in 0..<personCount {
            people[fileIO.readInt()] = fileIO.readInt()
        }
        
        var topGrade = people[0]
        var result = 1
        for index in 0..<personCount {
            let grade = people[index]
            
            if topGrade > grade {
                result += 1
                topGrade = grade
            }
        }

        print(result)
    }
}
