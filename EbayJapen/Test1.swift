//
//  Test1.swift
//  CodingTest
//
//  Created by seungwooKim on 4/6/24.
//

import Foundation

class Test1 {
    func solution(_ n:Int, _ 
                  recent:Int, _
                  recently_use:Int, _
                  total_use:Int, _
                  records:[[Int]]) -> [Int] {
        // 0: 최근 5일 1: 전체
        var appinfos: [(Int, Int)] = .init(repeating: (0, 0), count: n+1)
        var results: [Int] = .init()

        for record in records {
            let number = record[1]
            let day = record[0]
            let hour = record[2]
            if day <= recent {
                appinfos[number].0 += hour
            }
            appinfos[number].1 += hour
        }

//        print(appinfos)
        
        for (index, appinfo) in appinfos.enumerated() {
            if index == 0 { continue }
            if appinfo.0 <= recently_use && appinfo.1 < total_use {
                results.append(index)
            }
        }
//        print(results)
        
        return results
    }
}
