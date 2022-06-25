//
//  network_2.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/25.
//

import Foundation

func network_2(_ n:Int, _ computers:[[Int]]) -> Int {
    var result = 0
    
    var network: [Int : [Int]] = [:]
    for (index, computer) in computers.enumerated() {
        for (vertex, edge) in computer.enumerated() {
            if edge == 1 { // 연결되어 있으면
                if network.keys.contains(index + 1) {
                    network[index + 1]!.append(vertex + 1)
                } else {
                    network[index + 1] = [vertex + 1]
                }
            }
        }
    }

    var visited = Array(repeating: false, count: n + 1)
    for computer in 1...n {
        if visited[computer] == false { // 처음 들어올 때
            result += 1
            
            var queue = [computer]
            while !queue.isEmpty {
                let node = queue.removeFirst()
                
                if visited[node] == false {
                    visited[node] = true // 방문 표시
                    
                    for adjacent in network[node]! { // 연결된 네트워크 큐에 넣기
                        if visited[adjacent] == false { // 방문한 적이 없으면
                            queue.append(adjacent)
                        }
                    }
                }
            }
        }
    }
    
    return result
}
