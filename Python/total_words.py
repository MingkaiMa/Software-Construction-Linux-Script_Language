#!/usr/bin/python3

import sys
import re

nb_of_words = 0

for line in sys.stdin:
    lst = re.findall(r'[a-zA-Z]+', line)
    nb_of_words += len(lst)

print('{} words'.format(nb_of_words))

