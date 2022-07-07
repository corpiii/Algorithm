//
//  surfacearea.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/07.
//

import Foundation
// 06 : 45
func surfaceArea() {
    let input = readLine()!.components(separatedBy: " ").map({Int(String($0))!})
    let vertical = input[0]
    let width = input[1]
    
    var hexaHedron: [[Int]] = []
    
    for _ in 0..<vertical {
        let line = readLine()!.components(separatedBy: " ").map({Int(String($0))!})
        hexaHedron.append(line)
    }
    
    var result = 0
    // 윗면 아랫면
    result += (width * vertical) * 2
    
    // 앞면 뒷면
    for col in 0..<width {
        var height = 0
        for row in 0..<vertical {
            let square = hexaHedron[row][col]
            result += abs(height - square)
            height = square
            
            // 마지막 이면 다 넣기
            if row == vertical - 1 {
                result += height
            }
        }
    }
    
    // 왼면 오면
    for row in 0..<vertical {
        var height = 0
        for col in 0..<width {
            let square = hexaHedron[row][col]
            result += abs(height - square)
            height = square
            
            // 마지막 이면 다 넣기
            if col == width - 1 {
                result += height
            }
        }
    }
    
    print(result)
}
// 07 : 06


