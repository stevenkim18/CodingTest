//
//  1476.swift
//  CodingTest
//
//  Created by seungwooKim on 2/14/24.
//

import Foundation

class BaekJoon1476 {
    func run() {
        let input = readLine()!.split(separator: " ").map { Int(String($0)) }
        var E = 0
        var S = 0
        var M = 0
        var count = 0
        
        while true {
            count += 1
            E += 1
            S += 1
            M += 1
            if E > 15 {
                E = 1
            }
            if S > 28 {
                S = 1
            }
            if M > 19 {
                M = 1
            }
            if input[0] == E && input[1] == S && input[2] == M {
                break
            }
        }
        print(count)
        
    }
}
