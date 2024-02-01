//
//  체육복.swift
//  CodingTest
//
//  Created by seungwooKim on 2/1/24.
//

import Foundation

// 전체 학생 수 n
// 체육복 없음 losd
// 체육복 있음 reserve
class 체육복 {
    func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        // 빈 배열을 만든다.
        var students = [Int](repeating: 1, count: n)
                
        // 잃어버린 학생 수를 체크한다.
        lost.forEach { lostNumber in
            students[lostNumber-1] -= 1
        }
        
        // 여분 있는 애들
        reserve.forEach { moreNumber in
            students[moreNumber-1] += 1
        }
        print(students)
        
        // 돌면서 0인애들은 찾는다. 자기 앞 번호에 옷 여분인 애를 찾는다.
        for idx in (0..<students.count) {
            // 옷이 없을 때
            if students[idx] == 0 {
                // 앞 번호
                if idx > 0 && students[idx-1] > 1 {
                    students[idx-1] -= 1
                    students[idx] += 1
                    continue
                }
                // 뒷 번호
                if (idx+1) < students.count && students[idx+1] > 1 {
                    students[idx+1] -= 1
                    students[idx] += 1
                    continue
                }
            }
        }
        print(students)
        let studentCount = students.filter { $0 > 0 }.count
        
        return studentCount
    }
}

