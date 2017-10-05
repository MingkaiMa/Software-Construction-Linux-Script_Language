#!/usr/bin/python3

import sys
import re
import subprocess
from collections import defaultdict
dic = {}

for url in sys.argv[1: ]:
    if(url == '-f'):
        continue
    webpage = subprocess.check_output(['wget', '-q', '-O-', url], universal_newlines=True)
    L = webpage.split('\n')
    for line in L:
        line = line.lower()
        tag_1 = re.findall(r'<[a-z0-9]+>', line)
        tag_2 = re.findall(r'<[a-z0-9]+ ', line)
        tag = tag_1 + tag_2
        for t in tag:
            t = re.sub(r'[^a-z0-9]', '', t)
            if t not in dic:
                dic[t] = 1
            else:
                dic[t] += 1

dic_2 = defaultdict(list)

if '-f' in sys.argv[1: ]:
    for tag in sorted(dic, key = dic.get):

        dic_2[dic[tag]].append(tag)
        
    for number in sorted(dic_2):
        for tag in sorted(dic_2[number]):
            print(tag, number)

else:
    for tag in sorted(dic):
        print(tag, dic[tag])
        
