#!/bin/bash

lat1=$(awk -F', ' 'NR==1 {print $3}' titik-penting.txt)
lon1=$(awk -F', ' 'NR==1 {print $4}' titik-penting.txt)

lat2=$(awk -F', ' 'NR==4 {print $3}' titik-penting.txt)
lon2=$(awk -F', ' 'NR==4 {print $4}' titik-penting.txt)

mid_lat=$(awk "BEGIN {printf \"%.6f\", ($lat1 + $lat2)/2}")
mid_lon=$(awk "BEGIN {printf \"%.6f\", ($lon1 + $lon2)/2}")

echo "$mid_lat, $mid_lon)" > posisipusaka.txt
cat posisipusaka.txt
