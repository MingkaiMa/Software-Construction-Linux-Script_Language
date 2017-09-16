#!/usr/bin/python3
##Written By Mingkai_Ma

import sys
import glob
import re
import math


debug_flag = False
for song_file in sys.argv[1: ]:
    if(song_file == '-d'):
        debug_flag = True
        continue
    words_in_song_file = []
    with open(song_file) as f:
        for line in f:
            lst = re.findall(r'[a-zA-Z]+', line)
            lst = [i.lower() for i in lst]
            words_in_song_file += lst

    identify_data = {}

    

    for artist_file in glob.glob('lyrics/*.txt'):
        total_words = 0
        total_log_pro = 0
        words_in_artist_file = {}
        with open(artist_file) as f:
            for line in f:
                lst = re.findall(r'[a-zA-Z]+', line)
                lst = [i.lower() for i in lst]
                total_words += len(lst)
                for w in lst:
                    if w in words_in_song_file:
                        if w not in words_in_artist_file:
                            words_in_artist_file[w] = 1
                        else:
                            words_in_artist_file[w] += 1
        for word in words_in_song_file:
            if word in words_in_artist_file:
                total_log_pro += math.log((words_in_artist_file[word] + 1) / total_words)
            else:
                total_log_pro += math.log((0 + 1) / total_words)
        identify_data[total_log_pro] = artist_file
                        

    max_logpro = max(identify_data)
    if(debug_flag):
        for logpro in sorted(identify_data, reverse = True):
            l = identify_data[logpro].split('/')
            file_name = l[1][:(len(l[1])- 4)]
            file_name = re.sub(r'[^a-zA-Z]',' ', file_name) 
            print('{}: log_probability of {:4.1f} for {}'.format(song_file, logpro, file_name))
    l = identify_data[max_logpro].split('/')
    file_name = l[1][:(len(l[1])- 4)]
    file_name = re.sub(r'[^a-zA-Z]',' ', file_name)            
    print('{} most resembles the work of {} (log-probability={:4.1f})'.format(song_file, file_name, max_logpro))
               
