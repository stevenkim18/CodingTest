//
//  LeetCode2085.swift
//  CodingTest
//
//  Created by seungwooKim on 2023/04/24.
//

import Foundation

class LeetCode2085 {
    
    private func filteredOnlyOneElements(input: [String]) -> [String] {
        let dict = input.reduce(into: [:]) { counts, number in
            counts[number, default: 0] += 1
        }
        
        return dict.filter { (key: String, value: Int) in
            return value == 1
        }.map { (key: String, value: Int) in
            key
        }
    }
    
    func countWords(_ words1: [String], _ words2: [String]) -> Int {
        
        let filteredWords1 = filteredOnlyOneElements(input: words1)
        let filteredWords2 = filteredOnlyOneElements(input: words2)
        
        var count = 0
        
        for word1 in filteredWords1 {
            if filteredWords2.contains(word1) {
                count += 1
            }
        }
        return count
    }
}
