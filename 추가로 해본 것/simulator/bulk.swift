//
//  bulk.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/12.
//

import Foundation

func bulk() {
    let n = Int(readLine()!)!
    
    var people: [[Int]] = []
    var result: [String] = []
    
    for _ in 1...n {
        let person = readLine()!.components(separatedBy: " ").map({ Int(String($0))!})
        people.append(person)
    }
    
    for index1 in 0..<n {
        var count = 1
        for index2 in 0..<n {
            if index1 != index2 {
                let person1 = people[index1]
                let person2 = people[index2]
                
                if person1[0] < person2[0] && person1[1] < person2[1] {
                    count += 1
                }
            }
        }
        result.append(String(count))
    }
    print(result.joined(separator: " "))
}
