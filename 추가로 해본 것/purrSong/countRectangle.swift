//
//  countRectangle.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/06.
//

import Foundation

//func solutionPurr(rectangles: [[Int]]) {
//    var row_cliff = 0
//    var col_cliff = 0
//
//    for rectangle in rectangles {
//        let row = rectangle[2]
//        let col = rectangle[3]
//
//        row_cliff = max(row_cliff, row)
//        col_cliff = max(col_cliff, col)
//    }
//
//    var graph = Array(repeating: Array(repeating: false, count: col_cliff), count: row_cliff)
//    var result = 0
//    for rectangle in rectangles {
//        let row1 = rectangle[0]
//        let col1 = rectangle[1]
//        let row2 = rectangle[2]
//        let col2 = rectangle[3]
//
//        for row in row1..<row2 {
//            for col in col1..<col2 {
//
//                let node = graph[row][col]
//                if node == false {
//                    graph[row][col] = true
//                    result += 1
//                }
//            }
//        }
//    }
//    print(result)
//}
//
//let purr1 = [[0,1,4,4], [3,1,5,3]]
//let purr2 = [[1,1,6,5], [2,0,4,2], [2,4,5,7], [4,3,8,6], [7,5,9,7]]
//solutionPurr(rectangles: purr1)
//solutionPurr(rectangles: purr2)
