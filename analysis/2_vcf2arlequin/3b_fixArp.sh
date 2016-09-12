#!/bin/bash
echo "[Profile]
  Title = \"\"
  NbSamples = 1
  DataType = DNA
  GenotypicData = 0
  LocusSeparator = WHITESPACE
  MissingData = \"?\"


[Data]
  [[Samples]]
    SampleName = \"Pop_1\"
    SampleSize = 95
    SampleData = {"
# the issue with these files is each locus is getting split up between 2 lines. The extra line proceeds with 7 tabs. Replace those with nothing
# then replace new lines with spaces. Finally replace space+tab with newline+tab
#sed 's/							//g' $1 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/ 	/\n	/g' | sed '1d' | sed 's/^	//g' | sed 's/	 1	/   1     /g' | grep -v "BLANK"
# this however messes up the header
echo "}

"
