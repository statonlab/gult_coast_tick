#!/usr/bin/env python
# tested on python 2.7.3

# module:      .
# input:       .
# return:      .
# description: .
# to do:       .
def PT():
    print "Just a prototype module."


# module:      usage
# input:       none
# return:      none
# description: Prints help menu for user.
# to do:       Write expanded help menu.
def usage():
    print ""
    print "Run as xDev_SNV.py --i [file.vcf] --o [base]"
    print ""
    print "If no output file is specified the output will print to stdout"

# module:      smartOpen
# input:       filename
# return:      filehandle
# description: opens a filename if specified or stdout
# to do:       none
# credit:      Wolph @ http://stackoverflow.com/questions/17602878/how-to-handle-both-with-open-and-sys-stdout-nicely
import sys
import contextlib
@contextlib.contextmanager
def smartOpen(filename=None):
    if filename and filename != '-':
        fh = open(filename, 'w')
    else:
        fh = sys.stdout
    try:
        yield fh
    finally:
        if fh is not sys.stdout:
            fh.close()

# module:      filterVCF
# input:       filename
# return:      .
# description: This module is used to read and parse a vcf file into a stream
# to do:       Change to stream
def filterVCF(i_file, listA, listB, o_file=None):
    import re
    import collections
    # read in listA (first list for comparison)
    dictA = {}
    a = open(listA, 'r')
    for line in a:
        dictA[(line.rstrip())] = line.rstrip()
    a.close()
    # read in listB (second list for comparison)
    dictB = {}
    b = open(listB, 'r')
    for line in b:
        dictB[(line.rstrip())] = line.rstrip()
    b.close()
    # open up our vcf file:
    f = open(i_file, 'r')
    # open up our output file with smart open 
    with smartOpen(o_file) as fh:
        # print file header
        print >>fh, "position", listA, listB
        # intalize header info
        loc = []
        # process lines in file
        for line in f:
            if line.startswith("##"):
                x = None
            elif line.startswith("#"):
                header = line.split()
                # get set
                for i in header[9:]:
                    loc.append(i)
            else:
                data = line.split()
                # we will use this list to check whether the line contains unique entries
                # the dictionary will store other information for printing
                checkA = {}
                checkA['0'] = 0
                checkA['1'] = 0
                checkA['.'] = 0
                checkB = {}
                checkB['0'] = 0
                checkB['1'] = 0
                checkB['.'] = 0
                for i,l in zip(header[9:],data[9:]):
                    GT = "."
                    try:
                        GT = l.split(':')
                    except:
                        GT = "."
                    # count A alleles
                    if i in dictA:
                        GTa = GT[0].split('/')
                        checkA[GTa[0]] = checkA[GTa[0]] + 1
                        checkA[GTa[1]] = checkA[GTa[1]] + 1                        
                    # count B allels
                    if i in dictB:
                        GTb = GT[0].split('/')
                        checkB[GTb[0]] = checkB[GTb[0]] + 1
                        checkB[GTb[1]] = checkB[GTb[1]] + 1
                # determine overall A GT
                if checkA['0'] > 0 and checkA['1'] == 0:
                    fGTa = "0/0"
                elif checkA['0'] == 0 and checkA['1'] > 0:
                    fGTa = "1/1"
                else:
                    fGTa = "0/1"
                # determine overall B GT
                if checkB['0'] > 0 and checkB['1'] == 0:
                    fGTb = "0/0"
                elif checkB['0'] == 0 and checkB['1'] > 0:
                    fGTb = "1/1"
                else:
                    fGTb = "0/1"
                #print >>fh, data[1], checkA['0'], checkA['1'], checkB['0'], checkB['1']
                print >>fh, data[1], fGTa, fGTb
        f.close()

# module:      splitVCF
# input:       filename
# return:      .
# description: This module is used to read and parse a vcf file into a variable amount of vcf files
# to do:       Change to stream
def splitVCF(i_file, numEntry):
    import re
    import collections
    numEntry -= 1
    f = open(i_file, 'r')
    fileNum = 0
    count = numEntry
    header = []
    # process lines in file
    for line in f:
        if line.startswith("##"):
            header.append(line)
        elif line.startswith("#"):
            header.append(line)
        else:
            if count == numEntry:
                count = 0
                fileNum += 1
                fname = "splits."+str(fileNum)
                try:
                    o.close()
                except:
                    x = 0
                o = open(fname, 'w')
                for i in header:
                    print >> o, i.rstrip()
                print >> o, line.rstrip()
                print fname
            else:
                print >> o, line.rstrip()
                count += 1
