//
//  primeMaking.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/13.
//

import Foundation

func primeMaking(_ nums:[Int]) -> Int {
    var answer = 0
    let sumNums = nums.reduce(0,+)
    var primeNumberArray = Array(repeating: -1, count: sumNums + 1)
    
    // 체
    for index in 2...sumNums { // 소수는 2부터 시작
        if primeNumberArray[index] == -1 { // 한번도 접근하지 않았으면 소수
            primeNumberArray[index] = 1 // 소수 체크
            var iterArgument = index + index // 2배수 부터 시작
            while iterArgument <= sumNums {
                primeNumberArray[iterArgument] = 0 // 합성수 체크
                iterArgument += index // 3,4,5.. 배수
            }
        }
    }
    
    // 합 소수 판단
    for firstIndex in 0..<nums.count-2 { // 첫번째 인자는 처음부터 총 길이의 -2까지
        for secondIndex in firstIndex+1..<nums.count-1 { // 두번째 인자는 첫번째 인자의 다음부터 총길이의 -1까지
            for thirdIndex in secondIndex+1..<nums.count { // 세번째 인자는 두번째인자의 다음부터 총길이까지
                let first = nums[firstIndex]
                let second = nums[secondIndex]
                let third = nums[thirdIndex]
                
                if primeNumberArray[first + second + third] == 1 { // 더한 수가 소수이면
                    answer += 1
                }
            }
        }
    }

    return answer
}
