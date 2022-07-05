//
//  globalWarming.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/05.
//

import Foundation

func globalWarming() {
    let input = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    var map: [[String]] = []
    
    for _ in 1...input[0] {
        let row = Array(readLine()!).map({String($0)})
        map.append(row)
    }
    
    map.forEach({print($0)})
    
    var islands: [[Int]] = []
    for row in map.indices {
        for col in map[0].indices {
            if map[row][col] == "X" {
                islands.append([row, col])
            }
        }
    }
    
    
    // 잠기는 섬 확인 바다가 3이상이면 체크
    var sinkCheck: [Bool] = Array(repeating: false, count: islands.count)
    for (index, island) in islands.enumerated() {
        if isSink(island, at: map) {
            sinkCheck[index] = true
        }
    }
    
    // 바다로 변환
    for index in sinkCheck.indices {
        if sinkCheck[index] == true {
            let island = islands[index]
            let row = island[0]
            let col = island[1]
            map[row][col] = "."
        }
    }
    
    print("꼬르륵")
    map.forEach({print($0)})
    
    var startRow = 0
    var endRow = 0
    var startCol = 0
    var endCol = 0
    
    // 섬이 처음으로 보이는 행, 마지막으로 보이는 행
    for index in 0..<map.count {
        print("처음으로 보이는 행", index)
        if map[index].contains("X") {
            startRow = index
            break
        }
    }
    
    for index in stride(from: map.count - 1, through: 0, by: -1) {
        print("마지막으로 보이는 행", index)
        if map[index].contains("X") {
            endRow = index
            break
        }
    }
    
    // 섬이 처음으로보이는 열, 마지막으로 보이는 열
    outerLoop: for index in 0..<map[0].count {
        for row in 0..<map.count {
            if map[row][index] == "X" {
                startCol = index
                break outerLoop
            }
        }
    }
    
    outerLoop: for index in stride(from: map[0].count - 1, through: 0, by: -1) {
        for row in 0..<map.count {
            if map[row][index] == "X" {
                endCol = index
                break outerLoop
            }
        }
    }
    
    print("startRow, endRow :",startRow, endRow)
    print("startCol, endCol :",startCol, endCol)
    
    // 출력 = 처음보이는 행...마지막보이는행
    // 출력 = 처음보이는 열...마지막보이는열
    var result = ""
    for row in startRow...endRow {
        var line = ""
        for col in startCol...endCol {
            line += map[row][col]
        }
        result += line + "\n"
    }
    
    print(result)
}

func isSink(_ island: [Int], at map: [[String]]) -> Bool {
    let row = island[0]
    let col = island[1]
    
    let x_move = [-1, 1, 0, 0]
    let y_move = [0, 0, -1, 1]
    
    var seaCount = 0
    for move in zip(x_move, y_move) {
        let new_row = row + move.0
        let new_col = col + move.1
        
        if (-1 <= new_row && new_row <= map.count) && (-1 <= new_col && new_col <= map[0].count) {
            if new_row == -1 || new_row == map.count
                || new_col == -1 || new_col == map[0].count
                || map[new_row][new_col] == "." {
                seaCount += 1
            }
        }
    }
    
    if seaCount >= 3 {
        return true
    } else {
        return false
    }
}
