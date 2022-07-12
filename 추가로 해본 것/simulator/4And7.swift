//
//  4And7.swift
//  Algorithm
//  https://www.acmicpc.net/problem/2877
//  Created by 이정민 on 2022/07/12.
//

import Foundation

func fourAndSeven() {
    var n = Int(readLine()!)!
    var result = ""
    while n != 0 {
        if n % 2 == 1 {
            result += "4"
        } else {
            result += "7"
        }
        n = (n - 1) / 2
    }
    
    print(String(result.reversed()))
}
