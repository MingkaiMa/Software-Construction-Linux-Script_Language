#!/usr/bin/python

import sys
import re

if(len(sys.argv) != 3):
    print('Usage: {} <number of lines> <string>'.format(sys.argv[0]))
    sys.exit(1)

match = re.match(r'^[0-9]+$', sys.argv[1])

if not match:
    print('{}: argument 1 must be a non-negative integer'.format(sys.argv[0]))
    sys.exit(1)

string = sys.argv[2]

for i in range(int(sys.argv[1])):
    print(string)

