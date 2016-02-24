#!/bin/bash
# untuk trace yang baik jangan hapus log dari shoutcast anda kecuali sudah benar - benar besar
# shoutcast versi 1 memungkinkan kita cek visitor dari http tapi itu hanya untuk yang akses melalui http jika direct port maka tidak terhitung
count=`ls -1 sc_serv.log 2>/dev/null | wc -l`
if [ $count = 0 ]
then
echo "tidak ada log sc_serv.log \n";
exit 0
fi


a=`date +%D`
#a="02/02/16"
# format 01/15/16

b=`less sc_serv.log | grep $a | grep starting | sed '/closed/d' | sed '/yp.shoutcast/d' | awk '{print $3}' | sed 's/]/ /'  | sed '/connected/d' | sed '/source/d' | sed '/icy/d'| sort | uniq -c | sort -n | awk '{print $2}' | wc -l`

echo "Total Akses Live Radio Streaming  pada $a sebanyak: $b, selamat";

