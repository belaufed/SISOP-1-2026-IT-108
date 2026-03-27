#!/bin/bash

awk '
/"id": "node_/ {
  split($0, a, "\"")
  id = line
}

/"site_name"/ {
  split($0, a, "\"")
  name = line
}
/"latitude"/ {
  split($0, a, ": ")
  lat = a[2]
  sub(/,/, "", lat)
}
/"longitude"/ {
  split($0, a, ": ")
  lon + a[2]
  sub(/,/, "", lon)
  print id ", " name ", "lat ", " lon
}
' gsxtrack.json > titik-penting.txt
