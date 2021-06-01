#!/bin/bash
echo /certificate > rsc/$1.auto.rsc
echo import file-name=$1.crt passphrase=$2 >> rsc/$1.auto.rsc
echo import file-name=$1.key passphrase=$2 >> rsc/$1.auto.rsc
echo import file-name=ca.crt passphrase=$2 >> rsc/$1.auto.rsc
echo /interface ovpn-client >> rsc/$1.auto.rsc
echo add certificate=$1.crt_0 connect-to=*** name=ovpn-out1 port=**** user=$1 profile=default auth=sha1 cipher=blowfish128 >> rsc/$1.auto.rsc
echo /ip firewall nat >> rsc/$1.auto.rsc
echo add action=masquerade chain=srcnat out-interface=ovpn-out1 >> rsc/$1.auto.rsc
echo /ip firewall filter >> rsc/$1.auto.rsc
echo add action=accept chain=input in-interface=ovpn-out1 place-before=1 >> rsc/$1.auto.rsc