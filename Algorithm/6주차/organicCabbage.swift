//
//  organicCabbage.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/11.
//

import Foundation

func organicCabbage() {
    var result: [Int] = []
    let testCase = Int(readLine()!)!

    for _ in 1...testCase {
        let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }

        let width = input[0]
        let height = input[1]
        let cabbageCount = input[2]
        var wormCount = 0

        var map: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)

        for _ in 1...cabbageCount {
            let cabbage = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
            map[cabbage[1]][cabbage[0]] = 1
        }

        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: width), count: height)
        for row in 0..<height {
            for col in 0..<width {
                if map[row][col] == 1 && visited[row][col] == false {
                    var stack = [(row, col)]
                    while !stack.isEmpty {
                        let cabbage = stack.removeLast()

                        if visited[cabbage.0][cabbage.1] == false {
                            visited[cabbage.0][cabbage.1] = true
                            let row_move = [1, -1, 0, 0]
                            let col_move = [0, 0, 1, -1]

                            for move in zip(row_move, col_move) {
                                let new_row = cabbage.0 + move.0
                                let new_col = cabbage.1 + move.1

                                if 0 <= new_row, new_row < height && 0 <= new_col, new_col < width {
                                    if map[new_row][new_col] == 1 && visited[new_row][new_col] == false {
                                        stack.append((new_row, new_col))
                                    }
                                }
                            }
                        }
                    }
                    wormCount += 1
                }
            }
        }
        result.append(wormCount)
    }
    result.forEach({ print($0) })
}
