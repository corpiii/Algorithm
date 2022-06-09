//
//  numberKth.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/07.
//

import Foundation

func numberKth(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    
    commands.forEach { command in
        let start = command[0]
        let end = command[1]
        let index = command[2]

        let newArray: [Int] = array[(start-1)...(end-1)].sorted()
        result.append(newArray[index - 1])
    }
    return result
}
