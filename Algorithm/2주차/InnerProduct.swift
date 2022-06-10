//
//  InnerProduct.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/10.
//

import Foundation

func InnerProduct(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map({ $0 * $1 }).reduce(0, +)
}
