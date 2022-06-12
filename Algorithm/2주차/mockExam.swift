//
//  mockExam.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/12.
//

import Foundation

func mockExam(_ answers:[Int]) -> [Int] {
    let mathHaters = [
        [1, 2, 3, 4, 5],
        [2, 1, 2, 3, 2, 4, 2, 5],
        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    ]
    
    var haterResult = [0, 0, 0] // 수포자들의 점수판
    var maxScore = 0 // 최고 점수
    for problemNumber in answers.indices {
        let answer = answers[problemNumber] // 문제의 답
        let haterAnswers = [
            mathHaters[0][problemNumber % 5], // 각 수포자들의 답
            mathHaters[1][problemNumber % 8],
            mathHaters[2][problemNumber % 10]
        ]
        
        for answerIndex in haterAnswers.indices {
            if answer == haterAnswers[answerIndex] { // 수포자 채점
                haterResult[answerIndex] += 1 // 점수 1점 부여
                maxScore = max(maxScore, haterResult[answerIndex]) // 최고 점수 업데이트
            }
        }
    }
    
    var result: [Int] = []
    for mathHaterIndex in haterResult.indices { // 최고 점수자 반환
        if haterResult[mathHaterIndex] == maxScore {
            result.append(mathHaterIndex + 1)
        }
    }
    
    return result
}
