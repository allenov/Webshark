#!/bin/bash
DIRLIST=$(expect -c "
    set timeout 3
    spawn ftp $1
    expect \"Name*\"
    send \"$2\n\"
    expect \"?assword:\"
    send \"$3\n\"
    expect \"ftp>\"
    send \"put lego.auto.rsc\n\"
    expect \"ftp>\"
    send \"bye\n\"
")