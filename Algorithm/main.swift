//
//  main.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/03.
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

// 로또 최저 순위와 최고 순위
//var lottos = [44, 1, 0, 0, 31, 25]
//var win_nums = [31, 10, 45, 1, 6, 19]
//print(highestLowestLotto(lottos, win_nums))

// 크레인 인형뽑기
//print(clawCrain([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))

// K번째 수
//var array = [1, 5, 2, 6, 3, 7, 4]
//var commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]
//print(numberKth(array, commands))

// 두 정수 사이의 합
//print(sumBetweenTwoIntegers(0, 10000000))
//print(sumBetweenTwoIntegers(5, 3))
//print(sumBetweenTwoIntegers(-3, 5))

// 가운데 글자 가져오기
//print(getCenterText("qwer"))
//print(getCenterText("abcde"))

// 내적
//print(InnerProduct([1, 2, 3, 4], [-3, -1, 0, 2]))

// 숫자 문자열과 영단어
//print(numericStringToword("2three45sixseven"))

// 소수만들기
//print(primeMaking([1,2,3,4,5,6,7]))

// 단어 수학
//wordMath()

//print(vowelDictionary("AAAAE"))
//print(vowelDictionary("AAAE"))
//print(vowelDictionary("I"))
//print(vowelDictionary("EIO"))

//print(vowelDictionary("AAA"))
//print(vowelDictionary("IOU"))

//
//let intArray: [Int] = [1, 2, 3, 4]
//var combinationArray: [[Int]] = []
//let numberOfPick: Int = 2
//
//func combinationWithRecursion(array: [(Int,Int)], pickCount: Int, index: Int = 0, tempArray: [(Int, Int)], combsArray: inout [[(Int, Int)]] -> [(Int, Int)] {
//    if tempArray.count == pickCount {
//        combsArray.append(tempArray)
//        return []
//    }
//
//    for i in index..<array.count {
//        combinationWithRecursion(array: array, pickCount: pickCount, index: i + 1, tempArray: tempArray + [array[i]], combsArray: &combsArray)
//    }
//
//    return combsArray
//}

//combinationWithRecursion(array: intArray, pickCount: numberOfPick, tempArray: [], combsArray: &combinationArray)
//print("4개의 값에서 2개를 고르는 조합의 수: \(combinationArray.count)개") //6개
//print(combinationArray)
//laboratory()

//valueInParentheses()

// 트럭
//crossTruck()

// 회문
//palindrome()

//security()

// overtaking()

//tetris()

//newCrew()

//hideAndSeek2()

//globalWarming()

//bomberMan()

//surfaceArea()

// tomato()

//populationMove()

//bulk()

//studentNumber()

//upStair()
//
//let fileio = FileIO()
//let count = fileio.readInt()
//var numbers: [Int16] = Array(repeating: 0, count: 10001)
//var result = ""
//
//for _ in 1...count {
//    let number = fileio.readInt()
//    numbers[number] += 1
//}
//
//for number in 1...10000 {
//    let count = numbers[number]
//    if count != 0 {
//        for _ in 1...count {
//            result.append("\(number)\n")
//        }
//    }
//}
//
//print(result)


//coordinateSort()
makeTriangle()
