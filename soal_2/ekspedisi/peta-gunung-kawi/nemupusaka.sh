lt1=$(grep -A 10 '"node_001"' gsxtrack.json|grep '"latitude"'|awk -F': ' '{print $2}'|sed 's/[",]//g')
lg1=$(grep -A 10 '"node_001"' gsxtrack.json|grep '"longitude"'|awk -F': ' '{print $2}'|sed 's/[",]//g')
lt2=$(grep -A 10 '"node_004"' gsxtrack.json|grep '"latitude"'|awk -F': ' '{print $2}'|sed 's/[",]//g')
lg2=$(grep -A 10 '"node_004"' gsxtrack.json|grep '"longitude"'|awk -F': ' '{print $2}'|sed 's/[",]//g')
ltp=$(echo "scale=6;($lt1+$lt2)/2"| bc-l)
lgp=$(echo "scale=6;($lg1+$lg2)/2"| bc-l)
echo "Koordinat pusat: $ltp, $lgp"
echo "Koordinat pusat: $ltp, $lgp" >  posisipusaka.txt
