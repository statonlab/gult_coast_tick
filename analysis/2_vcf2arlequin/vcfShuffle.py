#!/usr/bin/env python

import sys
from random import shuffle

def main():
    i_file = "all.vcf"
    o_file = "shuffle.vcf"
    i_fh = open(i_file, 'r')
    o_fh = open(o_file, 'w')

    header = []
    body   = []

    for line in i_fh:
        if line.startswith("#"):
            header.append(line)
        else:
            body.append(line)
    for line in header:
        print >>o_fh, line.rstrip()
    shuffle(body)
    counter = 1
    for line in body:
        data = line.split()
        out = ""
        for x in data[3:]:
            out = out+"	"+x
        print >>o_fh, data[0]+"	"+str(counter)+"	S1_"+str(counter)+out
        #print >>o_fh, line.rstrip()
        counter+=1
if __name__ == "__main__":
     main()
