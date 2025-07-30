def solution(n, w, num):
    answer = 0
    
    # 총 층 수 계산
    num_floors = (n + w - 1) // w
    
    # 상자 채우기
    boxes = []
    for i in range(num_floors):
        start = i * w + 1
        end = start + w
        row = [x if x <= n else 0 for x in range(start, end)]
        if i % 2 == 1:
            row.reverse()
        boxes.append(row)

    # 목표 상자의 위치 계산
    target_floor = (num - 1) // w
    if target_floor % 2 == 0:
        target_index = (num - 1) % w
    else:
        target_index = w - 1 - (num - 1) % w

    # 해당 위치에서 아래로 세기
    for i in range(target_floor, num_floors):
        if boxes[i][target_index] == 0:
            break
        answer += 1

    return answer
