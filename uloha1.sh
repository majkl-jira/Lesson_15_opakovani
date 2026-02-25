#!/bin/bash

echo "Ahoj" | fold -w1 | nl -w1 -s';' > slovo.txt

cat slovo.txt | tr 'A-Z' 'a-z' > slovo.lower.txt

sort -t ';' -k2,2 slovo.lower.txt > slovo.sorted.txt

sort -t ';' -k1,1 hlaskovaci_abeceda.txt > abeceda_sorted

join -t ';' -1 2 -2 1 slovo.sorted.txt abeceda_sorted > joined.txt

sort -t ';' -k2,2n joined.txt | cut -d';' -f3 > vysledek.txt

cat vysledek.txt