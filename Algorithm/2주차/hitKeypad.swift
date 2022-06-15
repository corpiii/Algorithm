//
//  hitKeypad.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/15.
//

import Foundation

func hitKeypad(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    var leftHand = [3,1]
    var rightHand = [3,3]
    
    var row = 0
    var column = 0
    
    var leftDistance = 0
    var rightDistance = 0
    for number in numbers {
        if number == 0 { // 0일때 좌표 고정
            row = 3
            column = 2
        } else { // 숫자를 3으로 나눈 몫과 나머지로 숫자의 행,열을 표현
            row = number / 3
            column = number % 3
            if column == 0 { // 나누어 떨어지는 경우 몫을 1내리고 나머지를 3올림
                row -= 1
                column = 3
            }
        }
        
        if number == 1 || number == 4 || number == 7 {
            result += "L"
        } else if number == 3 || number == 6 || number == 9 {
            result += "R"
        } else { // 2, 5, 8, 0 인 경우
            leftDistance = abs(row - leftHand[0]) + abs(column - leftHand[1]) // 왼손과의 거리
            rightDistance = abs(row - rightHand[0]) + abs(column - rightHand[1]) // 오른손과의 거리
            
            if leftDistance < rightDistance { // 왼손이 더 가까우면
                result += "L"
            } else if rightDistance < leftDistance { // 오른손이 더 가까우면
                result += "R"
            } else if leftDistance == rightDistance { // 거리가 같으면
                if hand == "left" { // 왼손잡이
                    result += "L"
                } else if hand == "right" { // 오른손잡이
                    result += "R"
                }
            }
        }
        
        let handMove = result.last
        if handMove == "L" { // 왼손 위치 업데이트
            setHand(type: &leftHand, row, column)
        } else if handMove == "R" { // 오른손 위치 업데이트
            setHand(type: &rightHand, row, column)
        }
    }
    
    return result
}

func setHand(type hand: inout [Int], _ row: Int, _ column: Int) {
    hand[0] = row
    hand[1] = column
}
