def solution(n, w, num):
    answer = 0
    # print("n=", n, "w=", w, "num=", num)
    
    # if n == num: return 1
    
    # 층 구하기
    floor = n // w
    
    
    if n % w != 0:
        floor += 1
    # print("floor:", floor)
    
    # 상자들
    boxs = [[] for _ in range(floor)]
    
    # print(floor)
    
    for i in range(floor):
        for j in range(w):
            value = j + i * w + 1            
            if i + 1 >= floor and value > n:
                boxs[i].append(0)
            else:
                boxs[i].append(value)
        
        if i % 2 == 1:
            boxs[i].reverse()
    # for i in range(floor):
    #     for j in range(w):
    #         print(boxs[i][j], end="")
        # print()
        
    boxFloor = num // w
    if num % w == 0:
        boxFloor -= 1
    location = 0
    if boxFloor % 2 == 0:
        if num % w == 0:
            location = w - 1
        else:
            location = num % w - 1
    else:
        if num % w == 0:
            location = 0
        else:
            location = w - num % w
        
    # print("boxFloor:", boxFloor)
    # print("location:", location)
    
    while boxFloor < floor:
        if boxs[boxFloor][location] == 0:
            break
        answer += 1
        boxFloor += 1 
    
    # print(answer)
    return answer

# solution(14, 4, 14)
# solution(12, 4, 12)
# solution(11, 4, 11)
# solution(10, 4, 10)
# solution(6, 5, 4)
