//
//  travelRoute.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/27.
//

import Foundation

func travelRoute(_ tickets:[[String]]) -> [String] {
    @discardableResult // 경고문 제거
    func dfs(_ route: inout [String], _ current: String) -> Bool {
        if route.count == tickets.count + 1 { // 모든 티켓을 사용했을 경우
            result = route
            return true
        } else if !timeTable.keys.contains(current) { // 도착했는데 공항이 없는 경우
            return false
        } else {
            for arrival in timeTable[current]! { // 가능한 경로
                route.append(arrival) // 경로 추가
                timeTable[current]!.removeFirst() // 사용한 티켓 제거
                if dfs(&route, arrival) {
                    return true
                } else { // 경로를 못찾음
                    route.removeLast() // 온 길을 후진
                    timeTable[route.last!]!.append(arrival) // 티켓 돌려놓기
                }
            }
            return false // current의 루트가 아닌 경우
        }
    }
    
    var result: [String] = []
    var timeTable: [String : [String]] = [:]
    
    for ticket in tickets { // 티켓 네트워크 생성
        let departure = ticket[0]
        let arrival = ticket[1]
        
        if timeTable.keys.contains(departure) {
            timeTable[departure]!.append(arrival)
        } else {
            timeTable[departure] = [arrival]
        }
    }
    
    for index in timeTable.keys {
        timeTable[index]!.sort() // 사전순
    }
    
    var route: [String] = ["ICN"]
    dfs(&route, "ICN")
    
    return result
}
