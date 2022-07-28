//
//  makeTriangle.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/27.
//

import Foundation

func makeTriangle() {
    var result = -1
    let n = Int(readLine()!)!
    
    var side: [Int] = []
    for _ in 1...n {
        let input = Int(readLine()!)!
        side.append(input)
    }
    
    side.sort(by: >)

    for index in 0...(n - 3) {
        let side1 = side[index]
        let side2 = side[index + 1]
        let side3 = side[index + 2]
        
        if side1 < side2 + side3 {
            result = side1 + side2 + side3
            break
        }
    }
    
    print(result)
}

