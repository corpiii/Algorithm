//
//  treasure.swift
//  Greedy
//
//  Created by 이정민 on 2022/06/11.
//

import Foundation

func treasure() {
    let _ = readLine()
    
    var arrayA = readLine()!.split(separator: " ").map { Int($0)! }
    var arrayB = readLine()!.split(separator: " ").map { Int($0)! }
    
    arrayA.sort()
    arrayB.sort(by: >)
    
    print(zip(arrayA, arrayB).map(*).reduce(0, +))
}

