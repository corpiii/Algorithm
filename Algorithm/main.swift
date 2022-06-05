//
//  main.swift
//  Algorithm
//
//  Created by 이정민 on 2022/06/03.
//
import Foundation

var lottos = [44, 1, 0, 0, 31, 25]
var win_nums = [31, 10, 45, 1, 6, 19]
print(highestLowestLotto(lottos, win_nums))

lottos = [0, 0, 0, 0, 0, 0]
win_nums = [38, 19, 20, 40, 15, 25]
print(highestLowestLotto(lottos, win_nums))

lottos = [45, 4, 35, 20, 3, 9]
win_nums = [20, 9, 3, 45, 4, 35]
print(highestLowestLotto(lottos, win_nums))

lottos = [1, 2, 3, 4, 5, 6]
win_nums = [38, 19, 20, 40, 15, 25]
print(highestLowestLotto(lottos, win_nums))
