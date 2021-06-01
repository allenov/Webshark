#!/bin/bash
awk '{print "./sh2.sh "$1 " "$2}' ./list | /bin/bash
#awk