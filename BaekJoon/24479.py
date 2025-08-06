import sys
sys.setrecursionlimit(10**9)

N, M, R = map(int, sys.stdin.readline().split())

graph = [[] for _ in range(N+1)]
visited = [0] * (N+1)
order = [0] * (N+1)
cnt = 1

for _ in range(M):
    u, v = map(int, sys.stdin.readline().split())
    graph[u].append(v)
    graph[v].append(u)

for n in graph:
    n.sort()
    
def dfs(v):
    global cnt
    visited[v] = 1
    order[v] = cnt
    cnt += 1
    
    for n in graph[v]:
        if not visited[n]:
            dfs(n)

dfs(R)

for i in range(1, N+1):
    print(order[i])