#!/bin/bash
# format filenya download film naruto seperti ini, dengan chappter hanya ada nomor tanpa ada nama judul filmanya
# 11.mkv
# 20.mkv
# 80.mkv
# perintah ini akan merubah seluruh nama file .mkv dengan tambahkan judul yang kita inginkan dengan nomor file / chappter yang sesuai
for a in `ls -al | grep .mkv | awk '{print $9}' | sed 's/.mkv//'`; do mv $a "Naruto Shippuuden1 ($a).mkv";done

