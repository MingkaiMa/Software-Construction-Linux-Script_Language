#!/usr/bin/python3

import sys
import re
from collections import defaultdict

record = sys.stdin.readlines()
dic = defaultdict(list)

for r in record:
    r = r.lower()
    r = re.sub(r's$', '', r)
    r = re.sub(r'\s+', ' ', r)
    whale_name = re.sub(r'^[0-9 ]+', '', r)
    nb_of_individuals = int(re.sub(r'[^0-9]*', '', r))
    if whale_name not in dic:
        dic[whale_name].append(1)
        dic[whale_name].append(nb_of_individuals)
    else:
        dic[whale_name][0] += 1
        dic[whale_name][1] += nb_of_individuals
      



    
for key in sorted(dic):
    print('{}observations:'.format(key),
          '{} pods,'.format(dic[key][0]),
          '{} individuals'.format(dic[key][1]))


