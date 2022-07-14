//
//  studentNumber.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/12.
//

import Foundation

func studentNumber() {
    let count = Int(readLine()!)!
    
    var students: [String] = []
    
    for _ in 1...count {
        let student = readLine()!
        students.append(student)
    }
    
    var result = 0
    for index in stride(from: students[0].count - 1, through: 0, by: -1) {
        var numbers: [String] = []
        print(index)
        var isBreak = false

        for student in students {
            let number = student[student.index(after: student.index(student.startIndex, offsetBy: index - 1))]
            print(number)
//
//            if !numbers.contains(number) {
//                numbers.append(student[index])
//            } else {
//                isBreak = true
//                break
//            }
        }
        print()
        
        if isBreak == false {
            result = students[0].count - index
            break
        }
    }
    
    print(result)
}
