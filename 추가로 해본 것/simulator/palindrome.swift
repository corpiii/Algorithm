//
//  palindrome.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/04.
//


import Foundation

func palindrome() {
    let count = Int(readLine()!)!
    var results: [Int] = []
    
    for _ in 1...count {
        let word = Array(readLine()!)
        results.append(isPalindrome(word))
    }
    
    results.forEach({print($0)})
}

func isPalindrome(_ word: [Character]) -> Int {
    var startIndex = 0
    var endIndex = word.count - 1
    var isSimilar = false
    
    while startIndex < endIndex {
        let start = word[startIndex]
        let end = word[endIndex]
        if start != end {
            if isSimilar == true {
                return 2
            }
            
            if word[startIndex + 1] == end {
                startIndex += 1
                isSimilar = true
            } else if start == word[endIndex - 1] {
                endIndex -= 1
                isSimilar = true
            } else {
                return 2
            }
        }
        
        startIndex += 1
        endIndex -= 1
    }
        
    if isSimilar == true {
        return 1
    } else {
        return 0
    }
}
