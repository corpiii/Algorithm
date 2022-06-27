//
//  targetNum.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/25.
//

import Foundation

func targetNum(_ numbers:[Int], _ target:Int) -> Int {
    func dfs(_ index: Int, _ progress: Int) {
        if index == numbers.count {
            if progress == target {
                result += 1
            }
            return
        }
        
        dfs(index + 1, progress + numbers[index])
        dfs(index + 1, progress - numbers[index])
    }
    
    var result = 0
    dfs(0, 0)
    
    return result
}
