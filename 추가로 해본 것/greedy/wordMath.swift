//
//  wordMath.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/13.
//

import Foundation

//func wordMath() {
//    let N = Int(readLine()!)!
//    var words: [[String]] = []
//    var maxLength = 0
//    var wordDictionary = [
//        "A" : -1, "B" : -1, "C" : -1, "D" : -1, "E" : -1, "F" : -1, "G" : -1,
//        "H" : -1, "I" : -1, "J" : -1, "K" : -1, "L" : -1, "M" : -1, "N" : -1,
//        "O" : -1, "P" : -1, "Q" : -1, "R" : -1, "S" : -1, "T" : -1, "U" : -1,
//        "V" : -1, "W" : -1, "X" : -1, "Y" : -1, "Z" : -1
//    ]
//    var wordNumber = 9
//
//    // 입력받기
//    for _ in 1...N {
//        let inputWord = Array(Array(readLine()!).map({String($0)}).reversed()) // 값을 reverse해서 넣어주기
//        maxLength = max(maxLength, inputWord.count) // 가장 긴 길이 찾기
//        words.append(inputWord)
//    }
//
//    var newWords = words
//    while maxLength != 0 { // 제일 긴 길이
//        for index in 0..<words.count { // words를 하나씩 인덱스로 반복
//            if newWords[index].count == maxLength { // word의 길이가 제일 긴 길이이면
//                if wordDictionary[words[index][maxLength-1]] == -1 { // 숫자가 할당되지 않은 알파벳이면
//                    wordDictionary[words[index][maxLength-1]] = wordNumber
//                    wordNumber -= 1
//                }
//                newWords[index].removeLast()
//            }
//        }
//        maxLength -= 1 // 최대 길이를 -1
//    }
//
//    var result = 0
//    for word in words {
//        var tempNumber = ""
//        for alpabet in word.reversed() {
//            tempNumber += String(wordDictionary[alpabet]!)
//        }
//        result += Int(tempNumber)!
//    }
//
//    print(result)
//}

func wordMath() {
    let N = Int(readLine()!)!
    var wordDictionary: [String : Int] = [:]
    var words: [[String]] = []
    for _ in 1...N {
        let input = Array(readLine()!).map({String($0)}).reversed()
        words.append(Array(input))
        for alphabet in input {
            wordDictionary[alphabet] = 0
        }
    }

    words.forEach { word in
        for (index, value) in word.enumerated() {
            wordDictionary[value]! += Int(pow(10, Double(index)))
        }
    }
    
    var result = 0
    var wordNumber = 9
    for word in wordDictionary.sorted(by: {$0.value > $1.value}) {
        result += wordNumber * word.value
        wordNumber -= 1
    }
    
    print(result)
}
