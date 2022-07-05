//
//  hideAndSeek.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/05.
//

import Foundation

func hideAndSeek() {
    let input = readLine()!.components(separatedBy: " ").map({Int(String($0))!})
    var visited: [Int] = Array(repeating: 0, count: 100001)
    
    var queue: [Int] = [input[0]]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        if node == input[1] {
            print(visited[node])
            break
        }
        
        for move in [node - 1, node + 1, node * 2] {
            if 0 <= move && move <= 100000 {
                if visited[move] == 0 {
                    visited[move] = visited[node] + 1
                    queue.append(move)
                }
            }
        }
    }
}
