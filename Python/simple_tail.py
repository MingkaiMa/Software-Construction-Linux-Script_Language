#!/usr/bin/python3

import sys

n = 10

file_list = sys.argv[1: ]

for f in file_list:
    lst = []
    with open(f) as file:
        for line in file:
            lst.append(line)
    
        
    if(len(lst) <= 10):
        for line in lst:
            print(line, end = '')
    else:
        for line in lst[len(lst) - n: ]:
            print(line, end = '')
            

