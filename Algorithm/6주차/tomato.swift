//
//  tomato.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/08.
//

import Foundation

func tomato() {
    func tomato_bfs(_ queue: [[Int]]) {
        if queue.isEmpty {
            return
        }
        
        var new_queue: [[Int]] = []
        for tomato in queue {
            let row = tomato[0]
            let col = tomato[1]
            
            let x_move = [1,-1,0,0]
            let y_move = [0,0,1,-1]
            
            for (x, y) in zip(x_move, y_move) {
                let new_row = row + x
                let new_col = col + y
                
                if 0 <= new_row && new_row < box_height
                    && 0 <= new_col && new_col < box_width {
                    if box[new_row][new_col] == 0 {
                        box[new_row][new_col] = 1
                        new_queue.append([new_row, new_col])
                    }
                }
            }
        }
        
        result += 1
        tomato_bfs(new_queue)
    }
    
    let fileIO = FileIO()
    let box_width = fileIO.readInt()
    let box_height = fileIO.readInt()
    
    var box: [[Int]] = []
    for _ in 1...box_height {
        var line: [Int] = []
        for _ in 1...box_width {
            line.append(fileIO.readInt())
        }
        box.append(line)
    }
    
    // 토마토 위치
    var position: [[Int]] = []
    
    for row in 0..<box_height {
        for col in 0..<box_width {
            if box[row][col] == 1 {
                position.append([row, col])
            }
        }
    }
    // bfs
    var result = 0
    tomato_bfs(position)
    
    if isTomatoComplete(at: box) {
        print(result - 1)
    } else {
        print(-1)
    }
}


func isTomatoComplete(at map: [[Int]]) -> Bool {
    for line in map {
        for tomato in line {
            if tomato == 0 {
                return false
            }
        }
    }
    
    return true
}

