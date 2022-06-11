//
//  sugarDeliver.swift
//  Greedy
//
//  Created by 이정민 on 2022/06/10.
//

import Foundation
func sugarDeliver() {
    let kilogram = Int(readLine()!)!
    
    var total = kilogram
    for count5Kg in 0...(kilogram / 5) {
        let leftWeight = kilogram - (count5Kg * 5)
        var count3Kg = kilogram
        if leftWeight % 3 == 0 {
            count3Kg = leftWeight / 3
            total = total > count5Kg + count3Kg ? count5Kg + count3Kg : total
        }
    }
    
    if total == kilogram {
        print("-1")
    } else {
        print(total)
    }
    
}

//sugarDeliver()
