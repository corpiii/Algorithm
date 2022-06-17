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

var dict: [Int : String] = [:]
dict[35] = "e"
dict[38] = "g"
dict[44] = "c"
print(dict)

for i in dict.sorted(by: {$0.key < $1.key}) {
    print(i)
}
print(dict)

print(Int("0000")!)

print("34" < "332")
