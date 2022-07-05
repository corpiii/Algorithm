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

func hideAndSeek2() {
    let input = readLine()!.components(separatedBy: " ").map({Int(String($0))!})
    var visited: [Int] = Array(repeating: -1, count: 100001)
    
    var count = 0
    hideAndSeekBFS(queue: [input[0]], target: input[1], depth: &count)
    
    print("""
          \(count)
          \(visited[input[1]])
          """)
    
    func hideAndSeekBFS(queue: [Int], target: Int, depth: inout Int) {
        if queue.isEmpty {
            return
        }
        
        var new_queue: [Int] = []
        for node in queue {
            if visited[node] == -1 { // 가장 빠른시간에 올 수 있는 거리 카운팅
                visited[node] = 1
            } else {
                visited[node] += 1
            }
            
            for move in [node - 1, node + 1, node * 2] {
                if 0 <= move && move <= 100000 {
                    if visited[move] == -1 { // 처음 오는 애들
                        new_queue.append(move)
                    }
                }
            }
        }
        
        if visited[target] != -1  {
            return
        }
        
        depth += 1
        hideAndSeekBFS(queue: new_queue, target: target, depth: &depth)
    }
}


func hideAndSeek3() {
    let input = readLine()!.components(separatedBy: " ").map({Int(String($0))!})
    var visited: [Int] = Array(repeating: -1, count: 100001)
    visited[input[0]] = 0
    var queue: [Int] = [input[0]]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        if node == input[1] {
            print(visited[node])
            break
        }
        
        let teleport = node * 2
        for move in [teleport, node - 1, node + 1] {
            if 0 <= move && move <= 100000 {
                if visited[move] == -1 {
                    if move == teleport {
                        visited[move] = visited[node]
                    } else {
                        visited[move] = visited[node] + 1
                    }
                    queue.append(move)
                }
            }
        }
    }
}



