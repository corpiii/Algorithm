//
//  truck.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/04.
//

import Foundation

private class Truck {
    let weight: Int
    var distance: Int

    init(weight: Int, distance: Int) {
        self.weight = weight
        self.distance = distance
    }
}

func crossTruck() {
    let input = readLine()!.components(separatedBy: " ").map {Int(String($0))!}
    let weights = readLine()!.components(separatedBy: " ").map {Int(String($0))!}
    var result = 0

    let truckCount = input[0]
    let bridgeLength = input[1]
    let bridgeWeight = input[2]

    var trucks: [Truck] = []
    for weight in weights {
        trucks.append(Truck(weight: weight, distance: bridgeLength))
    }

    var weight = 0 // 다리에 올라간 트럭 하중
    var trucksOnBridge: [Int] = [0, -1] // 다리에 올라간 트럭 첫번째 번호, 마지막 번호
    
    while trucksOnBridge[1] != truckCount - 1 {
        let truck = trucks[trucksOnBridge[1] + 1]
        // 트럭무게 + 다리에 올라간 트럭무게 <= 다리 하중
        if truck.weight + weight <= bridgeWeight {
            weight += truck.weight
            trucksOnBridge[1] += 1
        }

        for index in trucksOnBridge[0]...trucksOnBridge[1] {
            let truck = trucks[index]
            truck.distance -= 1
            if truck.distance == 0 {
                trucksOnBridge[0] += 1
                weight -= truck.weight
            }
        }
        result += 1
    }
    
    result += trucks[trucksOnBridge[1]].distance + 1
    print(result)
}
