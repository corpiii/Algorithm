//
//  DFS와 BFS.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/15.
//

import Foundation

func dfs_bfs() {
    let input = readLine()!.split(separator: " ").map({Int($0)!})
    let _ = input[0]
    let M = input[1]
    let start = input[2]
    var visited: [Int] = []
    
    var graph: [Int : [Int]] = [:]
    for _ in 1...M {
        let edge = readLine()!.split(separator: " ").map({Int($0)!})
        if graph.keys.contains(edge[0]) {
            graph[edge[0]]?.append(edge[1])
        } else {
            graph[edge[0]] = [edge[1]]
        }
        
        if graph.keys.contains(edge[1]) {
            graph[edge[1]]?.append(edge[0])
        } else {
            graph[edge[1]] = [edge[0]]
        }
    }
    
    for key in graph.keys {
        graph[key]!.sort()
    }
    
    dfs(graph, &visited, start)
    print()
    visited = []
    bfs(graph, &visited, [start])
    print()
}

func dfs(_ graph: [Int : [Int]], _ visited: inout [Int], _ start: Int) {
    
    print(start, terminator: " ")
    visited.append(start)
    
    if graph[start] != nil {
        for node in graph[start]! {
            if !visited.contains(node) {
                dfs(graph, &visited, node)
            }
        }
    }
}

func bfs(_ graph: [Int : [Int]], _ visited: inout [Int], _ queue: [Int]) {
    if queue.isEmpty {
        return
    }
    
    var nextQueue: [Int] = []
    for node in queue {
        if !visited.contains(node) {
            print(node, terminator: " ")
            visited.append(node)
            
            if graph[node] != nil {
                for adjacent in graph[node]! {
                    if !visited.contains(adjacent) {
                        nextQueue.append(adjacent)
                    }
                }
            }
        }
    }
    bfs(graph, &visited, nextQueue)
}

