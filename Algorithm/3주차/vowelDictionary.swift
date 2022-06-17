//
//  vowelDictionary.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/16.
//

import Foundation

let archive = ["A", "E", "I", "O", "U"]

func vowelDictionary(_ word:String) -> Int {

    let depth = 0
    var progressWord = ""
    var isFind = false
    var result = 0

    dfs(depth, &progressWord, word, &isFind, &result)

    return result
}

func dfs(_ depth: Int, _ progressWord: inout String, _ word: String, _ isFind: inout Bool, _ result: inout Int) {
    if depth == 5 { // 깊이가 5면 리턴
        return
    }
    
    for alphabet in archive { // 문자 순서대로 하나씩
        if isFind == false { // 찾지 못했으면
            progressWord.append(alphabet) // 문자를 넣음
            result += 1
            if progressWord == word { // progressWord의 문자가 word면 찾았다 표시
                isFind = true
            }
            dfs(depth + 1, &progressWord, word,  &isFind, &result) // depth + 1로 한층 내려가서 반복
            progressWord.removeLast() // 문자를 뺌
        }
    }
    
    func e() {
        
    }
}
