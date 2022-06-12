//
//  numericStringToword.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/11.
//

import Foundation

//func numericStringToword(_ s:String) -> Int {
//    let stringArray = Array(s).map({ String($0) })
//    let pairOfNumbers = [
//        ("zero", "0"), ("one", "1"), ("two", "2"), ("three", "3"), ("four", "4"),
//        ("five", "5"), ("six", "6"), ("seven", "7"), ("eight", "8"), ("nine", "9")
//    ]
//
//    var result = ""
//    var convertBucket = ""
//
//    for letter in stringArray {
//        convertBucket += letter
//        if pairOfNumbers.contains(where: {$0.1 == convertBucket}) {
//            // 숫자 찾기
//            result += convertBucket
//            convertBucket = ""
//        } else if let numberIndex = pairOfNumbers.firstIndex(where: { $0.0 == convertBucket }){
//            // 문자 찾기
//            result += pairOfNumbers[numberIndex].1
//            convertBucket = ""
//        }
//    }
//    return Int(result)!
//}

func numericStringToword(_ s:String) -> Int {
    let stringArray = Array(s).map({ String($0) })
    let pairOfNumbers = ["zero","one","two","three","four","five","six","seven","eight","nine"]

    var result = ""
    var convertBucket = ""

    for letter in stringArray {
        convertBucket += letter
        if Int(convertBucket) != nil {
            // 숫자 찾기
            result += String(convertBucket)
            convertBucket = ""
        } else if let numberIndex = pairOfNumbers.firstIndex(of: convertBucket){
            // 문자 찾기
            result += String(numberIndex)
            convertBucket = ""
        }
    }
    return Int(result)!
}
