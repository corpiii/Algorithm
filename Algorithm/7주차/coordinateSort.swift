//
//  coordinateSort.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/20.
//

import Foundation

func coordinateSort() {
    let n = Int(readLine()!)!
    var result = ""
    var coordinates: [[Int]] = []
    
    for _ in 1...n {
        let input = readLine()!.components(separatedBy: " ").map({Int(String($0))!})
        coordinates.append(input)
    }
    
    coordinates.sort { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
    coordinates.forEach { result.append("\($0[0]) \($0[1])\n") }
    print(result)
}
