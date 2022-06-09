//
//  GetCenterText.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/08.
//

import Foundation

//func getCenterText(_ s:String) -> String {
//    let center = s.index(s.startIndex, offsetBy: s.count / 2)
//
//    if s.count % 2 == 0 {
//        return String(s[s.index(before: center)...center])
//    } else {
//        return String(s[center])
//    }
//}

//func getCenterText(_ s:String) -> String {
//    let start = Int(floor(Double(s.count - 1) / 2))
//    let end = Int(ceil(Double(s.count - 1) / 2))
//    return String(Array(s)[start...end])
//}

func getCenterText(_ s:String) -> String {
    return String(s[String.Index(utf16Offset: (s.count - 1) / 2, in: s)...String.Index(utf16Offset: s.count / 2, in: s)])
}

