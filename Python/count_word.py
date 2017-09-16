#!/usr/bin/python3

import sys
import re

target_word = sys.argv[1]
nb_of_target_word = 0

for line in sys.stdin:
    lst = re.findall(r'[a-zA-Z]+', line)
    lst = [i.lower() for i in lst]
    nb_of_target_word += lst.count(target_word)

print('{} occurred {} times'.format(target_word, nb_of_target_word))

