//
//  타겟넘버.swift
//  CodingTest
//
//  Created by seungwooKim on 2/5/24.
//

import Foundation

class 타겟넘버 {
    func solution(_ numbers:[Int], _ target:Int) -> Int {
        var array = [0]
        
        for number in numbers {
            var temps = [Int]()
            for element in array {
                temps.append(element+number)
                temps.append(element-number)
            }
            array = temps
        }
        
        return array.filter { $0 == target }.count
    }
}
