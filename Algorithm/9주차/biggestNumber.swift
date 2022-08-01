//
//  biggestNumber.swift
//  Algorithm
//
//  Created by 이정민 on 2022/08/01.
//

import Foundation

//func biggestNumber(_ numbers:[Int]) -> String {
//    var arranged: [String] = []
//
//    for number in numbers {
//        let strNumber = "\(number)"
//        if arranged.isEmpty {
//            arranged = [strNumber]
//        } else {
//            var biggestNumber = arranged.joined()
//            var numberIndex = 0
//
//            for addIndex in 0...arranged.count {
//                var candidate = ""
//                if addIndex == arranged.count {
//                    candidate = biggestNumber + strNumber
//                } else {
//                    for index in arranged.indices {
//                        if index == addIndex {
//                            candidate += strNumber
//                        }
//                        candidate += arranged[index]
//                    }
//                }
//
//                if candidate.count > biggestNumber.count {
//                    biggestNumber = candidate
//                    numberIndex = addIndex
//                } else if candidate.count == biggestNumber.count {
//                    if candidate > biggestNumber {
//                        biggestNumber = candidate
//                        numberIndex = addIndex
//                    }
//                }
//            }
//
//            arranged.insert(strNumber, at: numberIndex)
//        }
//    }
//
//    print(arranged.joined())
//    if arranged.first == "0" {
//        return "0"
//    } else {
//        return arranged.joined()
//    }
//}

func biggestNumber(_ numbers:[Int]) -> String {
    var numbers = numbers.map({String($0)})
    numbers.sort { first, second in
        if "\(first)\(second)" > "\(second)\(first)" {
            return true
        } else {
            return false
        }
    }
    print(numbers)
    return numbers.joined()
}
