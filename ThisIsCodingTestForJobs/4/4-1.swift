//
//  4-1.swift
//  CodingTest
//
//  Created by seungwooKim on 2/13/24.
//

import Foundation

class ThisIsCodingTestForJob4_1 {
    enum Direction: String {
        case left = "L"
        case right = "R"
        case up = "U"
        case down = "D"
        case none = ""
    }
    
    func run() {
        let input1 = Int(readLine() ?? "") ?? 0
        let input2 = (readLine() ?? "").split(separator: " ").map { String($0) }
        
        var location = (x: 0, y: 0)
        
        for input in input2 {
            let direction = Direction(rawValue: input) ?? .none
            switch direction {
            case .up:
                location.x -= 1
            case .left:
                location.y -= 1
            case .down:
                location.x += 1
            case .right:
                location.y += 1
            default: break
            }
            if location.x < 0 {
                location.x += 1
            }
            if location.y < 0 {
                location.y += 1
            }
            if location.x >= input1 {
                location.x -= 1
            }
            if location.y >= input1 {
                location.y -= 1
            }
        }
        print("\(location.x + 1) \(location.y + 1)")
    }
}
