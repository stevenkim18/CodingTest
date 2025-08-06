N, M, R = map(int, input().split())

graph = [[] for _ in range(N+1)]
visited = [0] * (N+1)
order = [0] * (N+1)
cnt = 1

for i in range(M):
    u, v = map(int, input().split())
    graph[u].append(v)
    graph[v].append(u)

for n in graph:
    n.sort() # 내림차순으로 하려면 정렬을 오름차순으로 해야 된다.
    # n.sort(reverse=True) # 오름차순으로 하려면 정렬을 내림차순으로 해야 된다.(24479번 문제)

stack = [R]

while stack:
    node = stack.pop()
    if visited[node] == 0:
        visited[node] = 1
        order[node] = cnt
        cnt += 1
        for n in graph[node]:
            if visited[n] == 0:
                stack.append(n)
 
for i in range(1, N+1):
    print(order[i])
        





