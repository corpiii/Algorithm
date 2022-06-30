//
//  naver.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/28.
//

import Foundation

func naver(_ word:String) -> [Int] {
    let keyboard = [
        ["가","호","저","론","남","드","부","이","프","설"],
        ["알","크","청","울","키","초","트","을","배","주"],
        ["개","캠","산","대","단","지","역","구","너","양"],
        ["라","로","권","교","마","쿼","파","송","차","타"],
        ["코","불","레","뉴"," ","서","한","산","리","개"],
        ["터","강","봄","토","캠","상","호","론","운","삼"],
        ["보","람","이","경","아","두","프","바","트","정"],
        ["스","웨","어","쿼","일","소","라","가","나","도"],
        ["판","자","비","우","사","거","왕","태","요","품"],
        ["안","배","차","캐","민","광","재","봇","북","하"]
    ]
    let letters = Array(word).map{ String($0) }
    var coordinates:[String : [(Int, Int)]] = [:]

    for row in keyboard.indices {
        for col in keyboard[row].indices {
            let letter = keyboard[row][col]
            if word.contains(letter) {
                if coordinates.keys.contains(letter) {
                    coordinates[letter]!.append((row, col))
                } else {
                    coordinates[letter] = [(row, col)]
                }
            }
        }
    }

//    coordinates.forEach({print($0)})
    var combinations: [[(Int, Int)]] = []
    
    
    var progress: [(Int, Int)] = []
    naver_dfs(0, &progress)
    
    func naver_dfs(_ count: Int, _ progress: inout [(Int, Int)]) {
        if count == letters.count {
            combinations.append(progress)
            return
        }
        
        let letter = letters[count]
        if !coordinates.keys.contains(letter) {
            progress.append((0, 0))
            naver_dfs(count + 1, &progress)
            progress.removeLast()
        } else {
            for location in coordinates[letter]! {
                let row = location.0
                let col = location.1
                progress.append((row, col))
                naver_dfs(count + 1, &progress)
                progress.removeLast()
            }
        }
    }
    
    //print("word :",word)
    //combinations.forEach({print($0)})
    
    var result: [[Int]] = []
    for count in combinations.indices {
        var total: [Int] = []
        if combinations[count][0] == (0,0) {
            total.append(20)
        }
        
        for index in 1..<combinations[count].count {
            if combinations[count][index] == (0,0) {
                total.append(20)
            } else {
                if combinations[count][index-1] == (0,0) {
                    continue
                }
                let pre_row = combinations[count][index-1].0
                let pre_col = combinations[count][index-1].1
                let row = combinations[count][index].0
                let col = combinations[count][index].1
                
                total.append(abs(row - pre_row) + abs(col - pre_col))
            }
        }
        result.append(total)
    }
    //print(result)
    result = result.map { [$0.reduce(0, +), $0.count] }
    print(result.min(by: {$0[0] < $1[0]})!)
    return result.min(by: {$0[0] < $1[0]})!
}
