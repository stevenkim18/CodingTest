def solution(video_len, pos, op_start, op_end, commands):
    def str_to_time(str):
        values = list(map(int, str.split(":")))
        hour = values[0]
        min = values[1]
        return hour, min

    def do_command(time, com, start, end, len):
        result = time
        if start <= result <= end:
            result = end
        
        if com == "next":
            result = (result[0], result[1] + 10)
        else:
            # 분이 음수인 경우 처리
            result = (result[0], result[1] - 10)
        
        if result[1] >= 60:
            result = (result[0] + 1, result[1] - 60)
        # 분이 음수인 경우 처리
        elif result[1] < 0:
            result = (result[0] - 1, result[1] + 60)
            
        if result > len:
            result = len
        
        if result < (0, 0):
            result = (0, 0)
        
        if start <= result <= end:
            result = end
        
        return result
    
    def time_to_str(time):
        
        hour = str(time[0])
        min = str(time[1])

        if len(hour) == 1:
            hour = "0" + hour
        
        if len(min) == 1:
            min = "0" + min
        
        return hour + ":" + min
    
    video_len = str_to_time(video_len)
    pos = str_to_time(pos)
    op_start = str_to_time(op_start)
    op_end = str_to_time(op_end)
    
    result = pos
    answer = ''
    
    for command in commands:
        result = do_command(result, command, op_start, op_end, video_len)
    # print(result)
    
    answer = time_to_str(result)
    
    # print(answer)
    return answer
    
# 첫 번째 케이스
solution("34:33", "13:00", "00:55", "02:55", ["next", "prev"])

# 두 번째 케이스
solution("10:55", "00:05", "00:15", "06:55", ["prev", "next", "next"])

# 세 번째 케이스
solution("07:22", "04:05", "00:15", "04:07", ["next"])

solution("10:00", "01:00", "00:15", "00:19", ["prev"])


'''
- 10초전
    - 10초 미만일 경우 0분 0초로
- 10초후
    - 10초 미만일 경우 맨 끝으로
    - 마지막 위치와 길이는 같음
- 오프닝으로
    - op_start op_end

video_len: 동영상 길이 "34:33"
pos: 재생 위치
pos: 

'''