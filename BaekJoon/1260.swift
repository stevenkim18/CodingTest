//
//  1260.swift
//  CodingTest
//
//  Created by seungwooKim on 2/15/24.
//

import Foundation

class BaekJoon1260 {
    func run() {
        // 입력을 받는다
        let inputs = readLine()!.split(separator:" ").map { Int(String($0))! }
        
        // 정점의 개수만큰의 2차원 행렬을 만든다.
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: inputs[0]), count: inputs[0])
        var isVisited: [Bool] = Array(repeating: false, count: inputs[0])
        var stack = [Int]()
        var queue = [Int]()
        var dfs = [String]()
        var bfs = [String]()
        
        // 연결된 간선 받기
        for _ in 0..<inputs[1] {
            let inputLines = readLine()!.split(separator: " ").map { Int(String($0))! }
            let dot1 = inputLines[0] - 1
            let dot2 = inputLines[1] - 1
            
            matrix[dot1][dot2] = 1
            matrix[dot2][dot1] = 1
        }
        
        // DFS
        // 스택에 시작 되는 점 넣기.
        let firstNode = inputs[2] - 1
        stack.append(firstNode)
        // 최초 점 방문 처리
        isVisited[firstNode] = true
        dfs.append("\(firstNode+1)")
        
        while stack.isEmpty == false {
            guard let node = stack.last else { break }
//            let node = stack.removeLast() 이렇게 하면 스택에 2개 이상이 들어갈 수 없음.
            for (idx, dot) in matrix[node].enumerated() {
                if dot == 1, isVisited[idx] == false {
                    // 방문 처리
                    isVisited[idx] = true
                    stack.append(idx)
                    dfs.append("\(idx+1)")
                    break // 간선이 쭉 연결되어 있는 것으로 가려면 여기서 탈출 해야 함.
                }
                // 마지막인 경우
                // 더이상 연결되어 있는 점이 없기 떄문에 stack에서 pop!
                if idx >= matrix[node].count - 1 {
                    stack.removeLast()
                }
            }
        }
        
        //BFS
        isVisited = Array(repeating: false, count: inputs[0])
        // 큐에 시작이 되는 점 넣기
        queue.append(firstNode)
        isVisited[firstNode] = true
        bfs.append("\(firstNode+1)")
        
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            for (idx, dot) in matrix[node].enumerated() {
                if dot == 1, isVisited[idx] == false {
                    // 방문 처리
                    isVisited[idx] = true
                    queue.append(idx)
                    bfs.append("\(idx+1)")
                }
            }
        }
        
        print(dfs.joined(separator: " "))
        print(bfs.joined(separator: " "))
    }
}
