BEGIN {
FS = ","
option = ARGV[2]
delete ARGV[2]

total_p = 0
max_age = -1
oldest_name = ""
sum_age = 0
business_count = 0

}

NR > 1{
   #hitung total penumpangnya(A)
   total_p++
   
   #untuk jml gerbong (B)
   carriages[$4] = 1

   #penumpang tertua(C)
   if ($2 > max_age) {
       max_age = $2
       oldest_name = $1
   }
   #rata rata tot. usia(D)
   sum_age += $2
   
   #hitung bisnis class(E)
   if ($3 == "Business") {
       business_count++
   }
}

END {
     if (option == "a") {
         printf "Jumlah seluruh penumpang KANJ adalah %d orang\n", total_p
     } else if (option == "b") {
     count_carriage = 0
     for (c in carriages) {
         count_carriage++
       }
         printf "Jumlah gerbong PENUMPANG KANJ adalah %d\n", count_carriage
     } else if (option == "c") {
         printf "%s adalah penumpang kereta tertua dengan usia %d tahun\n", oldest_name, max_age
     
     } else if (option == "d") {
     if (total_p >0) {
         printf "Rata-rata usia penumpang adalah %d tahun\n", int(sum_age / total_p)
       }
    
     }else if (option == "e") {
         printf "Jumlah penumpang business class ada %d orang\n", business_count
     } else {
         print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
         print "Contoh penggunaan: awk -f KANJ.sh passenger.csv a"
     }
  }


