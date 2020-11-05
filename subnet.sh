#!/bin/bash

# Coded by 0x #

clear
echo -e "Wordlist of IP Address: "; read address
cat $address | parallel -j10 'subnet=$(timeout 8 curl -ks "https://check-host.net/ip-info?host={}" |grep "IP range" |cut -d " " -f6 |head -n2 |tr -d "abcdefghijklmnopqrstuvwxyz=/?>" |sed "s/-//1" |xargs)
rangeip=$(timeout 8 curl -ks "https://check-host.net/subnet-calculator?host=$subnet" |grep "<br />" |cut -d "<" -f1 |grep -v "-" |awk "NF>0")
echo -e "$rangeip" >> range_ip'
