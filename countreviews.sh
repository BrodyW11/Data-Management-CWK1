#!/bin/bash

for file in $1/*;  do
name=$(echo $file | awk -F"/" '{print $NF}' | sed "s/.dat//g")
reviews=$(awk '/<Author>/{sum += 1} END{print sum}' $file)
echo $name $reviews
done | sort -k2 -n --reverse
#EOF

