//
//  findPrime.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/24.
//

import Foundation

func findPrime(_ numbers:String) -> Int {
    var result = 0

    let numbers = Array(numbers).map { String($0) }
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

//func findPrime(_ numbers:String) -> Int {
//    var result = 0
//    let numbers = Array(numbers).map { String($0) }
//    let numbersIndices = Array(numbers.indices).map{String($0)} // 숫자 인덱스들
//
//    var allIndices: [String] = []
//    for number in numbersIndices { // 각 숫자로 시작하는 dfs
//        var start = number
//        dfs(progress: &start, depth: 0)
//        allIndices.append(number) // 자기자신 추가
//    }
//
//    // "12345"
//    // "024" -> "135" -> 135
//    var allNumbers = allIndices.map( { Int($0.map( { numbers[$0.wholeNumberValue!] } ).reduce("", +))! } )
//    allNumbers = Array(Set(allNumbers)) // 중복제거
//
//    // 체
//    let maxNumber = allNumbers.max()!
//    var sieve = Array(repeating: 1, count: maxNumber + 1)
//    sieve[0] = 0
//    sieve[1] = 0
//
//    for index in 2...maxNumber {
//       if sieve[index] == 1 {
//           for removeIndex in stride(from: index + index, through: maxNumber, by: index) {
//               sieve[removeIndex] = 0
//           }
//       }
//    }
//
//    for number in allNumbers {
//        if sieve[number] == 1 {
//            result += 1
//        }
//    }
//
//    func dfs(progress: inout String, depth: Int) {
//        if depth == numbers.count {
//            return
//        }
//
//        for number in numbersIndices {
//            if progress.contains(number) == false{
//                progress.append(number)
//                allIndices.append(progress) // 숫자 추가
//                dfs(progress: &progress, depth: depth + 1)
//                progress.removeLast()
//            }
//        }
//    }
//    return result
//}
