#!/bin/bash
# skrip ini akan mensortir per hari ini untuk IP yang tinggi dalam akses apache
# sebagai acuan serangan berdasarakan IP yang nantinya dapat di block dari server mengunakan firewall yang anda sukai
echo "lebih dari 100 load dalam satu hari, tidak wajar :: `hostname`";a=`date +%d/%b/%Y`;cat  /var/log/apache2/access.log | grep "$a"  | awk '{print $2}' |sort|uniq -c | sort -k1,1n | tail -1

