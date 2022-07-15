//
//  upStair.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/15.
//

import Foundation

func upStair() {
    let stairCount = Int(readLine()!)!
    var stair: [Int] = [0]
    for _ in 1...stairCount {
        let score = Int(readLine()!)!
        stair.append(score)
    }
    
    var DP: [Int] = Array(repeating: 0, count: stairCount + 1)
    
    if stairCount == 1 {
        print(stair[1])
    } else if stairCount == 2 {
        print(stair[1] + stair[2])
    } else {
        DP[1] = stair[1]
        DP[2] = stair[1] + stair[2]
        
        for count in 3...stairCount {
            let score1 = DP[count - 3] + stair[count - 1] + stair[count]
            let score2 = DP[count - 2] + stair[count]
            DP[count] = max(score1, score2)
        }
        
        print(DP[stairCount])
    }
}
