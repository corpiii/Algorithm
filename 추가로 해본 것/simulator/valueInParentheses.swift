//
//  valueInParentheses.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/30.
//

import Foundation

func valueInParentheses() {
    let input = Array(readLine()!).map({String($0)})
    
    var checkStack: [String] = []
    
    // 온전한 배열 체크
    for value in input {
        if value == ")" {
            if checkStack.isEmpty {
                print(0)
                return
            }
            
            if checkStack.last == "(" {
                checkStack.removeLast()
            }
        } else if value == "]" {
            if checkStack.isEmpty {
                print(0)
                return
            }
            
            if checkStack.last == "[" {
                checkStack.removeLast()
            }
        } else { // "(", "["
            checkStack.append(value)
        }
    }
    
    if !checkStack.isEmpty {
        print(0)
        return
    }
    
    var stack: [Any] = []
    // 배열 넣고 계산
    for value in input {
        if value == ")" {
            var temp = 0
            
            while stack.last is Int {
                temp += stack.removeLast() as! Int
            }
            stack.removeLast()
            
            if temp == 0 {
                stack.append(2)
            } else {
                stack.append(temp * 2)
            }
            
        } else if value == "]" {
            var temp = 0
            
            while stack.last is Int {
                temp += stack.removeLast() as! Int
            }
            stack.removeLast()
            
            if temp == 0 {
                stack.append(3)
            } else {
                stack.append(temp * 3)
            }
            
        } else {
            stack.append(value)
        }
    }
    
    var result = 0
    while !stack.isEmpty {
        result += stack.removeLast() as! Int
    }
    
    print(result)
}

