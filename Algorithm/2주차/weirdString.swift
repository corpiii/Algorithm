//
//  ㄹㄹ.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/13.
//

import Foundation

func weirdString(_ s:String) -> String {
    var result = Array(s).map({String($0)})
    var isEvenIndex = true
    for index in 0..<result.count {
        if result[index] == " " { // 공백일 경우
            isEvenIndex = true
        } else if isEvenIndex == true { // 짝수 인덱스일 경우
            result[index] = result[index].uppercased()
            isEvenIndex = false
        } else {                        // 홀수 인덱스일 경우
            result[index] = result[index].lowercased()
            isEvenIndex = true
        }
    }
    return result.reduce("", +)
}
