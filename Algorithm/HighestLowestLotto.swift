//
//  highestLowestLotto.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/05.
//

import Foundation

func highestLowestLotto(_ lottos: [Int], _ win_nums: [Int]) -> [Int] {
    let win_nums: Set = Set(win_nums)
    
    let correctCount: Int = win_nums.intersection(lottos).count
    let zeroNumberCount: Int = lottos.filter{ $0 == 0 }.count
    
    let lowestRank = min(7 - correctCount, 6)
    let highestRank = max(lowestRank - zeroNumberCount, 1)
    
    return [highestRank, lowestRank]
}
