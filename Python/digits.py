#!/usr/bin/python3

import sys


lst = []

lines = sys.stdin.readlines()


for line in lines:
    line = line.translate(str.maketrans('0123456789', '<<<<<5>>>>'))
    print(line, end = '')



