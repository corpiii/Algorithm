//
//  security.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/04.
//

import Foundation

func security() {
    let block = readLine()!.split(separator: " ").map({Int(String($0))!})
    let width = block[0]
    let height = block[1]
    let perimeter = (width + height) * 2
    let count = Int(readLine()!)!
    
    var map: [Int] = []
    var security = 0
    
    for index in 0...count {
        let location = readLine()!.split(separator: " ").map({Int(String($0))!})
        let direction = location[0]
         
        var distance = 0
        
        if direction == 1 {
            distance = perimeter - location[1]
        } else if direction == 2 {
            distance = height + location[1]
        } else if direction == 3 {
            distance = location[1]
        } else if direction == 4 {
            distance = perimeter - width - location[1]
        }

        if index == count {
            security = distance
        } else {
            map.append(distance)
        }
    }
    
    var result = 0
    for location in map {
        if security > location {
            result += min(location + perimeter - security, security - location)
        } else {
            result += min(security + perimeter - location, location - security)
        }
    }
    
    print(result)
}


