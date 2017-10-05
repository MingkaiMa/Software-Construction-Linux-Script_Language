#!/usr/bin/python3
import sys

max_value = float('inf')
L = []
S = []

dic_word_to_number = {}
dic_number_to_word = {}

for arg in sys.argv[1: ]:
    L.append(arg)

for line in sys.stdin.readlines():
    s = line.split()
    S.append(s)
    if s[0] not in L:
        L.append(s[0])
    if s[1] not in L:
        L.append(s[1])

for i in range(len(L)):
    dic_word_to_number[L[i]] = i
    dic_number_to_word[i] = L[i]

number_of_node = len(L)
matrix = [[max_value] * number_of_node for _ in range(number_of_node)]

for s in S:
    matrix[dic_word_to_number[s[0]]][dic_word_to_number[s[1]]] = float(s[2])
    matrix[dic_word_to_number[s[1]]][dic_word_to_number[s[0]]] = float(s[2])


for i in range(number_of_node):
    for j in range(number_of_node):
        if(i == j):
            matrix[i][j] = 0

D = [max_value] * number_of_node
P = [-1] * number_of_node
S = [0] * number_of_node
def dijkstra(start_node, matrix, number_of_node):
    for i in range(number_of_node):
        D[i] = matrix[start_node][i]
        if(D[i] != max_value):
            P[i] = start_node


    S[start_node] = 1
    for i in range(number_of_node):
        min_value = max_value
        for j in range(number_of_node):
            if((not S[j]) and D[j] < min_value):
                min_value = D[j]
                k = j

        S[k] = 1
        for j in range(number_of_node):
            if((not S[j]) and D[j] > D[k] + matrix[k][j]):
                D[j] = D[k] + matrix[k][j]
                P[j] = k
                
start_node = dic_word_to_number[sys.argv[1]]
dest_node = dic_word_to_number[sys.argv[2]]
dijkstra(start_node, matrix, number_of_node)

path = []
if(D[dest_node] != max_value):
    if(D[dest_node] != max_value.is_integer()):
        shortest_length = int(D[dest_node])
    else:
        shortest_length = D[dest_node]
    print('Shortest route is length = {}: '.format(shortest_length), end = '')

    trace_node = dest_node
    path.append(dest_node)
    while(True):
        trace_node = P[trace_node]
        if(trace_node != start_node):
            path.append(trace_node)
            continue
        else:
            path.append(trace_node)
            break
    for i in range(len(path) - 1, -1, -1):
        if(i == 0):
            print(dic_number_to_word[path[i]], end = '.')
            print()
        else:
            print(dic_number_to_word[path[i]], end = ' ')
            

else:
    print('No route between two cities.')
    
