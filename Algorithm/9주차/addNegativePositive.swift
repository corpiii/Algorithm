//
//  addNegativePositive.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/29.
//

import Foundation

func addNegativePositive(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0
    
    for (index, value) in absolutes.enumerated() {
        if signs[index] == true {
            result += value
        } else {
            result -= value
        }
    }
    
    return result
}
