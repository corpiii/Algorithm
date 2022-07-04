//
//  overtaking.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/04.
//

import Foundation

func overtaking() {
    let count = Int(readLine()!)!
    
    var input: [String] = []
    var output: [String] = []
    
    for _ in 1...count {
        input.append(readLine()!)
    }
    
    for _ in 1...count {
        output.append(readLine()!)
    }
    
    var overtakingCars: [String] = []
    
    var inputIndex = 0
    var outputIndex = 0
    while outputIndex < count {
        let inputCar = input[inputIndex]
        let outputCar = output[outputIndex]
        //print(inputCar, outputCar, terminator: " ")
        
        if inputCar != outputCar {
            if overtakingCars.contains(inputCar) { // 이미 얘 추월임
                inputIndex += 1
                //print()
            } else {
                overtakingCars.append(outputCar) // 추월차량 발견
                outputIndex += 1
                //print("!")
            }
        } else {
            inputIndex += 1
            outputIndex += 1
            //print()
        }
    }
    
    print(overtakingCars.count)
}
