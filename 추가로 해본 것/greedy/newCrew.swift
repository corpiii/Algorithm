//
//  newCrew.swift
//  Algorithm
//
//  Created by 이정민 on 2022/07/05.
//

import Foundation

final class FileIO {
    private let buffer: Data
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        guard index < buffer.count else { return 0 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

func newCrew() {
    let fileIO = FileIO()
    let T = fileIO.readInt()
    for _ in 0..<T {
        let personCount = fileIO.readInt()
        var people: [Int] = Array(repeating: 0, count: personCount + 1)
        
        for _ in 0..<personCount {
            people[fileIO.readInt()] = fileIO.readInt()
        }
        
        var topGrade = people[0]
        var result = 1
        for index in 0..<personCount {
            let grade = people[index]
            
            if topGrade > grade {
                result += 1
                topGrade = grade
            }
        }

        print(result)
    }
}
