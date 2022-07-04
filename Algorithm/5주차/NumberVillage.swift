//
//  NumberVillage.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/30.
//

import Foundation

//func numberVillage() {
//    var result: [Int] = []
//
//    let total_row = Int(readLine()!)!
//    
//    var village: [[Int]] = []
//    for _ in 1...total_row {
//        let input = Array(readLine()!).map({Int(String($0))!})
//        village.append(input)
//    }
//    
//    // 집 위치(1) 기억
//    var house_locations: [(Int, Int)] = []
//    for row in 0..<total_row {
//        for col in 0..<total_row {
//            if village[row][col] == 1 {
//                house_locations.append((row, col))
//            }
//        }
//    }
//    
//    // 방문한 곳 Bool 배열
//    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: total_row), count: total_row)
//    
//    // 집 위치를 하나씩 반복
//    for location in house_locations {
//        let row = location.0
//        let col = location.1
//        
//        // 방문한 적 있는 집이면 dfs X
//        if visited[row][col] == false {
//            var count = 0 // 아파트 수
//            var stack: [(Int, Int)] = [location]
//            
//            while !stack.isEmpty { // dfs
//                let node = stack.removeLast()
//                
//                let node_row = node.0 // 뽑은 노드의 행, 열
//                let node_col = node.1
//                
//                if visited[node_row][node_col] == false { // 첫 방문이면
//                    visited[node_row][node_col] = true
//                    count += 1
//                    
//                    let x_move = [1, -1, 0, 0] // 위 아래 오른쪽 왼쪽
//                    let y_move = [0, 0, 1, -1]
//                    
//                    for (x, y) in zip(x_move, y_move) { // 스택에 사방 집어넣기
//                        let moved_row = node_row + x
//                        let moved_col = node_col + y
//                        
//                        // 인덱스 범위 체크
//                        if village.indices.contains(moved_row) && village[0].indices.contains(moved_col) {
//                            // 집이고(1) 방문한 적이 없다면(false) 스택에 푸시
//                            if village[moved_row][moved_col] == 1 && visited[moved_row][moved_col] == false {
//                                stack.append((moved_row, moved_col))
//                            }
//                        }
//                    }
//                }
//            }
//            
//            // 아파트 수 넣기
//            result.append(count)
//        }
//    }
//    
//    // 정렬
//    result.sort()
//    
//    print(result.count) // 총 단지 수
//    result.forEach({print($0)}) // 각 아파트 수
//}

