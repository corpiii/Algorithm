//
//  clawCrain.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/06.
//

import Foundation

//func clawCrain(_ board:[[Int]], _ moves:[Int]) -> Int {
//    var score: Int
//    var board = board
//
//    rotate90andRemoveBlank(&board)
//    score = putInBasketForScoring(with: moves, for: &board)
//
//    return score
//}
//
//private func rotate90andRemoveBlank(_ board: inout [[Int]]) {
//    let N = board.count
//
//    for row in 0..<N {
//        for column in row..<N {
//            if row == column {
//                continue
//            }
//
//            let tempValue = board[row][column]
//            board[row][column] = board[column][row]
//            board[column][row] = tempValue
//        }
//    }
//
//    for row in 0..<N {
//        board[row].reverse()
//
//        while board[row].last == 0 {
//            board[row].remove(at: board[row].endIndex - 1)
//        }
//    }
//}
//
//private func putInBasketForScoring(with moves: [Int], for board: inout [[Int]]) -> Int {
//    var basket = [Int]()
//    var score = 0
//
//    moves.forEach {
//        if let doll = board[$0 - 1].popLast() {
//            basket.append(doll)
//            while isSameDoll(in: &basket) {
//                score += 2
//            }
//        }
//    }
//    return score
//}


func clawCrain(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var basket: [Int] = []
    var score = 0

    moves.forEach { line in
        var doll = 0
        for row in 0..<board.count {
            doll = board[row][line - 1]
            if doll != 0 {
                board[row][line - 1] = 0
                break
            }
        }

        if doll != 0 {
            basket.append(doll)
            while isSameDoll(in: &basket) {
                score += 2
            }
        }
    }
    return score
}


private func isSameDoll(in basket: inout [Int]) -> Bool {
    if basket.count < 2 {
        return false
    }

    let last = basket[basket.endIndex - 1]
    let penultimate = basket[basket.endIndex - 2]

    if last == penultimate {
        basket.removeLast(2)
        return true
    } else {
        return false
    }
}
