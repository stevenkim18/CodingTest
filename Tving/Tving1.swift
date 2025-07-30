//
//  Tving1.swift
//  CodingTest
//
//  Created by seungwooKim on 2/7/24.
//

import Foundation

class Tving1 {
    func solution(_ strs:[String]) -> String{
        var answer = ""
        
        let strs: [[Character]] = strs.map { Array($0) }
        let longLength = strs.last?.count ?? 0
        let firstStr = strs.first ?? []
        
        let sortedStrs = strs.sorted(by: { $0.count < $1.count })
        
        for idx in (0..<longLength) {
            if firstStr.count <= idx {
                break
            }
            let firstChar = firstStr[idx]
            var count = 0
            for str in sortedStrs {
                if str[idx] == firstChar {
                    count += 1
                }
            }
            if count >= sortedStrs.count {
                answer += String(firstChar)
            } else {
                break
            }
        }
        return answer
    }
}
