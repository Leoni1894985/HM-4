#! /bin/sh
echo ' '
echo '1 ex'
cat bank_transactions.csv | cut -d "," -f 6 | sort | uniq -c | sort -r | head -1
echo ' '
echo '2 ex'
cat bank_transactions.csv | sed 1d | cut -d "," -f 5,10 | awk -F, '{if ( $1 == "F" ) { x=x+$2 ; y=y+1 } else { t=t+$2 ; s=s+1 } } END { print "Mean F: " x/y ; print "Mean M: " t/s }'
echo ' '
echo '3 ex'
cat bank_transactions.csv | sed 1d | cut -d "," -f 3,10 | awk -F, '{ arr[$1] = arr[$1] + $2 ; vet[$1] = vet [$1] + 1 } END { for (key in arr) print ( key , arr[key] / vet[key]/1000 )}' >> address
cat address | sort -n -r -k 2 | head -10 | awk '{ arr[$1]=$2*1000} END { for (key in arr) print (key,arr[key])}' | sort -n -r -k 2 | head -10

