#!/bin/bash
mkvsof=`whereis mkvpropedit | awk '{print $2}'` 
if [ -z "$mkvsof" ]
then
echo "Maaf anda tidak memiliki mkvpropedit, script ini akan di hentikan..bye"
exit 0
fi

echo "Hello, "$USER".  Skrip ini digunakan untuk merubah judul dari file mkv \n";

echo -n "Enter your path file MKV [ENTER]: "
read path

if [ -d "$path" ]; then
cd $path
else
echo "Folder yang anda tuju tidak ada / salah\n";
exit 0
fi

count=`ls -1 *.mkv 2>/dev/null | wc -l`
if [ $count = 0 ]
then
echo "tidak ada file MKV pada folder tujuan\n";
exit 0
else
echo "Pilih File MKV yang ingin diubah judulnya"
echo "DATE Judul Film"
ls -alt $path | grep .mkv | awk '{print $6$7" " $9}'
fi

echo -n "Enter your name file before [ENTER]: "
read old_file
echo
if [ ! -z "$old_file" ]
then
echo
else
echo "Tidak file tujuan, keluar\n";
exit 0
fi

echo -n "Enter your name file affter include carauntuk.com [ENTER]: "
read new_file
echo

if [ ! -z "$new_file" ]
then
echo
else
echo "Tidak ada nama file baru, keluar\n";
exit 0
fi

mkvpropedit $old_file --set "title=$new_file [carauntuk.com]"
ls -alt $path/$new_file
