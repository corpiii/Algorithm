//
//  socialDistance.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/19.
//

import Foundation

func socialDistance(_ places:[[String]]) -> [Int] {
    var result: [Int] = []
    for place in places {
        let place = place.map({Array($0)}) // 배열로 바꿈
        var candidates: [(Int,Int)] = [] // 응시자의 위치
        for row in 0..<place.count {
            for column in 0..<place[row].count {
                if String(place[row][column]) == "P" {
                    candidates.append((row, column)) // 응시자의 위치 기억
                }
            }
        }
        var followRule = 1 // 룰을 지키는지 체크
        for candidate in candidates { // 응시자 기준 동서남북 체크, 막혀있지 않으면 한번 더 들어가서 체크
            let x_move = [0, -1, 0, 1] // 서, 북, 동, 남 인덱스 표현
            let y_move = [-1, 0, 1, 0]
            
            let row = candidate.0 // 응시자의 행, 열
            let col = candidate.1
            outerLoop:for index in 0...3 {
                let newRow = row + x_move[index] // 서, 북, 동, 남 한 곳씩
                let newCol = col + y_move[index]
                
                if place.indices.contains(newRow) && place[newRow].indices.contains(newCol) { // 인덱스가 존재하는지 체크
                    if place[newRow][newCol] == "P" { // 거리두기 안지키는 응시자 발견
                        followRule = 0
                        break outerLoop
                    } else if place[newRow][newCol] == "X" { // 막혀있으면
                        continue
                    } else if place[newRow][newCol] == "O" { // 빈곳이면
                        let x_deepMove: [Int] = x_move[index] == 0 ? [0, -1, 1] : [x_move[index], 0, 0] // 진행된 위치에서 상하좌우(왔던 곳은 제외)
                        let y_deepMove: [Int] = y_move[index] != 0 ? [y_move[index], 0, 0] : [0, -1, 1]
                        
                        for deepIndex in 0...2 {
                            let x_index = newRow + x_deepMove[deepIndex]
                            let y_index = newCol + y_deepMove[deepIndex]
                            if place.indices.contains(x_index) && place[x_index].indices.contains(y_index) { // 인덱스가 존재하는지 체크
                                if place[x_index][y_index] == "P" { // 거리두기 안지키는 응시자 발견
                                    followRule = 0
                                    break outerLoop
                                }
                            }
                        }
                    }
                }
            }
        }
        result.append(followRule)
    }
    return result
}
