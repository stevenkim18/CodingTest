//
//  타겟넘버.swift
//  CodingTest
//
//  Created by seungwooKim on 2/5/24.
//

import Foundation

class 타겟넘버 {
    func solution(_ numbers:[Int], _ target:Int) -> Int {
        var count = 0
        
        func dfs(_ index: Int, _ sum: Int) {
            if index == numbers.count - 1 {
                if sum == target {
                    count += 1
                }
                return
            }
            
            dfs(index+1, sum + numbers[index + 1])
            dfs(index+1, sum - numbers[index + 1])
        }
        
        dfs(-1, 0)
        
        return count
    }
}
