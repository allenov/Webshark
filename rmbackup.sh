#!/bin/bash
USER=$1 # (Логин от хоста)
PASSWD@=$2 #(пасс от хоста)
HOST=$3 #(Адрес хоста)
i=$4 #(или ваше число дней) 
b=$5 #(путь к файлам как на том сервере) 
if cat /etc/issue | grep -o Debian; then 
sudo apt install curlftpfs | tee ./rmlog
else
yum install curlftpfs | tee ./rmlog
fi
mkdir -v temp-ftpfs | tee -a ./rmlog
curlftpfs ftp://$USER:$PASSWD@$HOST/ temp-ftpfs/ | tee -a ./rmlog
cd temp-ftpfs 
find ~/temp-ftpfs/$b -type f -mtime +$i -exec rm -fv {} \; | tee -a ./rmlog
