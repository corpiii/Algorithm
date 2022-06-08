//
//  SumbetweenTwoIntegers.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/08.
//

import Foundation

//func sumBetweenTwoIntegers(_ a:Int, _ b:Int) -> Int64 {
//    return Int64((min(a, b)...max(a, b)).reduce(0) { $0 + $1 })
//}

func sumBetweenTwoIntegers(_ a:Int, _ b:Int) -> Int64 {
//    let (a, b) = (min(a, b), max(a, b))
//    return Int64((a + b) * (b - a + 1) / 2)
    return Int64( ((a > b ? a*a - b*b : b*b - a*a) + a + b) / 2)
}
