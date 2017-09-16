#!/usr/bin/python3

import sys
import re
import glob
from collections import defaultdict

target_word = sys.argv[1]
data = defaultdict(list)

nb_of_words = 0
nb_of_target_word = 0

for file in glob.glob('lyrics/*.txt'):
    nb_of_words = 0
    nb_of_target_word = 0
    with open(file) as f:
        for line in f:
            lst = re.findall(r'[a-zA-Z]+', line)
            lst = [i.lower() for i in lst]
            nb_of_words += len(lst)
            nb_of_target_word += lst.count(target_word)
        data[file].append(nb_of_words)
        data[file].append(nb_of_target_word)


for file in sorted(data):
    l = file.split('/')
    file_name = l[1][:(len(l[1])- 4)]
    file_name = re.sub(r'[^a-zA-Z]',' ', file_name)
    print('{:4d}/{:6d} = {:.9f} {}'.format(data[file][1], data[file][0],
                                  data[file][1] / data[file][0],
                                  file_name))
