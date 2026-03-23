BEGIN {
FS = ","
total_p = 0
max_age = -1
oldest_name = ""
sum_age = 0
business_count = 0
}
NR > 1{
   #hitung total penumpangnya
   total_p++
   #untuk jml gerbong 
   carriages[$2] = 1

   #penumpang tertua
   if ($3 > max_age) {
       max_age = $3
       oldest_name = $1
}
   #rata rata tot. usia
   sum_age += $3
   #hitung bisnis class
   if ($4 == "Business") {
       business_count++
   }
}
END {
     option = v

     if (option == "a") {
        printf "Jumlah seluruh penumpang KANJ adalah %d orang\n", total_p
     } else if (option == "b") {
     count_carriage = 0
     for (c in carriages) {count_carriage++}
     printf "Jumlah gerbong yang beroperasi hari ini adalah %d\n", count_carriage
     } else if (option == c) {
     printf "%s adalah penumpang kereta dengan usia %d tahun\n", oldest_name, max_age
     } else if (option == d) {
     if (total_p >0) {
         printf "Rata-rata usia penumpang adalah %.0f tahun\n", sum_age / total_p
     }
     }else if (option == "e") {
         printf "Jumlah penumpang business class ada %d orang\n", business_count
     } else {
         print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
         print "Contoh penggunaan: awk -f file.sh data.csv a"
     }
}




