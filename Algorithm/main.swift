//
//  main.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/03.
//
import Foundation

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

//fourAndSeven()
//
//var array = [(5, 0), (4, 2), (4, 1),(3, 2), (2, 3), (1, 4)]
//
//array.sort { first, second in
//    if first.0 < second.0 {
//        return true
//    } else if first.0 == second.0 {
//        if first.1 < first.0 {
//            return true
//        } else {
//            return false
//        }
//    } else {
//        return false
//    }
//}
//
//print(array)

let input = readLine()!.components(separatedBy: " ").map({Int($0)!})
let width = input[1]
let height = input[0]
var office: [[Int]] = []
for _ in 1...input[0] {
    let rowInfo = readLine()!.components(separatedBy: " ").map({Int($0)!})
    office.append(rowInfo)
}

typealias cctvType = Int
typealias col = Int
typealias row = Int
var cctvInfos: [(cctvType, row, col)] = []
var totalZeros = 0

for row in 0..<height {
    for col in 0..<width {
        if office[row][col] != 0 && office[row][col] != 6 {
            let cctvNumber = office[row][col]
            cctvInfos.append((cctvNumber, row, col))
        } else if office[row][col] == 0 {
            totalZeros += 1
        }
    }
}
var answer = totalZeros

func dfs(index: Int, office: [[Int]], coverWithCCTV: Int) {
    if index == cctvInfos.count {
        let cannotWatchArea = totalZeros - coverWithCCTV
        answer = min(cannotWatchArea, answer)
        return
    }

    var newOffice = office

    for direction in 0..<4 {
        let location = (cctvInfos[index].1, cctvInfos[index].2)
        let newCoverArea = watchCCTV(cctvInfos[index].0, direction, location, &newOffice)

        dfs(index: index + 1, office: newOffice, coverWithCCTV: coverWithCCTV + newCoverArea)
        newOffice = office
    }
}
func watchCCTV(_ type: Int, _ direction: Int, _ location: (Int, Int), _ office: inout [[Int]]) -> Int {
    var coverWithCCTV: Int = 0
    var directions = [Int]()
    directions.append(direction)
    switch type {
    case 2:
        let appendDir = (direction + 2) % 4
        directions.append(appendDir)
    case 3:
        let appendDir = (direction + 2) % 4
        directions.append(appendDir)
    case 4:
        let appendDir1 = (direction + 1) % 4
        let appendDir2 = (direction + 3) % 4
        directions.append(contentsOf: [appendDir1, appendDir2])
    case 5:
        (0...3).forEach { rotateCount in
            let appendDir = (direction + rotateCount) % 4
            directions.append(appendDir)
        }
    default:
        break
    }

    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]

    for direct in directions {
        var newRow = location.0 + dx[direct]
        var newCol = location.1 + dy[direct]
        while (newRow >= 0 && newCol >= 0 && newRow < height && newCol < width && office[newRow][newCol] != 6) {
            let newLocation = office[newRow][newCol]
            if newLocation == 0 {
                office[newRow][newCol] = -1
                coverWithCCTV += 1
            }
            newRow += dx[direct]
            newCol += dy[direct]
        }
    }

    return coverWithCCTV
}

dfs(index: 0, office: office, coverWithCCTV: 0)
print(answer)
