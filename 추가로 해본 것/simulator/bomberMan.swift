//
//  BomberMan.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/06.
//

import Foundation

private class Bomb {
    var timer: Int
    var state: Int
    
    init(timer: Int = 0, state: Int) {
        self.timer = timer
        self.state = state
    }
}

func bomberMan() {
    let input = readLine()!.components(separatedBy: " ").map({Int(String($0))!})
    
    var map: [[Bomb]] = []
    for _ in 1...input[0] {
        let line = Array(readLine()!).map({String($0)})
        var bomb: [Bomb] = []
        for col in line.indices {
            let object = line[col]
            if object == "O" {
                bomb.append(Bomb(timer: 2, state: 2))
            } else if object == "." {
                bomb.append(Bomb(state: 0))
            }
        }
        map.append(bomb)
    }

    if input[2] >= 2 {
        for second in 2...input[2] {
            // state 1 인곳 진화
            subjugation(at: &map)
            
            // state 2 이고, 타이머 3인 곳 터뜨리기 후 state 1로 변경
            // 아니면 타이머 + 1
            boom(at: &map)
            
            // state 0 인곳 폭탄 넣기
            setBomb(at: &map)
            
            // state 2 인 곳 타이머 + 1
            runTimer(at: &map)
        
        }
    }
    printMap(map)
}

private func printMap(_ map: [[Bomb]]) {
    var result = ""
    for line in map {
        for bomb in line {
            if bomb.state == 0 || bomb.state == 1 {
                result += "."
            } else {
                result += "O"
            }
        }
        result += "\n"
    }
    print(result)
}

private func setBomb(at map: inout [[Bomb]]) {
    for row in map.indices {
        for col in map[0].indices {
            let bomb = map[row][col]
            if bomb.state == 0 {
                bomb.state = 2
                bomb.timer = 0
            }
        }
    }
}

private func boom(at map: inout [[Bomb]]) {
    var booms: [[Int]] = []
    
    for row in map.indices {
        for col in map[0].indices {
            let bomb = map[row][col]
            if bomb.state == 2 {
                if bomb.timer == 3 {
                    booms.append([row, col])
                }
            }
        }
    }
    
    // state 2, timer 3 boom
    for boom in booms {
        let row = boom[0]
        let col = boom[1]
        
        let x_move = [0, 1, -1, 0, 0]
        let y_move = [0, 0, 0, 1, -1]

        for move in zip(x_move, y_move) {
            let new_row = row + move.0
            let new_col = col + move.1

            if 0 <= new_row && new_row < map.count && 0 <= new_col && new_col < map[0].count {
                let bomb = map[new_row][new_col]
                bomb.state = 1
                bomb.timer = 0
            }
        }
    }
    
}

// state 1 인 곳 진화
private func subjugation(at map: inout [[Bomb]]) {
    for row in map.indices {
        for col in map[0].indices {
            let bomb = map[row][col]
            if bomb.state == 1 {
                bomb.state = 0
                bomb.timer = 0
            }
        }
    }
}

private func runTimer(at map: inout [[Bomb]]) {
    for row in map.indices {
        for col in map[0].indices {
            let bomb = map[row][col]
            if bomb.state == 2 {
                bomb.timer += 1
            }
        }
    }
}
