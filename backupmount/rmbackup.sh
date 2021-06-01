#!/bin/bash
USER=$1 # (Логин от хоста)
PASSWD=$2 #(Пароль от хоста)
HOST=$3 #(IP Адрес хоста)
i=$4 #(Удалить файлы старше чем n дней) 
b=$5 #(путь к файлам хоста) 
if cat /etc/issue | grep -o Debian; then 
sudo apt install curlftpfs | tee ./rmlog
else
yum install curlftpfs | tee ./rmlog
fi
mkdir -v temp-ftpfs | tee -a ./rmlog
curlftpfs ftp://$USER:$PASSWD@$HOST/ temp-ftpfs/ | tee -a ./rmlog # (мантируем шару по Ftp-не безопасно)
cd temp-ftpfs 
find ~/temp-ftpfs/$b -type f -mtime +$i -exec rm -fv {} \; | tee -a ./rmlog # (Удаление файла старше n дней)
