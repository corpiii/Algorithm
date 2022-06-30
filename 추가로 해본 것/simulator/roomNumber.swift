//
//  roomNumber.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/28.
//

import Foundation

func roomNumber() {
    let numbers = Array(readLine()!).map({Int(String($0))!})
    var countNumbers = Array(repeating: 0, count: 9)
    
    for number in numbers {
        if number == 9 {
            countNumbers[6] += 1
        } else {
            countNumbers[number] += 1
        }
    }
    countNumbers[6] = Int(ceil( Double(countNumbers[6]) / Double(2) ))
    
    print(countNumbers.max()!)
}
