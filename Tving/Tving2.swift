//
//  Tving2.swift
//  CodingTest
//
//  Created by seungwooKim on 2/7/24.
//

import Foundation

class Tving2 {
    func isAlphabetic(_ s: String) -> Bool {
        return !s.isEmpty && s.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
    }
    
    func solution(_ logs:[String]) -> Int {
        var answer = 0
        for log in logs {
            // 길이가 100이 넘는 경우
            if log.count > 100 {
                answer += 1
                continue
            }
            
            // " : "로 자르기
            let temps = log.components(separatedBy: " : ")

            // 공백으로 한 번 더 자르기
            let logArray = temps.flatMap { $0.components(separatedBy: " ")}
            print(logArray)
            
            // 배열이 8개 아닌 경우 탈락
            if logArray.count != 8 {
                answer += 1
                continue
            }
            
            // 팀이름
            if logArray[0] != "team_name" {
                answer += 1
                continue
            }
            
            if isAlphabetic(logArray[1]) == false {
                answer += 1
                continue
            }
            
            // 앱이름
            if logArray[2] != "application_name" {
                answer += 1
                continue
            }
            
            if isAlphabetic(logArray[3]) == false {
                answer += 1
                continue
            }
            
            // 에러레벨
            if logArray[4] != "error_level" {
                answer += 1
                continue
            }
            
            if isAlphabetic(logArray[5]) == false {
                answer += 1
                continue
            }
            
            // 메세지
            if logArray[6] != "message" {
                answer += 1
                continue
            }
            
            if isAlphabetic(logArray[7]) == false {
                answer += 1
                continue
            }
        }
        return answer
    }
}
