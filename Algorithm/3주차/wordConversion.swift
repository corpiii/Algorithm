//
//  wordConversion.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/27.
//

import Foundation

func wordConversion(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var result = 0
    var wordsNetwork: [String : [String]] = [begin : []]
    var isTargetExist = false
    
    for word in words {
        if target == word { // 타겟이 존재하는지 체크
            isTargetExist = true
        }
        
        if isConversion(begin, to: word) { // 시작단어와의 네트워크
            wordsNetwork[begin]!.append(word)
        }
        
        for comparison in words { // 단어들 사이의 네트워크
            if word != comparison {
                if isConversion(word, to: comparison) { // 변환가능한지 체크
                    if wordsNetwork.keys.contains(word) { // 네트워크 연결
                        wordsNetwork[word]!.append(comparison)
                    } else {
                        wordsNetwork[word] = [comparison]
                    }
                }
            }
        }
    }
    
    if isTargetExist == false {
        return 0
    }
    
    // bfs
    var queue = [(begin, 0)]
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let word = node.0
        let count = node.1
        
        if word == target {
            result = count
            break
        }
        
        for adjacent in wordsNetwork[word]! {
            queue.append((adjacent, count + 1))
        }
    }
    
    return result
}

func isConversion(_ word: String, to comparison: String) -> Bool {
    var count = 0
    for index in word.indices { // 다른 문자의 갯수
        if word[index] != comparison[index] {
            count += 1
        }
    }
    
    if count == 1 { // 1개만 다르다면 가능
        return true
    } else {
        return false
    }
}
