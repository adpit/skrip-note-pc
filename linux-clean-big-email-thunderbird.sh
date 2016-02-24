#!/bin/bash
# skrip ini dibuat karena thunderbird suka hang jika inbox lebih dari 2GB keatas
# skrip ini akan mengecek email inbox jika lebih dari 2GB semua akan di hapus yang ada di dalam inbox email spam atau email asli
# warning pastikan didalam inbox tidak ada email penting atau ganti inbox dengan folder yang sudah dibuat filter seperti spam atau notifkasi 
# gunakan crontab agar hasil lebih baik
# ubah variabel email dengan settingan thunderbird anda

user=`whoami`
path=`grep Path profiles.ini | sed 's/=/ /' | awk '{print $2}'`
email=mail.carauntuk.com # ganti dengan mail server anda seperti mail.carauntuk.com

for a in `find /home/$user/.thunderbird/$path/Mail/$mail/Inbox.sbd -type f -size +2G `; do echo > $a;done
