#!/bin/bash

cd "$1" || exit 1 

for file in *.dat; do
	(printf "%s " "$file" | sed "s/.dat//g") 
        awk '/<Overall>/ {sub(/<Overall>/, ""); count += 1; sum += $0} END {printf "%.2f\n" , sum/count}' "$file"
done | sort -k2 -n --reverse

#EOF
