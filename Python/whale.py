#!/usr/bin/python3

import sys
import re

target_whale = sys.argv[1]

record = sys.stdin.readlines()

nb_of_pods = 0
nb_of_individuals = 0

for r in record:
    if target_whale in r:
        nb_of_pods += 1
        nb = re.sub(r'[^\d]*', '', r)
        nb_of_individuals += int(nb)



print('{} observations: {} pods, {} individuals'.format(target_whale,
                                                        nb_of_pods,
                                                        nb_of_individuals))
    
