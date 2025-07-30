//
//  네트워크.swift
//  CodingTest
//
//  Created by seungwooKim on 2/5/24.
//

import Foundation

class 네트워크 {
    func solution(_ n:Int, _ computers:[[Int]]) -> Int {
        var count = 0
        var isVisited = [Bool](repeating: false, count: n)
        var stack = [Int]()
        
        for (i, lines) in computers.enumerated() {
            if isVisited[i] == true { continue }
            isVisited[i] = true
            
            // 연결된 노드를 검사함.
            stack.append(i)
            
            while stack.isEmpty == false {
                let target = stack.removeLast()
                
                for (j, _) in lines.enumerated() {
                    if i != j, computers[target][j] == 1, isVisited[j] == false {
                        stack.append(j)
                        isVisited[j] = true
                    }
                }
            }
            count += 1
        }
        
        return count
    }
}
