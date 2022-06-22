//
//  featureDevelop.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/22.
//

import Foundation

func featureDevelop(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = []
    var releaseDay: [Int] = []
    
    for (progress, speed) in zip(progresses, speeds) {
        releaseDay.append(Int(ceil(Double(100 - progress) / Double(speed))))
        // 올림(100 - 진행률 / 스피드) = 앞으로 필요한 날짜
    }
    
    var count = 0
    var firstRelease = releaseDay.first! // 처음 배포되는 작업
    
    releaseDay.forEach { day in
        if firstRelease >= day { // 이전 필요 날짜 >= 현재 필요 날짜
            count += 1 // 배포되는 기능 카운트
        } else {
            result.append(count) // 이전 필요 날짜 < 현재 필요 날짜
            firstRelease = day // 이전 필요 날짜 업데이트
            count = 1 // 현재 작업이 포함되어야 하기 때문에 1로 설정
        }
    }
    result.append(count) // 마지막 결과값 넣기

    return result
}
