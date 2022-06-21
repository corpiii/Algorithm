//
//  network.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/21.
//

import Foundation

func network(_ n:Int, _ computers:[[Int]]) -> Int {
    var result = 0
    var network: [Int : [Int]] = [:]
    for (index, computer) in computers.enumerated() {
        for (vertex, edge) in computer.enumerated() {
            if edge == 1 {
                if network.keys.contains(index+1) {
                    network[index+1]!.append(vertex+1)
                } else {
                    network[index+1] = [vertex+1]
                }
            }
        }
    }
    
    var visited: [Int] = []
    for vertex in network.keys {
        var queue: [Int] = [vertex]
        if !visited.contains(vertex) {
            while !queue.isEmpty {
                let node = queue.removeFirst()
                if !visited.contains(node) {
                    visited.append(node)

                    for adjacent in network[node]! {
                        if !visited.contains(adjacent) {
                            queue.append(adjacent)
                        }
                    }
                }
            }
            result += 1
        }
    }
    
    return result
}
