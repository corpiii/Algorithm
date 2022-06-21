//
//  openChat.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/21.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var result: [String] = []
    var nickNameDict: [String : String] = [:]
    var in_outRecord: [[String]] = []
    
    record.forEach { chatInfo in
        let input = chatInfo.split(separator: " ").map({String($0)})
        let state = input[0] // 입장 퇴장 변경
        let user_id = input[1] // 유저 아이디
    
        if state == "Enter" || state == "Leave" { // 입장, 퇴장
            in_outRecord.append([user_id, state])
        }

        if state == "Enter" || state == "Change" { // 입장, 변경
            let nickName = input[2] // 입장, 변경 시에만 닉네임이 바뀌기 때문
            nickNameDict[user_id] = nickName
        }
    }
    
    in_outRecord.forEach { chatInfo in
        let user_id = chatInfo[0]
        let state = chatInfo[1]
        
        var paragraph = nickNameDict[user_id]! // 유저 닉네임
        if state == "Enter" {
            paragraph += "님이 들어왔습니다." // 입장시 추가
        } else {
            paragraph += "님이 나갔습니다." // 퇴장시 추가
        }
        result.append(paragraph)
    }
    
    return result
}
