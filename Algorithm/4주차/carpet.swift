//
//  카펫.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/24.
//

import Foundation

func carpet(_ brown:Int, _ yellow:Int) -> [Int] {
    var result: [Int] = []
    
    let gridSize = brown + yellow
    var sizes: [(Int, Int)] = []
    
    for size in 3...Int(sqrt(Double(brown + yellow))) {
        if gridSize % size == 0 {
            let width = gridSize / size
            let height = size
            sizes.append((width, height))
        }
    }
    
    for size in sizes {
        let width = size.0
        let height = size.1

        if yellow == (width - 2) * (height - 2) {
            result.append(width)
            result.append(height)
            break
        }
    }
    return result
}
