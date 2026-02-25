#!/bin/bash

tr -d '\r' < sifra.txt > sifra_unix.txt
tr -d '\r' < alphabet.txt > alphabet_unix.txt
sort -t';' -k1,1 sifra_unix.txt > sifra_sorted.txt
sort -t';' -k1,1 alphabet_unix.txt > alphabet_sorted.txt

join -t';' -1 1 -2 1 -o '1.2,2.2' sifra_sorted.txt alphabet_sorted.txt > step1.txt

sort -t';' -k1,1n step1.txt > step2.txt

cut -d';' -f2 step2.txt | tr '_' ' ' | tr -d '\n'
echo