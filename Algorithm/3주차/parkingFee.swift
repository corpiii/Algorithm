//
//  parkingFee.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/18.
//

import Foundation

typealias CarNumber = Int
typealias Time = String
typealias TotalTime = Int

func parkingFee(_ fees:[Int], _ records:[String]) -> [Int] {
    var result: [Int] = []
    var parkingLot: [CarNumber : Time] = [:] // 주차장
    var parkingReceipt: [CarNumber : TotalTime] = [:] // 요금 영수증 Dict
    
    for record in records {
        let input = record.split(separator: " ")
        let recordTime = String(input[0])
        let carNumber = Int(input[1])!
        let _ = input[2]
        
        if parkingLot.keys.contains(carNumber) { // 주차장에 차가 있으면
            
            // 시간 계산
            let enterTime = parkingLot[carNumber]!
            let leaveTime = recordTime
            let term = timeDistance(from: enterTime, to: leaveTime)
            
            if parkingReceipt.keys.contains(carNumber) { // 이전 기록 조회
                parkingReceipt[carNumber]! += term // 기록에 시간 추가
            } else {
                parkingReceipt[carNumber] = term // 기록 생성
            }
            
            parkingLot.removeValue(forKey: carNumber) // 차 빼
            
        } else { // 주차장에 차가 없으면
            parkingLot[carNumber] = recordTime
        }
    }
    // 나머지 12시 너머까지 있는 자동차들 요금 계산
    for (remain, time) in parkingLot {
        let term = timeDistance(from: time, to: "23:59")
        
        if parkingReceipt.keys.contains(remain) { // 이전 기록 조회
            parkingReceipt[remain]! += term // 기록에 시간 추가
        } else {
            parkingReceipt[remain] = term // 기록 생성
        }
    }
    
    // 요금 계산
    for (_, totalTime) in parkingReceipt.sorted(by: {$0.key < $1.key}) {
        if totalTime < fees[0] {
            result.append(fees[1])
        } else {
            let fee = Int(ceil(Double((totalTime - fees[0])) / Double(fees[2]))) * fees[3]
            result.append(fee + fees[1])
        }
    }
    
    return result
}

func timeDistance(from start: String, to end: String) -> Int {
    let startTime = start.split(separator: ":").map({String($0)}) // 시작시간
    let startHour = Int(startTime[0])!
    let startMinute = Int(startTime[1])!
    
    let endTime = end.split(separator: ":").map({String($0)}) // 끝시간
    var endHour = Int(endTime[0])!
    var endMinute = Int(endTime[1])!
    
    if startMinute > endMinute {
        endMinute += 60
        endHour -= 1
    }
    
    let hour = endHour - startHour
    let minute = endMinute - startMinute
    
    return (hour * 60) + minute
}
