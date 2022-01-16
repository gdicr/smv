#!/bin/bash
smvfile=$1
KEY=$2

# convert .smv file to a table of SLCF or BNDF long and short labels

if [ "$KEY" == "BNDF" ]; then
  ext=bf
else
  KEY=SLCF
  ext=sf
fi
echo "\begin{tabular}{|l|l|}"
echo "\hline"
echo "$KEY Quantity & ini/ssf file Label \\\\ \hline"
grep -A 3 $KEY $smvfile | grep -v $KEY | grep -v ${ext}$  | grep -v \- | sed s/_/\\\\_/g | \
awk 'NR > 1 {print prev, "%", $0}; {prev = $0}' | \
sed -n 1~2p | sort |\
awk -F'%' '{print "{\\ct " $1 "} & {\\ct " $2 " } \\\\ \\hline"}'
echo "\end{tabular}"
