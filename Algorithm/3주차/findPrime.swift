//
//  findPrime.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/24.
//

import Foundation

func findPrime(_ numbers:String) -> Int {
    var result = 0
    
    var numbers = Array(numbers).map { String($0) }
    var allNumbers: [[String]] = []
    var primeCandidates: [Int] = []
    
    for number in numbers {
        for element in allNumbers {
            // 모든 숫자의 사이에 집어넣어서 새로운 숫자만들기
            for index in 0...element.count {
                var tempString = element
                tempString.insert(number, at: index)
                allNumbers.append(tempString)
            }
        }
        allNumbers.append([number])
    }
    // 중복제거
    primeCandidates = Array(Set(allNumbers.map {Int($0.reduce("", +))!}))
    
    // 체
    let maxNumber = primeCandidates.max()!
    var sieve = Array(repeating: 1, count: maxNumber + 1)
    sieve[0] = 0
    sieve[1] = 0
    
    for index in 2...maxNumber {
        if sieve[index] == 1 {
            for removeIndex in stride(from: index + index, through: maxNumber, by: index) {
                sieve[removeIndex] = 0
            }
        }
    }
    
    // 소수판별
    primeCandidates.forEach {
        if sieve[$0] == 1 {
            result += 1
        }
    }

    return result
}
