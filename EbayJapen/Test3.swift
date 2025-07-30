//
//  Test3.swift
//  CodingTest
//
//  Created by seungwooKim on 4/6/24.
//

import Foundation

class Test3 {
    /*
     m 연속 여행 일  1 < m < 5000
     temperatures.count 총 여행일
     
     */
    func solution(_ m:Int,
                  _ temperatures:[Int],
                  _ clothes:[[Int]]) -> Int {
        var results: [Int] = .init()
        
        // 배열을 총 여행일 - 연속 여행일 만큼 돈다.
        //                           4            3 =1
        for startIndex in 0...temperatures.count-m {
            var availableCloth: [[Int]] = .init(repeating: .init(), count: clothes.count)
            var choiceCloths: [Int] = .init()
            for index in startIndex..<m+startIndex {
                print(temperatures[index])
                // 옷 비교
                for clothIndex in 0..<clothes.count {
                    // 1 1 1
                    // 1 1 2
                    let min = clothes[clothIndex][0]
                    let max = clothes[clothIndex][1]
                    print(min, temperatures[index], max)
                    if min <= temperatures[index] && temperatures[index] <= max {
                        availableCloth[clothIndex].append(index)
                    }
                }
            }
            let sortedAvailableCloth = availableCloth.sorted(by: { $0.count >  $1.count })
            print("sortedAvailableCloth = \(sortedAvailableCloth)")
            
            var count = 0
            
            for (i, cloths) in sortedAvailableCloth.enumerated(){
                cloths.forEach {
                    if choiceCloths.contains($0) == false {
                        choiceCloths.append($0)
                    } else {
                        
                    }
                }
            }
            
            print("availableCloth = \(availableCloth)")
            
        }
        
        print("========================================================")
//        print(results)
        return 0
    }
}
