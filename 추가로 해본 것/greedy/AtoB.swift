//
//  AtoB.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/11.
//

import Foundation

func AtoB() {
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    let a = input[0]
    var b = input[1]
    
    var count = 1
    
    while b > a {
        if b % 10 == 1 {
            b /= 10
            count += 1
        } else if b % 2 == 0 {
            b /= 2
            count += 1
        } else {
            break
        }
    }
    
    if a == b {
        print(count)
    } else {
        print(-1)
    }
}
