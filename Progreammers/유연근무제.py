'''
schedules: 직원 희망 출근 시간 1<= <= 1000 700 <= 1100
timelogs: 일주일 출근 시간, 2차원 정수 배열 
startday: 이벤트 시작한 요일 1<= 7<=
- 1:월 7:일
시작 요일로 계산 5이면 배열의 시작은 금요일
'''
def solution(schedules, timelogs, startday):
    def actual_time(raw):
        if raw % 100 <= 59:
            return raw
        
        hour = raw // 100
        min = (raw % 100) - 60
        
        time = (hour + 1) * 100 + min
        return time
        
    answer = 0
    
    i = 0
    start = startday
    
    while i < len(schedules):
        schedule = schedules[i]
        times = timelogs[i]
        isDone = True
        # print("i:", i)
        for time in (times):
            # print(schedule, time, start)
            # 주말이면 스킵
            if 1 <= start <= 5:
                # 800 < 759 + 10 769 809
                # print(actual_time(time), actual_time(schedule + 1))
                if actual_time(time) > actual_time(schedule + 10):
                    isDone = False
                    break
            start += 1
            if start >= 8: start = 1
        if isDone:
            answer += 1    
        i += 1
        start = startday
    # print(answer)
    return answer

# solution([700, 800, 1100], [[710, 2359, 1050, 700, 650, 631, 659], [800, 801, 805, 800, 759, 810, 809], [1105, 1001, 1002, 600, 1059, 1001, 1100]], 5)
# solution([800], [[800, 810, 800, 810, 800, 810, 800]], 7)
solution([859], [[900, 810, 800, 810, 800, 810, 800]], 1)
# solution([700], [[710, 710, 710, 710, 710, 710, 710]], 2)